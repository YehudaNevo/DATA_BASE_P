-- Create table
create table KOSHER_SUPERVISOR
(
  ks_id     number not null,
  ks_name   varchar2(20) not null,
  ki_id     number not null,
  ks_b_data date
)
;
-- Create/Recreate primary, unique and foreign key constraints 
alter table KOSHER_SUPERVISOR
  add constraint PK_KS primary key (KS_ID);
alter table KOSHER_SUPERVISOR
  add constraint FK_KI foreign key (KI_ID)
  references kosher_instetution (KI_ID);
