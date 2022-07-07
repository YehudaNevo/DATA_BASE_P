----------------------------------------------
-- Export file for user SYSTEM              --
-- Created by ysgal on 07/07/2022, 07:41:30 --
----------------------------------------------

set define off
spool backup.log

prompt
prompt Creating table FACTORY
prompt ======================
prompt
@@factory.tab
prompt
prompt Creating table KOSHER_INSTETUTION
prompt =================================
prompt
@@kosher_instetution.tab
prompt
prompt Creating table KOSHER_SUPERVISOR
prompt ================================
prompt
@@kosher_supervisor.tab
prompt
prompt Creating table KOSHER_CERTIFICATE
prompt =================================
prompt
@@kosher_certificate.tab
prompt
prompt Creating table PRODUCT
prompt ======================
prompt
@@product.tab
prompt
prompt Creating table KOSHER_PRODUCT
prompt =============================
prompt
@@kosher_product.tab
prompt
prompt Creating table RESTAURANT
prompt =========================
prompt
@@restaurant.tab
prompt
prompt Creating table KOSHER_RESTAURANT
prompt ================================
prompt
@@kosher_restaurant.tab
prompt
prompt Creating package DB_FUNCTIONS
prompt =============================
prompt
@@db_functions.pck
prompt
prompt Creating trigger EXPEIRDCARTIFICATE
prompt ===================================
prompt
@@expeirdcartificate.trg
prompt
prompt Creating trigger INERT_NEW_CER
prompt ==============================
prompt
@@inert_new_cer.trg

spool off
