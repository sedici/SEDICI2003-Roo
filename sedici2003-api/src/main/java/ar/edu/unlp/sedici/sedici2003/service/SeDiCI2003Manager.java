package ar.edu.unlp.sedici.sedici2003.service;

import org.apache.commons.dbcp.BasicDataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import ar.edu.unlp.sedici.sedici2003.model.Personas;

public class SeDiCI2003Manager {

	private static Logger log = LoggerFactory.getLogger(SeDiCI2003Manager.class);
	private static ApplicationContext applicationContext;
	
	private static final String APPLICATION_CTX_PATH = "classpath*:/spring/sedici2003.xml";
	
	
	private SeDiCI2003Manager(){}
	
	public static void prepare(){
		if (applicationContext ==null){
			applicationContext = new ClassPathXmlApplicationContext(APPLICATION_CTX_PATH);
			log.info("Se levanta el application context  "+APPLICATION_CTX_PATH + ", el cual tiene " +applicationContext.getBeanDefinitionCount()+" beans definidos");
		}
		
	}
	
	public static void main(String[] args) {
		/*prepare();
		org.apache.commons.dbcp.BasicDataSource ds =(BasicDataSource) applicationContext.getBean("dataSourceSeDiCI2003");
		System.out.println(ds.getPassword());*/
		
		/*System.out.println("Hola 3");
		SeDiCI2003Manager.prepare();
		System.out.println(Personas.findPersonasesByApellidoYNombre("", "", 0, 0).size() + "Nico");
		System.out.println(Personas.findPersonasesByApellidoYNombreCount("", ""));*/

	}
}
