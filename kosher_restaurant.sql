-- Add/modify columns 
alter table KOSHER_RESTAURANT modify kc_id not null;
-- Drop primary, unique and foreign key constraints 
alter table KOSHER_RESTAURANT
  drop constraint PK_KR1 cascade;
-- Create/Recreate primary, unique and foreign key constraints 
alter table KOSHER_RESTAURANT
  add constraint PK_KR primary key (R_ID, KC_ID);
alter table KOSHER_RESTAURANT
  add constraint FK_KR1 foreign key (R_ID)
  references restaurant (R_ID);
alter table KOSHER_RESTAURANT
  add constraint FK_KR2 foreign key (KC_ID)
  references kosher_certificate (KC_ID);