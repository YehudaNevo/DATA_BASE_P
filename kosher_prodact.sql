-- Create table
create table KOSHER_PRODACT
(
  p_id           number not null,
  certificate_id number
)
;
-- Create/Recreate primary, unique and foreign key constraints 
alter table KOSHER_PRODACT
  add constraint PK_KP primary key (P_ID, CERTIFICATE_ID);
alter table KOSHER_PRODACT
  add constraint FK_PID foreign key (P_ID)
  references prodact (P_ID);
alter table KOSHER_PRODACT
  add constraint FK_KC foreign key (CERTIFICATE_ID)
  references kosher_certificate (KC_ID);
