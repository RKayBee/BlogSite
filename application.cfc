<cfcomponent displayname="My Application cfc" hint="This is the default configuration for this project." accessors="true" output="false">
	<cfset this.name = "BlogSite" >
	<cfset this.sessionManagement = true >
	<cfset this.datasource ="BlogSite2019">
<!---onApplicationStart() method--->
	<cffunction name="onApplictionStart" returntype="boolean">
		<cfset application.registerComponentObject=CreateObject("component","Component.registerComponent")/>
		<cfset application.authenticationServiceObject=CreateObject("component","Component.authenticationService")/>
		<cfreturn true/>
	 </cffunction>
	<!---onRequest() method--->
<cffunction name="OnRequest" returntype="void" displayname="OnRequest" hint="Called whenever a requested." access="public" output="true">
		<cfargument name="targetPage" displayName="targetPage" type="string" hint="The target page which will be opened" required="true" />
		<cfinclude template="#arguments.targetPage#">
	</cffunction>
</cfcomponent>