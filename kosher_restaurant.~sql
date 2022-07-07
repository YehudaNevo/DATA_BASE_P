-- Create table
create table KOSHER_RESTAURANT
(
  r_id  NUMBER not null,
  cr_id NUMBER not null
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
alter table KOSHER_RESTAURANT
  add constraint KR_PK primary key (R_ID, CR_ID)
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
alter table KOSHER_RESTAURANT
  add constraint CR_FK foreign key (CR_ID)
  references KOSHER_CERTIFICATE (KC_ID);
alter table KOSHER_RESTAURANT
  add constraint R_FK foreign key (R_ID)
  references RESTAURANT (R_ID);
