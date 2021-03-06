-- Create table
create table KOSHER_CERTIFICATE
(
  kc_id      NUMBER not null,
  strat_date DATE not null,
  end_date   DATE not null,
  k_level    VARCHAR2(20),
  ks_id      NUMBER not null,
  price_pm   NUMBER
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
alter table KOSHER_CERTIFICATE
  add constraint PK_KC primary key (KC_ID)
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
alter table KOSHER_CERTIFICATE
  add constraint FK_KS_ID foreign key (KS_ID)
  references KOSHER_SUPERVISOR (KS_ID);
