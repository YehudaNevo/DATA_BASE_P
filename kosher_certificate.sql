-- Create table
create table KOSHER_CERTIFICATE
(
  kc_id      number not null,
  strat_date date not null,
  end_date   date not null,
  k_level      varchar2(20),
  ks_id      number not null
)
;
-- Create/Recreate primary, unique and foreign key constraints 
alter table KOSHER_CERTIFICATE
  add constraint PK_KC primary key (KC_ID);
alter table KOSHER_CERTIFICATE
  add constraint FK_KS_ID foreign key (KS_ID)
  references kosher_supervisor (KS_ID);
