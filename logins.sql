-- CLONE sql logins
select 
	name, 
	sid, 
	password_hash,
	command = 'CREATE LOGIN ['+name+'] WITH PASSWORD = '+CONVERT(varchar(max), password_hash, 1)+' HASHED, SID = '+ CONVERT(varchar(max), sid, 1)+',  DEFAULT_DATABASE=['+default_database_name+'], DEFAULT_LANGUAGE=['+default_language_name+'], CHECK_EXPIRATION = OFF, CHECK_POLICY = OFF;'
	--,*
from sys.sql_logins
order by 1


-- GENERATE SID

begin tran
create login TEMP_SID_SOURCE with password = 0x02009D01C8515D9A666F3729FC219FAF1974EB4AFF55CD5A6655902BB39AB877303D5C16AD8FF5D6B8E20A16AB5007EA496262933CA320EA0C33E103A1ACC7AAB746B7BA847E hashed;
select sid from sys.sql_logins where name= 'TEMP_SID_SOURCE';
drop login TEMP_SID_SOURCE;
rollback tran
