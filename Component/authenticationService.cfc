<!---
  --- authenticationService
  --- ---------------------
  ---
  --- author: richak
  --- date:   4/16/19
  --->
<cfcomponent name="authenticationService" accessors="true" output="false" persistent="false">
<!---doValidateUser() --->
<cffunction name="doValidateUser" access="remote" returnformat="json" returntype="array" output="false">
	<cfargument name="email" displayname="userEmail" required="true" type="string" hint="this contains userEmail">
	<cfargument name="password" displayname="userPassword" required="true" type="string" hint="this contains userPassword">
	<!--- create an error message array--->
	<cfset var errorMessage = arrayNew(1)/>
	<!--- validate the email --->
	<cfif arguments.email EQ ''>
		<cfset arrayAppend(errorMessage,'Please,provide a email')>
	</cfif>
	<cfif NOT isValid('email','arguments.email')>
	<cfset arrayAppend(errorMessage,'Please,provide a correct email')/>
	 </cfif>
<!---validate the password--->
	<cfif arguments.password EQ ''>
	<cfset arrayAppend(errorMessage,'Please,provide a password')/>
	</cfif>
	<cfreturn errorMessage/>
	</cffunction>
<!--- 	doLogin() --->
<cffunction access="remote" returnformat="json" output="false"name="doLogin"returntype="boolean">
<cfargument name="email" displayname="userEmail" required="true" type="string" hint="this contains userEmail">
	<cfargument name="password" displayname="userPassword" required="true" type="string" hint="this contains userPassword">
	<cfset isUserLoggedIn='false'/>
	<!--- get user data from database --->
	<cfquery name="getUserData" datasource="BlogSite2019">
			SELECT  [isAdmin],[firstName],[lastName],[password],[email],[picture],[areaCode],[userId]
      		FROM [BlogSite2019].[dbo].[USER]
			WHERE  email= <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.email#">
			 AND password= <cfqueryparam cfsqltype="cf_sql_varchar" value="#hash(arguments.password)#">
		</cfquery>
		<!--- check if query returns one and only one record --->
		<cfif getUserData.recordCount EQ 1>
			<!--- log the user in--->
				<cflogin>
					<cfloginuser name="#getUserData.firstName# #getUserData.lastName# " password="#getUserData.password#"roles="#getUserData.isAdmin#"/>
				</cflogin>
				<!--- save user data in session scope --->
				<cfset session.loggedInUser= {'firstName':getUserData.firstName,'lastName':getUserData.lastName,'email':getUserData.email,'userId':getUserData.userId}/>
				<cfset isUserLoggedIn=true/>
		</cfif>
		<cfreturn isUserLoggedIn/>
</cffunction>
<!---  doLogout() --->
<cffunction access="remote" returnformat="json" output="false"name="doLogout">
<cfset structdelete(session,'loggedInUser')/>
<cflogout/>
</cffunction>

<!--- isEmailUnique() --->
<cffunction name="IsEmailUnique" displayname="isEmailUnique" description="This function checks if there's any other account related to the email" hint="This function checks if there's any other account related to the email" access="remote" output="false" returnFormat="JSON" returntype="struct">
		<cfargument name="email" displayName="email" type="string" hint="This is the email id of which to test to validity." required="true" />
		<cfquery name="resultSet" datasource="BlogSite2019">
			SELECT COUNT(*) AS AVAILABLE FROM [USER] WHERE [Email] = <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar" maxlength="50" null="false">
		</cfquery>
		<cfset returnValue = StructNew()>
		<cfloop query="#resultSet#" >
			<cfif resultSet.AVAILABLE GTE 1>
				<cfset returnValue['feedback'] = "This Email is already registered." />
				<cfset returnValue['valid'] = false>
			<cfelse>
				<cfset returnValue['feedback'] = "This Email is valid." />
				<cfset returnValue['valid'] = true>
			</cfif>
		</cfloop>
		<cfreturn returnValue />
	</cffunction></cfcomponent>