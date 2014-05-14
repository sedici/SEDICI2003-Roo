/**
 * Copyright (C) 2011 SEDICI (alira@sedici.unlp.edu.ar)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package ar.edu.unlp.sedici.sedici2003.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.apache.commons.lang.StringUtils;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooEntity(versionField = "", table = "tesauros_termino")
@RooDbManaged(automaticallyDelete = true)
public class TesaurosTermino {
	
	public static List<TesaurosTermino> findAll(String text, String[] parents, boolean includeChilds, int start, int count) {

		//if (text == null || text.length() == 0) throw new IllegalArgumentException("The text argument is required");
		if (parents == null || parents.length == 0) throw new IllegalArgumentException("The parents argument is required");
		
		if (start < 0) start = 0;
		if (count <= 0) count = 60;
		
		// Armamos el filtro de descendencia
		String parentFilter = "(";
		if(includeChilds) {
			for(String parentID : parents) {
				if(!parentID.endsWith("."))	parentID += ".";
				parentFilter += " terminos.id LIKE '"+parentID+"%' OR";
			}
		} else {
			for(String parentID : parents) {
				parentFilter += " relaciones.id.idTermino1 = '"+parentID+"' OR";
			}
		}

		//Sacamos el ultimo OR
		parentFilter = parentFilter.substring(0, parentFilter.length()-2)+ ")";
		
		String sql = "SELECT terminos " +
			"FROM TesaurosTermino AS terminos, TesaurosRelaciones AS relaciones " +
			"WHERE terminos.id = relaciones.id.idTermino2 AND relaciones.id.tipoRelacion = 1 " +
			"AND LOWER(terminos.nombreEs) LIKE LOWER(:filtro) AND " + parentFilter;
		
		//Agrego el orden
		sql=sql + " ORDER BY terminos.nombreEs ASC";

		EntityManager em = TesaurosTermino.entityManager();
		TypedQuery<TesaurosTermino> q = em.createQuery(sql, TesaurosTermino.class);
		if (text != null || text.length() != 0){
			q.setParameter("filtro", "%"+text.trim()+"%");
			
		}
		q.setFirstResult(start);
		q.setMaxResults(count);
		
		return q.getResultList();    
	}

	/**
	 * Genera el camino de terminos hasta llegar al antecesor del termino actual
	 * @param separador
	 * @return
	 */
	public static String getCamino(TesaurosTermino entity, String separador) {
		String listaIDs = "'";
		String idTermino = entity.getId();
		
		// Armamos los IDs de los antecesores a partir del id del termino actual
		while(idTermino.contains(".")) {
			idTermino = idTermino.substring(0, idTermino.lastIndexOf("."));
			listaIDs += idTermino;
			if(idTermino.contains("."))
				listaIDs += "','";
		}
		listaIDs += "'";
		
		// Armamos la query
		String sqlAntecesores = "SELECT terminos FROM TesaurosTermino AS terminos " +
				"WHERE terminos.id IN ("+listaIDs+") " +
				"ORDER BY terminos.id ASC";
		
		// Ejecutamos la query
		EntityManager em = TesaurosTermino.entityManager();
		TypedQuery<TesaurosTermino> q = em.createQuery(sqlAntecesores, TesaurosTermino.class);
		List<TesaurosTermino> antecesores = q.getResultList();    
		
		// Procesamos los resultados y armamos el camino final
		String[] terminos = new String[antecesores.size()];
		for(int i = 0; i < antecesores.size(); i++) {
			terminos[i] = antecesores.get(i).getNombreEs();
		}
		return StringUtils.join(terminos, separador);
	}
}
