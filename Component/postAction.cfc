<!---
  --- authenticationService
  --- ---------------------
  --- ---------------------
  --- author: richak
  --- date:   4/16/19
  --->
<cfcomponent name="postAction" accessors="true" output="false" persistent="false">

	<!---addPost()--->
<cffunction name="addPost" access="remote" returntype="boolean" output="true" returnformat="JSON">

		<cfset dateToday = now() />

		<cfabort>

<!--- <cftry> --->
	<cfquery name="addPost" datasource="BlogSite2019">
			 Insert into [BlogSite2019].[dbo].[POST](createDate,lastModifiedDate,title,tagId,postContent) values


		<cfqueryparam cfsqltype="CF_SQL_DATE" null="false"  value="#variables.dateToday#">,
		<cfqueryparam cfsqltype="CF_SQL_DATE" null="false" value="#variables.dateToday#">,
		<cfqueryparam cfsqltype="cf_sql_varchar" null="false" value="a">,
		<cfqueryparam cfsqltype="cf_sql_integer" null="false" value="1">,
		<cfqueryparam cfsqltype="cf_sql_varchar" null="false"  value="aaaaa">

)
</cfquery>
	<cfreturn true/>
	<!--- <cfcatch type="database"> --->
<!--- 				<cfreturn false /> --->
<!--- 			</cfcatch> --->
<!--- 			</cftry> --->
	</cffunction>
<!---deletePost()--->
<!--- <cffunction name="deletePost" access="remote" returnType="void" output="false"> --->
<!--- <cfargument name="postId" displayname="postId" required="true" type="int" hint="this deletes the users post"> --->
<!--- <cfquery name="deletePost" datasource="BlogSite2019"> --->
<!---   delete from post where postId= --->

		</cfcomponent>