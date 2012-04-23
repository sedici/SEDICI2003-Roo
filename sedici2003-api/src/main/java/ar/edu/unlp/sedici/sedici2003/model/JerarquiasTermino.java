/**
 * <?xml version="1.0"?>
 * <project xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd" xmlns="http://maven.apache.org/POM/4.0.0"
 *     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
 *   <modelVersion>4.0.0</modelVersion>
 *   <parent>
 *     <artifactId>sedici2003</artifactId>
 *     <groupId>ar.edu.unlp.sedici</groupId>
 *     <version>1.8.0-rc1</version>
 *   </parent>
 *   <artifactId>sedici2003-api</artifactId>
 *   <name>sedici2003-api</name>
 *   <url>http://maven.apache.org</url>
 *
 *   <properties>
 *     <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
 *   </properties>
 *   <dependencies>
 *     <dependency>
 *       <groupId>junit</groupId>
 *       <artifactId>junit</artifactId>
 *       <version>3.8.1</version>
 *       <scope>test</scope>
 *     </dependency>
 *   </dependencies>
 * </project>
 */
package ar.edu.unlp.sedici.sedici2003.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooEntity(versionField = "", table = "jerarquias_termino")
@RooDbManaged(automaticallyDelete = true)
public class JerarquiasTermino {
	
	public static List<JerarquiasTermino> findAll(String text, String[] parents, boolean includeChilds, int start, int count) {

		if (text == null || text.length() == 0) throw new IllegalArgumentException("The text argument is required");
		if (parents == null || parents.length == 0) throw new IllegalArgumentException("The parents argument is required");
		
		if (start < 0) start = 0;
		if (count <= 0) count = 10;
		
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
			"FROM JerarquiasTermino AS terminos, JerarquiasRelaciones AS relaciones " +
			"WHERE terminos.id = relaciones.id.idTermino2 AND relaciones.tipoRelacion = 1 " +
			"AND LOWER(terminos.nombreEs) LIKE LOWER(:filtro) AND " + parentFilter ;
		
		//Agrego el orden
		sql=sql + " ORDER BY terminos.nombreEs ASC";


		EntityManager em = JerarquiasTermino.entityManager();
		TypedQuery<JerarquiasTermino> q = em.createQuery(sql, JerarquiasTermino.class);
		q.setParameter("filtro", "%"+text+"%");
		q.setFirstResult(start);
		q.setMaxResults(count);
		
		return q.getResultList();    
	}

}
