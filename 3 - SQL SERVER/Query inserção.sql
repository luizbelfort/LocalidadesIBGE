USE DBLocaisIBGE
GO

DECLARE @JSON_TABLE VARCHAR(MAX)

SELECT @JSON_TABLE = BulkColumn
FROM OPENROWSET (BULK 'C:\Projetos\Teste Técnico Quero\1 - Python\apidatafrompython.json', SINGLE_CLOB)T
SELECT 
TableA.id as [ID da Localidade],
TableA.nome as [Nome da Localidade],
Tablemunicipio.id as [ID do Municipio],
Tablemunicipio.nome as [Nome do Municipio],

Tablemicrorregiao.id as [ID da Microrregiao],
Tablemicrorregiao.nome as [Nome da Microrregiao],

Tablemesorregiao.id as [ID da Mesorregiao],
Tablemesorregiao.nome as [Nome da Mesorregiao],

TableUF.id as [ID da UF],
TableUF.nome as [Nome da UF],
TableUF.sigla as [Sigla da UF],

Tableregiao.id as [ID da Regiao],
Tableregiao.sigla as [Sigla da Regiao],
Tableregiao.nome as [Nome da Regiao]

FROM OPENJSON(@JSON_TABLE)
	WITH(
	id VARCHAR(20),
	nome NVARCHAR(MAX),
	municipio NVARCHAR(MAX) as JSON
	
	) AS TableA
CROSS APPLY OPENJSON(TableA.municipio)
	WITH(
		id VARCHAR(20),
		nome NVARCHAR(MAX),
		microrregiao NVARCHAR(MAX) AS JSON
		) AS Tablemunicipio
CROSS APPLY OPENJSON(Tablemunicipio.microrregiao)
	WITH(
		id VARCHAR(20),
		nome NVARCHAR(MAX),
		mesorregiao NVARCHAR(MAX) AS JSON
		) AS Tablemicrorregiao
CROSS APPLY OPENJSON(Tablemicrorregiao.mesorregiao)
	WITH(
		id VARCHAR(20),
		nome NVARCHAR(MAX),
		UF NVARCHAR(MAX) AS JSON
		) AS Tablemesorregiao
CROSS APPLY OPENJSON(Tablemesorregiao.UF)
	WITH(
		id VARCHAR(20),
		nome NVARCHAR(MAX),
		sigla NVARCHAR(MAX),
		regiao NVARCHAR(MAX) AS JSON
		) AS TableUF
CROSS APPLY OPENJSON(TableUF.regiao)
	WITH(
		id VARCHAR(20),
		sigla NVARCHAR(MAX),
		nome NVARCHAR(MAX)
		) AS Tableregiao