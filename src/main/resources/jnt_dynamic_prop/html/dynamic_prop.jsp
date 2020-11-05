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


<h3>${currentNode.properties['jcr:title'].string}</h3>
<p> Dynamic Props: <br/>
        <c:forEach items="${currentNode.properties}" var="property">
            <c:if test="${empty notDynamicProps[property.name]}" >
              ${property.name}: ${property.string} <br/>
            </c:if>
         </c:forEach>
  
</p>