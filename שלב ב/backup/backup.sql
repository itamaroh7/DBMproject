prompt PL/SQL Developer import file
prompt Created on יום שלישי 15 מרץ 2022 by user
set feedback off
set define off
prompt Dropping SPYWARE...
drop table SPYWARE cascade constraints;
prompt Creating SPYWARE...
create table SPYWARE
(
  spywareid      INTEGER not null,
  projectid      INTEGER not null,
  spywarename    VARCHAR2(40) not null,
  platform       VARCHAR2(40) not null,
  type           VARCHAR2(40) not null,
  clearencelevel INTEGER not null
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
alter table SPYWARE
  add primary key (SPYWAREID, PROJECTID)
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
alter table SPYWARE
  add foreign key (PROJECTID)
  references PROJECT (PROJECTID);

prompt Disabling triggers for SPYWARE...
alter table SPYWARE disable all triggers;
prompt Disabling foreign key constraints for SPYWARE...
alter table SPYWARE disable constraint SYS_C007640;
prompt Loading SPYWARE...
insert into SPYWARE (spywareid, projectid, spywarename, platform, type, clearencelevel)
values (1, 1, 'Pegasus-a', 'andorid', 'remote trojan horse', 3);
insert into SPYWARE (spywareid, projectid, spywarename, platform, type, clearencelevel)
values (2, 2, 'Pegasus-iso', 'iso', 'remote trojan horse', 3);
insert into SPYWARE (spywareid, projectid, spywarename, platform, type, clearencelevel)
values (3, 3, 'zuckernerg 2000', 'windows', 'key logger', 1);
insert into SPYWARE (spywareid, projectid, spywarename, platform, type, clearencelevel)
values (4, 4, 'bill form microsoft support', 'windows', 'cryptominer', 1);
commit;
prompt 4 records loaded
prompt Enabling foreign key constraints for SPYWARE...
alter table SPYWARE enable constraint SYS_C007640;
prompt Enabling triggers for SPYWARE...
alter table SPYWARE enable all triggers;
set feedback on
set define on
prompt Done.
