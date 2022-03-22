-- Create table
create table PRODACT
(
  p_id   number,
  f_id   number,
  p_name varchar2(20)
)
;
-- Create/Recreate primary, unique and foreign key constraints 
alter table PRODACT
  add constraint PK_P primary key (P_ID);
alter table PRODACT
  add constraint FK_F_ID foreign key (F_ID)
  references factory (ID);
