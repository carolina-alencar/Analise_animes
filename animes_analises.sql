SELECT
*
FROM animes

-- 10 Animes com mais episódios

SELECT TOP 10
	anime AS NOME,
	episodes AS QTD_EPISODIO
FROM 
	animes
ORDER BY 
	episodes DESC,

--top 3 animes mais com mais votos
SELECT TOP 3
	anime AS NOME,
	votes AS QTD_VOTOS	
FROM 
	animes
ORDER BY
	votes DESC
 
-- TOP 3 Animes com menos votos

SELECT TOP 3
	anime AS NOME,
	votes AS QTD_VOTOS
FROM 
	animes
ORDER BY
	votes ASC

-- ANIMES DE COMÉDIA, AÇÃO E AVENTURA
SELECT*
FROM
(
	SELECT
		anime,
		CASE
			WHEN [genre_action] = 10 THEN 'AÇÃO'
			WHEN [genre_adventure] = 10 THEN 'AVENTURA' 
			WHEN [genre_comedy] = 10 THEN 'COMEDIA' 
		ELSE 'Outro genero' END as genero
	FROM
		animes) AS SUB_SELECT
WHERE SUB_SELECT.genero <> 'Outro genero'

---QUANTIDADES

SELECT
	SUB_SELECT.genero,
	COUNT(*) AS quantidade
FROM
(
	SELECT
		anime,
		CASE
			WHEN [genre_action] = 10 THEN 'AÇÃO'
			WHEN [genre_adventure] = 10 THEN 'AVENTURA' 
			WHEN [genre_comedy] = 10 THEN 'COMEDIA' 
		ELSE 'Outro genero' END as genero	
	FROM 
		animes) AS SUB_SELECT
GROUP BY
	SUB_SELECT.genero
ORDER BY
	quantidade DESC

---------------------------------------------------------
