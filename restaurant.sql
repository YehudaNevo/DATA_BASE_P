-- Create table
create table RESTAURANT
(
  r_id      number not null,
  head_chef varchar2(20),
  city      varchar2(20) not null,
  r_name    varchar2(20) not null
)
;
-- Create/Recreate primary, unique and foreign key constraints 
alter table RESTAURANT
  add constraint PK_R primary key (R_ID);
