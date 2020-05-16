<!--- Get expanded path of the BASE path. --->
<cfset strPath = ExpandPath( "./" ) />

<!--- Get the expanded path of the CURRENT template path. --->
<cfset strPath = GetDirectoryFromPath(GetCurrentTemplatePath()) />