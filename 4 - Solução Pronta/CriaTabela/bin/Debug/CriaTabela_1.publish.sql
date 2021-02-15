﻿/*
Deployment script for DBLocaisIBGE

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DBLocaisIBGE"
:setvar DefaultFilePrefix "DBLocaisIBGE"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Creating [dbo].[Table1]...';


GO
CREATE TABLE [dbo].[Table1] (
    [Idlocalidade]                     NVARCHAR (10) NOT NULL,
    [nomelocalidade]                   NVARCHAR (50) NULL,
    [idmunicipio]                      NVARCHAR (50) NULL,
    [nomemunicipio]                    NVARCHAR (50) NULL,
    [idmicroregiao]                    NVARCHAR (50) NULL,
    [nomemicroregiao]                  NVARCHAR (50) NULL,
    [idmesoregiao]                     NVARCHAR (50) NULL,
    [nomemesoregiao]                   NVARCHAR (50) NULL,
    [idufmesoregiao]                   NVARCHAR (10) NULL,
    [siglaufmesoregiao]                NVARCHAR (10) NULL,
    [nomeufmesoregiao]                 NVARCHAR (50) NULL,
    [idregiaoUFmesoregiao]             NVARCHAR (10) NULL,
    [siglaregiaoUFmesoregiao]          NVARCHAR (10) NULL,
    [nomeregiaoUFmesoregiao]           NVARCHAR (50) NULL,
    [idregiaoimediata]                 NVARCHAR (10) NULL,
    [nomeregiaoimediata]               NVARCHAR (50) NULL,
    [idregiaointermediaria]            NVARCHAR (10) NULL,
    [nomeregiaointermediaria]          NVARCHAR (50) NULL,
    [idufregiaointermediaria]          NVARCHAR (10) NULL,
    [siglaufregiaointermediaria]       NVARCHAR (50) NULL,
    [nomeufregiaointermediaria]        NVARCHAR (50) NULL,
    [idregiaoUFregiaointermediaria]    NVARCHAR (10) NULL,
    [siglaregiaoUFregiaointermediaria] NVARCHAR (10) NULL,
    [nomeregiaoUFregiaointermediaria]  NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Idlocalidade] ASC)
);


GO
PRINT N'Update complete.';


GO
