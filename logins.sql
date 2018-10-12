-- CLONE sql logins
select 
	name, 
	sid, 
	password_hash,
	command = 'CREATE LOGIN ['+name+'] WITH PASSWORD = '+CONVERT(varchar(max), password_hash, 1)+' HASHED, SID = '+ CONVERT(varchar(max), sid, 1)+',  DEFAULT_DATABASE=['+default_database_name+'], DEFAULT_LANGUAGE=['+default_language_name+'], CHECK_EXPIRATION = OFF, CHECK_POLICY = OFF;'
	--,*
from sys.sql_logins
order by 1
