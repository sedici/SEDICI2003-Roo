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
package ar.edu.unlp.sedici.sedici2003.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SeDiCI2003Manager {

	private static Logger log = LoggerFactory.getLogger(SeDiCI2003Manager.class);
	private static ApplicationContext applicationContext = null;
	private static String APP_CONTEXT_CONFIG_LOCATION = "spring/sedici2003.xml";
	
	private SeDiCI2003Manager(){}
	
	public static void prepare(String propertiesPath){
		if(SeDiCI2003Manager.applicationContext == null) {
			log.info("Iniciando contexto para SeDiCI2003-API: "+propertiesPath);
			SeDiCI2003Manager.initializeApplicationContext(propertiesPath);
		}
	}

	private static void initializeApplicationContext(String propertiesPath) {
		if(propertiesPath != null)
			System.setProperty("sedici2003_config", propertiesPath);
		
		SeDiCI2003Manager.applicationContext = new ClassPathXmlApplicationContext(APP_CONTEXT_CONFIG_LOCATION);
	}
}
