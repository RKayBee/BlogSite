<cfset registerComponentObject=CreateObject("component","Component.registerComponent")/>
<cfif StructKeyExists(form,"submit")>
	<cfset argsColl = structNew()/>
	 <cfset argsColl=#form#/>
	<!--  <cfdump var="#argsColl#"> -->
	<cfset authorised=registerComponentObject.validateUserDetails(argumentCollection = argsColl)>
	<cfdump var="#authorised#">
	<cfif authorised EQ true>
		<cfset isSuccessDatabase=registerComponentObject.storeUserDetails(argumentCollection = argsColl)>
		<cfdump var="#isSuccessDatabase#">
		<cfif isSuccessDatabase EQ true >
		 <CFLOCATION URL="../home.cfm" ADDTOKEN="No">
		 <cfelse>
		  <CFLOCATION URL="../register.cfm" ADDTOKEN="No">
		</cfif>
<cfelse>
		 <CFLOCATION URL="../register.cfm" ADDTOKEN="No">
</cfif>
</cfif>