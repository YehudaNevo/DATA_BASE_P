-- Create table
create table KOSHER_PRODUCT
(
  p_id NUMBER not null,
  c_id NUMBER not null
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
alter table KOSHER_PRODUCT
  add constraint KP_KEY primary key (P_ID, C_ID)
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
alter table KOSHER_PRODUCT
  add constraint C_KEY foreign key (C_ID)
  references KOSHER_CERTIFICATE (KC_ID);
alter table KOSHER_PRODUCT
  add constraint P_KEY foreign key (P_ID)
  references PRODUCT (P_ID);
