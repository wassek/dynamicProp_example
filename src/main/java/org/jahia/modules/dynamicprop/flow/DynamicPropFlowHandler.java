package org.jahia.modules.dynamicprop.flow;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import javax.jcr.RepositoryException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.jahia.api.Constants;
import org.jahia.services.content.JCRNodeWrapper;
import org.jahia.services.content.JCRSessionFactory;
import org.jahia.services.content.JCRSessionWrapper;
import org.springframework.webflow.core.collection.LocalParameterMap;


public class DynamicPropFlowHandler implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final Logger logger = LoggerFactory.getLogger(DynamicPropFlowHandler.class);
	
	public static Map<String, String> loadAndSave(LocalParameterMap requestParameters) {
		final HashMap<String, String> result = new HashMap<String, String>();
		if(requestParameters.contains("counter")) {
			
			long counter = requestParameters.getLong("counter");
			String dynNodePath = requestParameters.get("dynNode");
			try {
			    JCRSessionWrapper session = JCRSessionFactory.getInstance().getCurrentUserSession(Constants.EDIT_WORKSPACE);
			    JCRNodeWrapper dynNode = session.getNode(dynNodePath);
			    
			    for (int i = 0; i < counter; i++) {
			    	if (requestParameters.contains("label" + i)) {
			    		dynNode.setProperty(requestParameters.get("label" + i), requestParameters.get("value" + i));
			    		//check if on an existant property the label was changed
			    		if (requestParameters.contains("hidlabel" + i) &&
			    				!requestParameters.get("hidlabel" + i).equals(requestParameters.get("label" + i))) {
			    			//delete the old property
			    			dynNode.getProperty(requestParameters.get("hidlabel" + i)).remove();
			    		}
			    	} else if (requestParameters.contains("hidlabel" + i)) {
			    		//delete the property
			    		dynNode.getProperty(requestParameters.get("hidlabel" + i)).remove();
			    	}
			    }
			    dynNode.saveSession();
			    
			} catch (RepositoryException ex) {
				logger.error("Cannot save Dynamic Props", ex);
			}


		}
		if (requestParameters.contains("dynNode")) {
			result.put("dynNode", requestParameters.get("dynNode"));
		}
		return result;
		
		
	}
	

}
