-- Create table
create table KOSHER_INSTETUTION
(
  ki_id    number not null,
  ki_name  varchar2(20) not null,
  ki_stamp varchar2(20)
)
tablespace USERS
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table KOSHER_INSTETUTION
  add constraint PK_KI primary key (KI_ID);
