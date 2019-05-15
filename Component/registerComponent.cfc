
<cfcomponent name="utilComponent" displayname="utilComponent" hint="for entry into database">


	<cffunction name="validateUserDetails" access="remote" displayname="validate_User_Details" returntype="boolean" output="false" hint="this method performs validation on server side">
		<cfargument name="firstName" required="true" type="string" hint="this is the first name of the user">
		<cfargument name="middleName" type="string" hint="this is the middle name of the user(optional)" default="">
		<cfargument name="lastName" required="true" type="string" hint="this is the last name of the user">
		<cfargument name="email" type="string" required="true" hint="this is users email id.it needs to be unique">
		<cfargument name="password" type="string" required="true" hint="this is users password .It is required for login.">
		<cfargument name="confirmPassword" type="string" required="true" hint="this need to be same as password.">
		<cfargument name="areaCodeMain" type="string" required="true"hint="this is area code used with phone number to contact the user">
		<cfargument name="presentCity" type="string" required="true" hint="this is the city name where user resides">
		<cfargument name="presentState" type="numeric" required="true" hint="this is the state where the user resides">
		<cfargument name="presentCountry" type="numeric" required="true" hint="this is the country where the user resides">
		<cfargument name="streetAddress" type="string" required="true" hint="this is streetAddress of user.">
		<cfargument name="presentZip" type="numeric" required="true" hint="this is zip/pin code of user's location'.">
		<cfargument name="phoneMain" type="numeric" required="true" hint="this is the contact number of the user.">

<cfdump var="#arguments#">
<cfdump var="#form#">
<cfabort>

		<!-- server side validation -->
		<cfset isAllDefined= true/>

			<cfif form.firstName EQ '' OR NOT isValid("regex",arguments.lastName,"^[a-zA-Z]+(\'?[a-zA-Z]+)?$")>
				<cfset isAllDefined=false/>

			</cfif>
			<cfif form.lastName EQ '' OR  NOT isValid("regex",arguments.lastName,"^[a-zA-Z]+(\'?[a-zA-Z]+)?$")>
				<cfset isAllDefined=false/>

			</cfif>
			<cfif form.middleName NEQ ''AND NOT isValid("regex",arguments.middleName,"^[a-zA-Z]+(\'?[a-zA-Z]+)?$")>
				<cfset isAllDefined=false/>

							</cfif>
			<cfif form.email EQ ''OR NOT isValid("regex",arguments.email,"^[a-zA-Z]*[a-zA-Z0-9\_\.]*[a-zA-Z][\@]([a-zA-Z]+[\.])+[a-zA-Z]+$")>
				<cfset isAllDefined=false/>


			</cfif>
			<cfif form.areaCodeMain EQ ''OR NOT isValid("regex",arguments.areaCodeMain,"^[0-9]{2}([\-][0-9]{3,4})?$")>
				<cfset isAllDefined=false/>

			</cfif>
			<cfif form.presentZip EQ ''OR NOT isValid("regex",arguments.presentZip,"[1-9][0-9]{4,5}")>
				<cfset isAllDefined=false/>

			</cfif>
			<cfif form.presentCity EQ ''OR NOT isValid("regex",arguments.presentCity,"^[a-zA-Z]+(\'?[a-zA-Z]+)?$")>
				<cfset isAllDefined=false/>

			</cfif>
			<cfif form.phoneMain EQ ''OR NOT isValid("regex",arguments.phoneMain,"^[1-9][0-9]{9}$")>
				<cfset isAllDefined=false/>

			</cfif>
			<cfif form.streetAddress EQ ''OR NOT isValid("regex",arguments.streetAddress,"^[a-zA-Z0-9 /,]+([/-]+[a-zA-Z0-9 /,/.]*)$")>
				<cfset isAllDefined=false/>

			</cfif>
			<cfif form.password EQ '' OR  len(form.password) LT 5>
				<cfset isAllDefined=false/>



			</cfif>
			<cfif form.confirmPassword EQ ''>
				<cfset isAllDefined=false/>

			</cfif>
			<cfif form.presentState EQ ''>
				<cfset isAllDefined=false/>

			</cfif>
			<cfif form.presentCountry EQ ''>
				<cfset isAllDefined=false/>


			</cfif>
			<cfif form.password NEQ form.confirmPassword>
				<cfset isAllDefined=false/>

			</cfif>
				<cfreturn isAllDefined/>
</cffunction>
<!-- this stores data in the USER table upon successful registration -->
	<cffunction name="storeUserDetails" access="remote" displayname="store_User_Details" returntype="boolean" output="false" hint="this method stores users details into database once verification is successful">
	<cfargument name="firstName" required="true" type="string" hint="this is the first name of the user">
		<cfargument name="middleName" type="string" hint="this is the middle name of the user(optional)" default="">
		<cfargument name="lastName" required="true" type="string" hint="this is the last name of the user">
		<cfargument name="email" type="string" required="true" hint="this is users email id.it needs to be unique">
		<cfargument name="password" type="string" required="true" hint="this is users password .It is required for login.">
		<cfargument name="confirmPassword" type="string" required="true" hint="this need to be same as password.">
		<cfargument name="areaCodeMain" type="string" required="true"hint="this is area code used with phone number to contact the user">
		<cfargument name="presentCity" type="string" required="true" hint="this is the city name where user resides">
		<cfargument name="presentState" type="numeric" required="true" hint="this is the state where the user resides">
		<cfargument name="presentCountry" type="numeric" required="true" hint="this is the country where the user resides">
		<cfargument name="streetAddress" type="string" required="true" hint="this is streetAddress of user.">
		<cfargument name="presentZip" type="numeric" required="true" hint="this is zip/pin code of user's location'.">
		<cfargument name="phoneMain" type="numeric" required="true" hint="this is the contact number of the user.">
	<cftry>


			<cfquery name="queryAddUser" datasource="BlogSite2019">

				INSERT INTO [USER] (firstName, middleName, lastName,password,email,areaCode,contactNumber,stateId,city,countryId,streetAddress) VALUES
					(
						<cfqueryparam cfsqltype="cf_sql_varchar" null="false" maxlength="30" value="#arguments.firstName#">,
						<cfqueryparam cfsqltype="cf_sql_varchar" null="true" maxlength="30" value="#arguments.middleName#">,
						<cfqueryparam cfsqltype="cf_sql_varchar" null="false" maxlength="30" value="#arguments.lastName#">,
						<cfqueryparam cfsqltype="cf_sql_varchar" null="false" value="#hash(arguments.password)#">,
						<cfqueryparam cfsqltype="cf_sql_varchar" null="false" maxlength="50" value="#arguments.email#">,
						<cfqueryparam cfsqltype="cf_sql_varchar" null="false" value="#arguments.areaCodeMain#">,
						<cfqueryparam cfsqltype="cf_sql_bigint" null="false" value="#arguments.phoneMain#">,
						<cfqueryparam cfsqltype="cf_sql_integer" null="false" value="#arguments.presentState#">,
						<cfqueryparam cfsqltype="cf_sql_varchar" null="false" value="#arguments.presentCity#">,
						<cfqueryparam cfsqltype="cf_sql_integer" null="false" value="#arguments.presentCountry#">,
						<cfqueryparam cfsqltype="cf_sql_varchar" null="false" maxlength="500" value="#arguments.streetAddress#">
						)
			</cfquery>
			<cfreturn true/>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
			</cftry>
	</cffunction>
</cfcomponent>
