CREATE FUNCTION classementRepartitionPays ()
RETURNS TABLE(
	Country_Name varchar,
	Population_Number integer, 
	Density_value integer, 
	Importance_value varchar
)
LANGUAGE plpgsql
AS 
$$
BEGIN
	RETURN query 
		SELECT 	Country, 
				Population::integer, 
				Density ::integer, 
				case
					WHEN Density = 0 THEN 'Petite'
					WHEN Density > 0 and Population / Density < 100 THEN 'Petite'
		            WHEN Density > 0 and Population / Density BETWEEN 100 AND 9999 THEN 'Moyenne' 
		            WHEN Density > 0 and Population / Density BETWEEN 10000 AND 99999 THEN 'Haute'
		            WHEN Density > 0 and Population / Density >= 100000 THEN 'Elevée'
		       	end :: varchar as Importance
		FROM pays
		group by country, population, Importance, density 
		order by Importance asc;
END;
$$;