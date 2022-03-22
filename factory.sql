-- Create table
create table FACTORY
(
  id      number not null,
  name    varchar2(20),
  address varchar2(20)
)
tablespace USERS
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table FACTORY
  add constraint PK_ID primary key (ID);
