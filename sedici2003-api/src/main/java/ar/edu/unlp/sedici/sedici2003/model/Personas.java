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

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooDbManaged(automaticallyDelete = true)
@RooEntity(versionField = "", table = "personas", finders = { "findPersonasesByApellidoLike" })
public class Personas {

	public String getApellidoYNombre(){
		return this.getApellido() + ", " + this.getNombre();
	}
	
	   public static List<Personas> findPersonasesByApellidoYNombre(String apellido, String nombre, int start,int count) {
	       if (apellido == null || apellido.length() == 0) apellido = "";
	       if (nombre == null) nombre = "";	   
	        if (start < 0) start = 0;
	        if (count <= 0) count = 20;
	      
	       apellido=Personas.convertirParaQuery(apellido);
	       nombre=Personas.convertirParaQuery(nombre);
	       
	       String where=Personas.generateCondition(apellido, nombre); 

	        EntityManager em = Personas.entityManager();
	        TypedQuery<Personas> q = em.createQuery("SELECT o FROM Personas AS o " + where + " ORDER BY o.apellido, o.nombre ASC", Personas.class);
	        if (apellido.length() != 0)
	        	q.setParameter("apellido", apellido);
	        if (nombre.length() != 0)
	        	q.setParameter("nombre", nombre);
	        q.setFirstResult(start);
	        q.setMaxResults(count);
	        return q.getResultList();
	        
	    }
	   

	   public Instituciones getInstitucion() {
		   if(this.getIdInstitucion() == 0)
			   return null;
		   return Instituciones.findInstituciones( this.getIdInstitucion() );
	   }

	   public Dependencias getDependencia() {
		   if(this.getIdDependencia() == 0)
			   return null;
		   return Dependencias.findDependencias( this.getIdDependencia() );
	   }

	   
   public static int findPersonasesByApellidoYNombreCount(String apellido,String nombre) {
       if (apellido == null || apellido.length() == 0) apellido = "";
       if (nombre == null) nombre = "";
      
       apellido=Personas.convertirParaQuery(apellido);
       nombre=Personas.convertirParaQuery(nombre);
       
       String where=Personas.generateCondition(apellido, nombre);
       
       /*if (apellido == null || apellido.length() == 0) apellido="";
       if (nombre == null) nombre = "";
	   String where=Personas.generateCondition(apellido, nombre);*/


       EntityManager em = Personas.entityManager();
       Query q = em.createQuery("SELECT count(o) FROM Personas AS o " + where );
       if (apellido.length() != 0)
       	q.setParameter("apellido", apellido);
       if (nombre.length() != 0)
       	q.setParameter("nombre", nombre);
       return Integer.valueOf(q.getResultList().get(0).toString());   
    }	   



private static String convertirParaQuery(String valor) {
	if (valor.length() != 0){
		valor = valor.replace('*', '%');
	    //if (valor.charAt(0) != '%') 
	    //	valor = "%" + valor;
	    if (valor.charAt(valor.length() - 1) != '%')
	    	valor = valor + "%";
	}
	return valor;
}

//Genera la condicion de where para una consulta dependiendo de los parrámetros
   //apellido y nombre vienen vacios en caso de no tener valores recibidos
   private static String generateCondition(String apellido,String nombre){
	   String where="";
       if (apellido.length() != 0){
    	   where = "WHERE LOWER(o.apellido) LIKE LOWER(:apellido)";
       }
       if (nombre.length() != 0){
	        where += " AND LOWER(o.nombre) LIKE LOWER(:nombre)";
       }           
       return where;
   }
	    

}
