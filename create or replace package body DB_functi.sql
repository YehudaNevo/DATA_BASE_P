create or replace package body DB_functions is



  -- Function and procedure implementations
  function deserveBonus (institutionName in string, bonusPer in float)
     return float is 
    cursor supervisors is
    select sum(price_pm) * commission as profit, ks_name, ks_id from 
    kosher_supervisor natural join kosher_certificate natural join kosher_instetution
    where ki_name = institutionName
    group by ks_name, ks_id, commission;
    totalBonus float default 0;
    bonus float default 0;
    begin
      dbms_output.put_line('start');
      for c in supervisors 
       loop
         bonus := bonusPer * c.profit;
         dbms_output.put_line(c.ks_name || ' bonus: '|| bonus);
         totalBonus := totalBonus + bonus;
         end loop;
      return totalBonus;
    end;
    
    function addKosherRestaurant(restaurantId in integer, k_institution_id in integer, k_level in string, price in integer)
      return integer is
      cursor supervisor is 
      select ks_id from
      (select * from
      ((select ks_name, ks_id, count(kc_id) as certs_nember  from 
      kosher_certificate natural join kosher_supervisor
      group by ks_name, ks_id)
      natural join (kosher_instetution))
      where ki_id = k_institution_id
      order by certs_nember asc)
      where ROWNUM = 1;
      supervisorId int := 0 ;
      certId int := 0;
      endDate date := add_months(current_date, 12);
      begin
        dbms_output.put_line('start'); 
        SELECT dbms_random.value(100000,999999) into certId FROM dual;
        open supervisor; 
        FETCH supervisor INTO supervisorId ;
        dbms_output.put_line(endDate);
        insert into kosher_certificate (kc_id, strat_date,end_date,k_level,ks_id,price_pm) values(certId, current_date, endDate, k_level, supervisorId, price);
        insert into kosher_restaurant (r_id,kc_id)values(restaurantId, certId);
        return certId;
      end;
  
  
   procedure updateKosherResturant is
   cursor expiredCertificate is 
   select * from kosher_certificate natural join kosher_restaurant
   where current_date > end_date and rownum <= 10;
   avgPm number;
   begin
         dbms_output.put_line('start');
         select avg(price_pm) into avgPm from kosher_certificate;
         dbms_output.put_line(avgPm);
         for cert in expiredCertificate
           loop 
             if cert.price_pm >= avgPm then
                update kosher_certificate kc
                set end_date = add_months(current_date, 1)
                where kc.kc_id = cert.kc_id;
               else
                 delete from kosher_restaurant kr
                 where kr.kc_id = cert.kc_id;       
             end if; 
          end loop;  
   end;  
     

end;