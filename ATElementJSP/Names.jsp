<%@page import="com.ibm.workplace.wcm.api.DocumentId"%>
<%@page import="com.ibm.workplace.wcm.api.DocumentTypes"%>
<%@page import="com.ibm.workplace.wcm.api.DocumentType"%>
<%@page import="com.ibm.workplace.wcm.api.DocumentIdIterator"%>
<%@page import="com.ibm.workplace.wcm.api.Workspace"%>
<%@page import="com.ibm.workplace.wcm.api.WCM_API"%>
<%@page import="com.ibm.workplace.wcm.api.Repository"%>
<%@ taglib uri="/WEB-INF/tld/portlet.tld" prefix="portletAPI" %>
<%@ page import="com.ibm.workplace.wcm.api.authoring.CustomItemBean", com.ibm.workplace.wcm.api.exceptions.* %>


    
    <%
       String id="";
       Repository repo=WCM_API.getRepository();      
       Workspace workspace=repo.getWorkspace(request.getUserPrincipal());
       workspace.setCurrentDocumentLibrary(workspace.getDocumentLibrary("IIC Content"));       
       DocumentIdIterator authoringTemplates=workspace.findByName(DocumentTypes.AuthoringTemplate, "Workshop"); 
       if(authoringTemplates.hasNext()){
       DocumentId docid=(DocumentId)authoringTemplates.next();
       id=docid.getId();
       
       }   
       
       
    %>


<h3>Please select a tasks:</h3>
 <h5><a href=”?wcmAuthoringAction=new&type= com.ibm.workplace.wcm.api.WCM_Content&atid=<%=id%>”>Create Content</a></h5>
  <h5><a href=”?wcmAuthoringAction=openmainview&type=mydrafts”> My Drafts</a></h5>
   <h5><a href=”?wcmAuthoringAction=openmainview&view= mypendingapproval”>View Content Requiring My Approval</a></h5> 
   <h5><a href=”?wcmAuthoringAction=openmainview&view=contentbytitle”> View Published Content</a></h5>