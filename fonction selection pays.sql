CREATE FUNCTION selectionPays (nomPays varchar)
RETURNS TABLE(
	Country_Name varchar, 
	Population_Number integer, 
	Yearly_Change DECIMAL, 
	Net_Change integer,
	Density_value integer, 
	Land_Area integer, 
	Migrants_Value DECIMAL, 
	Fertility_Rate DECIMAL,
	Medium_Age integer,
	Urban_Population_Percent integer, 
	World_Share DECIMAL
)
LANGUAGE plpgsql
AS 
$$
BEGIN
	RETURN query 
		SELECT Country, Population::integer, YearlyChange::DECIMAL, NetChange ::integer, Density ::integer, LandArea ::integer, Migrants ::DECIMAL, FertRate::DECIMAL, MedAge::integer , UrbanPop::integer, WorldShare ::DECIMAL  
		FROM pays
		WHERE country = nomPays;
END;
$$;