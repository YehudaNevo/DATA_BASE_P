CREATE OR REPLACE TRIGGER INERT_NEW_CER
BEFORE INSERT ON KOSHER_CERTIFICATE
    FOR EACH ROW
    --DISABLE
    DECLARE
       -- pragma autonomous_transaction;
       cert_count PLS_INTEGER;
       super_name char(20);
       super_com float;
       new_com float;
BEGIN
    -- IF THE SUPERVISOR HAVE MORE THEN 5 CERTIFICATE THEN ...
    select count(*) into cert_count from
    kosher_supervisor ks natural join kosher_certificate kc
    where ks_id = :new.ks_id
    group by ks_id;

    select ks_name, commission into super_name, super_com
    from kosher_supervisor
    where ks_id = :new.ks_id;

    dbms_output.put_line('trigger');
    -- raise an exception if the customer has at least one order
    IF cert_count > 10 THEN
      dbms_output.put_line('Cannot insert new cert because ' || super_name || 'already have more then 9 certs');
      raise_application_error(-20010,'Cannot insert new cert because ' || super_name || 'already have more then 9 certs');
    END IF;

    dbms_output.put_line('old commission: ' || super_com);
    super_com := super_com * 0.95;

    update kosher_supervisor
    set commission = super_com
    where ks_id = :new.ks_id;

    select commission into new_com
    from kosher_supervisor
    where ks_id = :new.ks_id;

    dbms_output.put_line('new commision ' || new_com);
END;
