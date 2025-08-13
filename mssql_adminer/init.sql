IF DB_ID(N'$(DB_NAME)') IS NULL
BEGIN
  PRINT 'Creating database $(DB_NAME)...';
  EXEC('CREATE DATABASE [' + '$(DB_NAME)' + ']');
END
GO

IF NOT EXISTS (SELECT 1 FROM sys.sql_logins WHERE name = N'$(APP_LOGIN)')
BEGIN
  PRINT 'Creating login $(APP_LOGIN)...';
  EXEC('CREATE LOGIN [' + '$(APP_LOGIN)' + '] WITH PASSWORD = N''' + '$(APP_PASSWORD)' + ''', CHECK_POLICY = ON, CHECK_EXPIRATION = OFF;');
END
GO

PRINT 'Creating user and granting db_owner...';
DECLARE @sql NVARCHAR(MAX) = N'
USE [' + '$(DB_NAME)' + '];
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N''' + '$(APP_LOGIN)' + ''')
  CREATE USER [' + '$(APP_LOGIN)' + '] FOR LOGIN [' + '$(APP_LOGIN)' + '];
ALTER ROLE db_owner ADD MEMBER [' + '$(APP_LOGIN)' + '];';
EXEC sp_executesql @sql;
GO