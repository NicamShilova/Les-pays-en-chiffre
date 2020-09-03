DO $$ 
    BEGIN
        ALTER TABLE pays ADD COLUMN DateUpdate Date;
    EXCEPTION
        WHEN duplicate_column THEN RAISE NOTICE ' column DateUpdate already exists in pays.';
    END;
$$

CREATE OR REPLACE FUNCTION audit_pays() RETURNS TRIGGER AS $dateupdate_audit$
BEGIN
	UPDATE pays SET DateUpdate = now() where id IN(SELECT max(id) FROM pays);
	RETURN NEW;
END;
$dateupdate_audit$
language plpgsql;
        
CREATE TRIGGER dateupdate_audit
    AFTER INSERT ON pays
    FOR EACH ROW EXECUTE PROCEDURE audit_pays();