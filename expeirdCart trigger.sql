CREATE OR REPLACE TRIGGER expeirdCartificate
AFTER DELETE ON KOSHER_RESTAURANT
FOR EACH ROW
DECLARE
    pragma autonomous_transaction;
    res_name char(20);
    res_city char(20);
    instetusion char(20);
    supervisor char(20);
BEGIN
    select r_name, city into res_name, res_city
    from kosher_restaurant natural join restaurant
    where r_id = :old.r_id;
    select ks_name, ki_name into supervisor, instetusion
    from kosher_certificate kc natural join kosher_supervisor natural join kosher_instetution
    where kc.kc_id = :old.kc_id;
    dbms_output.put_line('The restaurant ' || res_name );
    dbms_output.put_line('in ' || res_city);
    dbms_output.put_line('is no longer under our supervision');
    dbms_output.put_line( 'kosher instetution ' || instetusion);
    dbms_output.put_line('for detailes contact ' || supervisor);
END;
