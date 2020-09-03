CREATE PROCEDURE
	insertionPays(CountryName varchar)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO pays (Country, Population, YearlyChange, NetChange, Density, LandArea, Migrants, FertRate, MedAge, UrbanPop, WorldShare) VALUES (
		CountryName, random() * 1000000000, 
		random() * 10, 
		random() * 10000000, 
		random() * 10000, 
		random() * 10000000, 
		random() * 1000000, 
		random() * 10, 
		random() * 100, 
		random() * 100, 
		random() * 10
	);
END
$$;
