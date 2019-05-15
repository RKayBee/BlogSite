<!---
  --- remoteService
  --- -------------
  ---
  --- author: richak
  --- date:   5/2/19
  --->
<cfcomponent displayname="remoteService" accessors="true" output="false" persistent="false">
	<cffunction  name="handleAjaxRequest" access="remote" returntype="boolean" output="true">


		<CFIF isJSON(form)>
		<cfset myJSONvar = deserializeJSON(form)/>
		<cfdump var="#myJSONvar#">
		</cfif>

		<cfreturn true/>
	</cffunction>
</cfcomponent>