
<h1>Really, really bad ways to get a new Primary Key</h1>

<h2>Bad idea 1</h2>

<cfquery>
	INSERT
	INTO dbo.Users (FirstName, LastName, StateProvinceID, Email)
	VALUES ('George', 'Washington', 'NV', 'gwash@wh.org')
</cfquery>

<cfquery name="newID">
	SELECT MAX(ID) AS newID
	FROM dbo.Users
</cfquery>





<h2>Bad idea 2</h2>

<cfquery name="newID">
	INSERT
	INTO dbo.Users (FirstName, LastName, StateProvinceID, Email)
	VALUES ('George', 'Washington', 'NV', 'gwash@wh.org')

	SELECT MAX(ID) AS newID
	FROM dbo.Users
</cfquery>





<h2>Bad idea 3</h2>

<cfquery name="newID">
	INSERT
	INTO dbo.Users (FirstName, LastName, StateProvinceID, Email)
	VALUES ('George', 'Washington', 'NV', 'gwash@wh.org')

	SELECT @@Identity AS newID
</cfquery>






<h2>Bad idea 4</h2>

<cfquery name="newID">
	INSERT
	INTO dbo.Users (FirstName, LastName, StateProvinceID, Email)
	VALUES ('George', 'Washington', 'NV', 'gwash@wh.org')

	SELECT scope_identity() AS newID
</cfquery>







<h2>Bad idea 5</h2>

<cfquery name="newID">
	INSERT
	INTO dbo.Users (FirstName, LastName, StateProvinceID, Email)
	VALUES ('George', 'Washington', 'NV', 'gwash@wh.org')

	SELECT IDENT_CURRENT('Users') AS newID
</cfquery>









<h2>Finally a good idea</h2>

<p>Since SQL Server 2005</p>

<cfquery name="newID">
	INSERT
	INTO dbo.Users (FirstName, LastName, StateProvinceID, Email)
	OUTPUT inserted.ID
	VALUES ('George', 'Washington', 'NV', 'gwash@wh.org')
</cfquery>



