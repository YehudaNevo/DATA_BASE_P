-- Create table
create table KOSHER_PRODACT
(
  p_id  NUMBER not null,
  kc_id NUMBER not null
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
alter table KOSHER_PRODACT
  add constraint PK_KP primary key (P_ID, KC_ID)
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
alter table KOSHER_PRODACT
  add constraint FK_KC foreign key (KC_ID)
  references KOSHER_CERTIFICATE (KC_ID);
alter table KOSHER_PRODACT
  add constraint FK_PID foreign key (P_ID)
  references PRODACT (P_ID);
