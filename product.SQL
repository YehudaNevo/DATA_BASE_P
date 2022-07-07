-- Create table
create table PRODUCT
(
  p_id   NUMBER not null,
  p_name VARCHAR2(20),
  f_id   NUMBER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table PRODUCT
  add constraint P_IDKEY primary key (P_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PRODUCT
  add constraint F_IDKEY foreign key (F_ID)
  references FACTORY (F_ID) on delete cascade;
