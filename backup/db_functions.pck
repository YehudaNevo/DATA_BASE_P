create or replace package system.DB_functions is

  -- Author  : YSGAL
  -- Created : 30/05/2022 12:15:28
  -- Purpose : 

  -- Public function and procedure declarations
  function deserveBonus (institutionName in string, bonusPer in float) return float;
  
  function addKosherRestaurant(restaurantId in integer, k_institution_id in integer, k_level in string, price in integer) return integer; 
 
  procedure updateKosherResturant ;
  
  procedure firedSupervisors (institutionId int);

end DB_functions;
/

create or replace package body system.DB_functions is



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
    
    function addKosherRestaurant
      (restaurantId in integer,
       k_institution_id in integer,
        k_level in string,
         price in integer)
      return integer is
      cursor supervisor is 
      select ks_id from
      (select * from
      ((select ks_name, ks_id, count(kc_id) as certs_nember 
       from kosher_certificate natural join kosher_supervisor
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
        SELECT dbms_random.value(100000,999999)
               into certId
                FROM dual;
        open supervisor;
        FETCH supervisor
              INTO supervisorId ;
        dbms_output.put_line(endDate);
        insert into kosher_certificate
                     (kc_id, strat_date,
                      end_date,k_level,
                      ks_id,price_pm)
               values(certId, current_date,
                     endDate, k_level,
                     supervisorId, price);
        insert into kosher_restaurant (r_id,kc_id)
        values(restaurantId, certId);
        return certId;
      end;
  
  
  procedure updateKosherResturant is
   cursor expiredCertificate is
   select * from kosher_certificate natural join kosher_restaurant
   where current_date > end_date and rownum <= 10;
   avgPm float;
   begin
         dbms_output.put_line('start');
         select avg(price_pm) into avgPm from kosher_certificate;
         dbms_output.put_line(avgPm);
         for cert in expiredCertificate
           loop
              if cert.price_pm >= avgPm then
                dbms_output.put_line('updating kosher certificate with id: ' || cert.kc_id);
                update kosher_certificate
                set end_date = add_months(current_date, 1)
                where kc_id = cert.kc_id;
              else
                 dbms_output.put_line('deleting kosher resturant with id: ' || cert.kc_id);
                 delete from kosher_restaurant
                 where kc_id = cert.kc_id;
             end if;           
          end loop;
   end;
   
   

   procedure firedSupervisors (institutionId int) is 
     cursor UnProfitableSupervisors is 
            select ks_id from
            (select sum(price_pm) as profit , ks_id, ks_name
            from kosher_supervisor natural join kosher_certificate natural join kosher_instetution
            where ki_id = institutionId 
            group by ks_id, ks_name
            order by profit asc)
            where rownum <= 3;
       cursor OtherSupervisors is 
           select ks_id from 
           (select profit, ks_id, rownum rn  from(
           select sum(price_pm) as profit , ks_id, ks_name
           from kosher_supervisor natural join kosher_certificate natural join kosher_instetution
           where ki_id = institutionId
           group by ks_id, ks_name
           order by profit asc))
           where rn > 3;
       cursor certs is 
           select kc_id, ks_id from 
           kosher_certificate natural join kosher_supervisor natural join kosher_instetution
           where ki_id = institutionId;
       newSuprevisorId int := 0;
       i float := 0;
       begin
         dbms_output.put_line('start');
         open OtherSupervisors;
         
         for id in unProfitableSupervisors
                loop
                  i := id.ks_id;
                       fetch OtherSupervisors into newSuprevisorId;
                       dbms_output.put_line('old');
                       dbms_output.put_line(id.ks_id);
                       dbms_output.put_line('new');
                       dbms_output.put_line(newSuprevisorId);
                       update kosher_certificate kc
                       set kc.ks_id = newSuprevisorId
                       where kc.ks_id = i; 
                end loop;  
           for id in UnProfitableSupervisors
             loop
               dbms_output.put_line('looop');
               dbms_output.put_line(id.ks_id);
             delete from kosher_supervisor ks
              where ks.ks_id = id.ks_id;
             end loop; 
       end; 
end;
/

