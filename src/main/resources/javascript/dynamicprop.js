window.initDynamicPropFunction = (i) => {
   
};

window.handleDynamicPropSelection = (path) => {
   
};

window.handleNewMainNodeLoadedDynamicProp = (path) => {
   
};

window.executeDynamicPropFunction = (path) => {
   context = "";
   currentUrl = window.location.href;
   currentUrl = currentUrl.substring(currentUrl.indexOf("//")+2);  //remove protocol
   currentUrl = currentUrl.substring(currentUrl.indexOf("/")+1);  //remove domain
   if (!currentUrl.startsWith('cms')) {
       context = "/" + currentUrl.substring(0, currentUrl.indexOf("/"));
   }
   currentUrl = currentUrl.substring(currentUrl.indexOf("default/")+8);  //remove all before languageCode
   lang = currentUrl.substring(0, currentUrl.indexOf("/")); //extract current language code
   help1 = path.substring(7); 
   site = help1.substring(0, help1.indexOf("/"));  
   location.replace(context + "/cms/edit/default/" + lang + "/sites/" + site + ".dynamicProp.html?dynNode=" + path);
  
   //http://localhost:8080/cms/edit/default/en/sites/digitall.dynamicProp.html
   //handle redirection 
};
  
window.handleNewMainNodeLoadedPublicationAll = (path) => {
 
};