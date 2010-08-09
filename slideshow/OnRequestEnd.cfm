<cfif NOT isDefined("url.debug") AND cgi.HTTP_ACCEPT_ENCODING contains "gzip" AND REFindNoCase("MSIE 6", CGI.HTTP_USER_AGENT) eq 0 AND NOT getPageContext().getResponse().isCommitted()>
	<cfscript>
        		pageOut = getPageContext().getCFOutput().getString().trim();
        		fileOut = createobject("java", "java.io.ByteArrayOutputStream").init();
        		out = createobject("java","java.util.zip.GZIPOutputStream").init(fileOut);
        		out.write(variables.pageOut.getBytes(), 0, len(variables.pageOut.getBytes()));
        		out.finish();
        		out.close();
     		</cfscript>
	<cfif isDefined("request.last_modified") and isDate(request.last_modified)>
	  	<cfheader name="Last-Modified" value="#GetHttpTimeString(request.last_modified)#">
	<cfelse>
		<cfoutput>#request.last_modified#<cfabort></cfoutput>
	</cfif>
  	<cfheader name="Content-Encoding" value="gzip">
  	<cfheader name="Vary" value="Accept-Encoding">
	<cfparam name="request.mime_type" default="text/html">
	<cfcontent type="#request.mime_type#" reset="true" variable="#fileOut.toByteArray()#">   
</cfif>