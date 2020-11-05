<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>



<template:addResources type="javascript" resources="jquery.min.js,jquery.form.min.js"/>
<template:addResources>
    <script type="text/javascript">
        function addField() {
            var counter = document.getElementById('counter').value;
          
          
            $("<div class=\"row-fluid\">" +
                "<div class=\"span4\"><input type=\"text\" name=\"label" + counter + "\" value=\"\" required class=\"span12\"/></div>" +
                "<div class=\"span7\"><input type=\"text\" name=\"value" + counter + "\" value=\"\" class=\"span12\"/></div>" +
                "<div class=\"span1\"><a class=\"btn\" onclick=\"$(this).parent().parent().remove()\"><i class=\"icon icon-minus\"></i></a></div>" +
                "</div>").insertBefore($("#addField${currentNode.identifier}"));
          
           counter++;
           document.getElementById('counter').value = counter;
        }
    </script>
</template:addResources>






<h2><jcr:nodeProperty node="${currentNode}" name="jcr:title" /> </h2>

<c:if test="${empty dynamicProp.dynNode}">
  <h3><fmt:message key="dynProp.empty.param"/></h3>
</c:if>

<c:if test="${!empty dynamicProp.dynNode}">
 
  <jcr:node var="dynNode" path="${dynamicProp.dynNode}" />
  
  <c:if test="${jcr:isNodeType(dynNode, 'jnt:dynamic_prop')}">
     
    <jsp:useBean id="notDynamicProps" class="java.util.HashMap" scope="request"/>
    <c:set target="${notDynamicProps}" property="j:nodename" value="true"/>
    <c:set target="${notDynamicProps}" property="j:originWS" value="true"/>
    <c:set target="${notDynamicProps}" property="j:fullpath" value="true"/>
    <c:set target="${notDynamicProps}" property="j:lastPublished" value="true"/>
    <c:set target="${notDynamicProps}" property="j:lastPublishedBy" value="true"/>
    <c:set target="${notDynamicProps}" property="j:published" value="true"/>
    <c:set target="${notDynamicProps}" property="jcr:baseVersion" value="true"/>
    <c:set target="${notDynamicProps}" property="jcr:created" value="true"/>
    <c:set target="${notDynamicProps}" property="jcr:createdBy" value="true"/>
    <c:set target="${notDynamicProps}" property="jcr:isCheckedOut" value="true"/>
    <c:set target="${notDynamicProps}" property="jcr:lastModified" value="true"/>
    <c:set target="${notDynamicProps}" property="jcr:lastModifiedBy" value="true"/>
    <c:set target="${notDynamicProps}" property="jcr:predecessors" value="true"/>
    <c:set target="${notDynamicProps}" property="jcr:primaryType" value="true"/>
    <c:set target="${notDynamicProps}" property="jcr:uuid" value="true"/>
    <c:set target="${notDynamicProps}" property="jcr:versionHistory" value="true"/>
    <c:set target="${notDynamicProps}" property="jcr:title" value="true"/>
    
    <c:set var="counter" value="0"/>
    <h3><jcr:nodeProperty node="${dynNode}" name="jcr:title" /> </h3>
    
    <form id="dynPropForm" action="${flowExecutionUrl}" method="post" />
        <input type="hidden" name="dynNode" value="${dynamicProp.dynNode}" />
        <c:forEach items="${dynNode.properties}" var="property">
            <c:if test="${empty notDynamicProps[property.name]}" >
              <div class="row-fluid">
                <div class="span4">
                  <input type="text" name="label${counter}" value="${property.name}" class="span12"/>  
                </div>
                <div class="span7">
                  <input type="text" name="value${counter}" value="${property.string}" class="span12"/>
                </div>
                <div class="span1"><a class="btn" onclick="$(this).parent().parent().remove()"><i class="icon icon-minus"></i></a></div>
              </div>
              
              <input type="hidden" name="hidlabel${counter}" value="${property.name}" /> 
              <c:set var="counter" value="${counter + 1}"/>
            </c:if>
         </c:forEach>
    
        <input type="hidden" name="counter" value="${counter}" id="counter"/>
    
      <a id="addField${currentNode.identifier}" class="btn" onclick="addField()"><i class="icon icon-plus"></i></a>
    
       <div style="float: right;">
              <button class="btn btn-primary" type="submit" name="_eventId_saveSettings">
                                <i class="icon-ok icon-white"></i>
                                &nbsp;<fmt:message key='dynProp.saveform'/>
             </button>
       </div>
        
    
    </form>

    
  

    
    
    
    
    
    
  </c:if>
  
  <c:if test="${not jcr:isNodeType(dynNode, 'jnt:dynamic_prop')}">
     <h3><fmt:message key="dynProp.wrongtype.param"/></h3>                                                      
  </c:if>  
  
</c:if>