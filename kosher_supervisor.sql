-- Create table
create table KOSHER_SUPERVISOR
(
  ks_id      NUMBER not null,
  ks_name    VARCHAR2(20) not null,
  ki_id      NUMBER not null,
  ks_b_data  DATE,
  commission NUMBER
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
alter table KOSHER_SUPERVISOR
  add constraint PK_KS primary key (KS_ID)
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
alter table KOSHER_SUPERVISOR
  add constraint FK_KI foreign key (KI_ID)
  references KOSHER_INSTETUTION (KI_ID);
