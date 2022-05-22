prompt PL/SQL Developer import file
prompt Created on יום שלישי 15 מרץ 2022 by user
set feedback off
set define off
prompt Dropping CLIENT...
drop table CLIENT cascade constraints;
prompt Dropping LOCATION...
drop table LOCATION cascade constraints;
prompt Dropping PERSON...
drop table PERSON cascade constraints;
prompt Dropping WORKER...
drop table WORKER cascade constraints;
prompt Dropping PROJECT...
drop table PROJECT cascade constraints;
prompt Dropping SPYWARE...
drop table SPYWARE cascade constraints;
prompt Dropping TARGET...
drop table TARGET cascade constraints;
prompt Dropping ACTIONREPORT...
drop table ACTIONREPORT cascade constraints;
prompt Dropping DEPARTMENT...
drop table DEPARTMENT cascade constraints;
prompt Dropping SOLD_TO...
drop table SOLD_TO cascade constraints;
prompt Dropping TEAM...
drop table TEAM cascade constraints;
prompt Creating CLIENT...
create table CLIENT
(
  cleintid       INTEGER not null,
  companyname    VARCHAR2(20) not null,
  contact        VARCHAR2(20) not null,
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
alter table CLIENT
  add primary key (CLEINTID)
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

prompt Creating LOCATION...
create table LOCATION
(
  country VARCHAR2(20) not null,
  city    VARCHAR2(20) not null,
  address VARCHAR2(20) not null
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
alter table LOCATION
  add primary key (COUNTRY, CITY, ADDRESS)
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

prompt Creating PERSON...
create table PERSON
(
  personid INTEGER not null,
  name     VARCHAR2(20) not null,
  phone    VARCHAR2(20) not null,
  country  VARCHAR2(20) not null,
  city     VARCHAR2(20) not null,
  address  VARCHAR2(20) not null
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
alter table PERSON
  add primary key (PERSONID)
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
alter table PERSON
  add foreign key (COUNTRY, CITY, ADDRESS)
  references LOCATION (COUNTRY, CITY, ADDRESS);

prompt Creating WORKER...
create table WORKER
(
  seniority VARCHAR2(20) not null,
  salary    FLOAT not null,
  personid  INTEGER not null,
  teamid    INTEGER not null
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
alter table WORKER
  add primary key (PERSONID)
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
alter table WORKER
  add foreign key (PERSONID)
  references PERSON (PERSONID);

prompt Creating PROJECT...
create table PROJECT
(
  projectid   INTEGER not null,
  projectname VARCHAR2(20) not null,
  deadline    DATE not null,
  personid    INTEGER not null
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
alter table PROJECT
  add primary key (PROJECTID)
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
alter table PROJECT
  add foreign key (PERSONID)
  references WORKER (PERSONID);

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

prompt Creating TARGET...
create table TARGET
(
  dossier  VARCHAR2(100) not null,
  personid INTEGER not null
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
alter table TARGET
  add primary key (PERSONID)
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
alter table TARGET
  add foreign key (PERSONID)
  references PERSON (PERSONID);

prompt Creating ACTIONREPORT...
create table ACTIONREPORT
(
  reportid   INTEGER not null,
  datereport DATE not null,
  findings   VARCHAR2(100) not null,
  spywareid  INTEGER not null,
  projectid  INTEGER not null,
  cleintid   INTEGER not null,
  personid   INTEGER not null
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
alter table ACTIONREPORT
  add primary key (REPORTID)
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
alter table ACTIONREPORT
  add foreign key (SPYWAREID, PROJECTID)
  references SPYWARE (SPYWAREID, PROJECTID);
alter table ACTIONREPORT
  add foreign key (CLEINTID)
  references CLIENT (CLEINTID);
alter table ACTIONREPORT
  add foreign key (PERSONID)
  references TARGET (PERSONID);

prompt Creating DEPARTMENT...
create table DEPARTMENT
(
  deptid   INTEGER not null,
  deptname VARCHAR2(20) not null,
  country  VARCHAR2(20) not null,
  city     VARCHAR2(20) not null,
  address  VARCHAR2(20) not null
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
alter table DEPARTMENT
  add primary key (DEPTID)
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
alter table DEPARTMENT
  add foreign key (COUNTRY, CITY, ADDRESS)
  references LOCATION (COUNTRY, CITY, ADDRESS);

prompt Creating SOLD_TO...
create table SOLD_TO
(
  price             FLOAT not null,
  solddate          DATE not null,
  salesreprestitive INTEGER not null,
  spywareid         INTEGER not null,
  projectid         INTEGER not null,
  cleintid          INTEGER not null
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
alter table SOLD_TO
  add primary key (SPYWAREID, PROJECTID, CLEINTID)
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
alter table SOLD_TO
  add foreign key (SPYWAREID, PROJECTID)
  references SPYWARE (SPYWAREID, PROJECTID);
alter table SOLD_TO
  add foreign key (CLEINTID)
  references CLIENT (CLEINTID);

prompt Creating TEAM...
create table TEAM
(
  teamname   VARCHAR2(20) not null,
  teamid     INTEGER not null,
  teamleader INTEGER not null,
  projectid  INTEGER not null,
  deptid     INTEGER not null
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
alter table TEAM
  add primary key (TEAMID)
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
alter table TEAM
  add foreign key (PROJECTID)
  references PROJECT (PROJECTID);
alter table TEAM
  add foreign key (DEPTID)
  references DEPARTMENT (DEPTID);
alter table TEAM
  add foreign key (TEAMLEADER)
  references WORKER (PERSONID);

prompt Disabling triggers for CLIENT...
alter table CLIENT disable all triggers;
prompt Disabling triggers for LOCATION...
alter table LOCATION disable all triggers;
prompt Disabling triggers for PERSON...
alter table PERSON disable all triggers;
prompt Disabling triggers for WORKER...
alter table WORKER disable all triggers;
prompt Disabling triggers for PROJECT...
alter table PROJECT disable all triggers;
prompt Disabling triggers for SPYWARE...
alter table SPYWARE disable all triggers;
prompt Disabling triggers for TARGET...
alter table TARGET disable all triggers;
prompt Disabling triggers for ACTIONREPORT...
alter table ACTIONREPORT disable all triggers;
prompt Disabling triggers for DEPARTMENT...
alter table DEPARTMENT disable all triggers;
prompt Disabling triggers for SOLD_TO...
alter table SOLD_TO disable all triggers;
prompt Disabling triggers for TEAM...
alter table TEAM disable all triggers;
prompt Disabling foreign key constraints for PERSON...
alter table PERSON disable constraint SYS_C007609;
prompt Disabling foreign key constraints for WORKER...
alter table WORKER disable constraint SYS_C007626;
prompt Disabling foreign key constraints for PROJECT...
alter table PROJECT disable constraint SYS_C007632;
prompt Disabling foreign key constraints for SPYWARE...
alter table SPYWARE disable constraint SYS_C007640;
prompt Disabling foreign key constraints for TARGET...
alter table TARGET disable constraint SYS_C007620;
prompt Disabling foreign key constraints for ACTIONREPORT...
alter table ACTIONREPORT disable constraint SYS_C007676;
alter table ACTIONREPORT disable constraint SYS_C007677;
alter table ACTIONREPORT disable constraint SYS_C007678;
prompt Disabling foreign key constraints for DEPARTMENT...
alter table DEPARTMENT disable constraint SYS_C007616;
prompt Disabling foreign key constraints for SOLD_TO...
alter table SOLD_TO disable constraint SYS_C007666;
alter table SOLD_TO disable constraint SYS_C007667;
prompt Disabling foreign key constraints for TEAM...
alter table TEAM disable constraint SYS_C007647;
alter table TEAM disable constraint SYS_C007648;
alter table TEAM disable constraint SYS_C007649;
prompt Loading CLIENT...
insert into CLIENT (cleintid, companyname, contact, clearencelevel)
values (1, 'Israel Police', 'Roni Alsheikh', 3);
insert into CLIENT (cleintid, companyname, contact, clearencelevel)
values (2, 'FBI', 'James Buttler', 2);
insert into CLIENT (cleintid, companyname, contact, clearencelevel)
values (3, 'Facebook', 'zuck', 1);
insert into CLIENT (cleintid, companyname, contact, clearencelevel)
values (4, 'FSB', 'vladdy P', 1);
commit;
prompt 4 records loaded
prompt Loading LOCATION...
insert into LOCATION (country, city, address)
values ('Israel', 'Haifa', 'Givhat Mordechai 1');
insert into LOCATION (country, city, address)
values ('Israel', 'Herzlyia', 'Steel Wheels 22');
insert into LOCATION (country, city, address)
values ('Israel', 'Jerusalem', 'Har Choma 31');
insert into LOCATION (country, city, address)
values ('Israel', 'Jerusalem', 'Kiryat Yovel 23');
insert into LOCATION (country, city, address)
values ('Israel', 'Raanana', 'Industry 25');
insert into LOCATION (country, city, address)
values ('Israel', 'Tel-Aviv', 'Dizingof 22');
insert into LOCATION (country, city, address)
values ('Israel', 'Tel-Aviv', 'Dizingof 99');
insert into LOCATION (country, city, address)
values ('Japan', 'Tokyo', 'Jinfoo 234');
insert into LOCATION (country, city, address)
values ('Rusia', 'Moscow', 'Komovitch 12');
insert into LOCATION (country, city, address)
values ('somalia', 'bana-east', 'Ada');
commit;
prompt 10 records loaded
prompt Loading PERSON...
insert into PERSON (personid, name, phone, country, city, address)
values (1, 'Moshe Cohen', '0506544121', 'Israel', 'Jerusalem', 'Kiryat Yovel 23');
insert into PERSON (personid, name, phone, country, city, address)
values (2, 'Avi Levi', '0527675898', 'Israel', 'Haifa', 'Givhat Mordechai 1');
insert into PERSON (personid, name, phone, country, city, address)
values (3, 'Ron Danon', '0543732665', 'Israel', 'Jerusalem', 'Har Choma 31');
insert into PERSON (personid, name, phone, country, city, address)
values (4, 'Dana Ben-Lulu', '0506455123', 'Israel', 'Tel-Aviv', 'Dizingof 22');
insert into PERSON (personid, name, phone, country, city, address)
values (5, 'Agabu Bombi', '9431234536212', 'somalia', 'bana-east', 'Ada');
insert into PERSON (personid, name, phone, country, city, address)
values (6, 'Jack Jon', '442457982371', 'Rusia', 'Moscow', 'Komovitch 12');
insert into PERSON (personid, name, phone, country, city, address)
values (7, 'Lu Phan-ing', '223243562351', 'Japan', 'Tokyo', 'Jinfoo 234');
insert into PERSON (personid, name, phone, country, city, address)
values (8, 'Yossi Ofer', '0531446239', 'Israel', 'Tel-Aviv', 'Dizingof 99');
commit;
prompt 8 records loaded
prompt Loading WORKER...
insert into WORKER (seniority, salary, personid, teamid)
values ('senior', 22345, 1, 2);
insert into WORKER (seniority, salary, personid, teamid)
values ('Middle management', 20700, 2, 2);
insert into WORKER (seniority, salary, personid, teamid)
values ('Flevel management', 15300, 3, 1);
insert into WORKER (seniority, salary, personid, teamid)
values ('Middle management', 22700, 4, 1);
commit;
prompt 4 records loaded
prompt Loading PROJECT...
insert into PROJECT (projectid, projectname, deadline, personid)
values (1, 'project Alsheikh', to_date('01-01-2012', 'dd-mm-yyyy'), 1);
insert into PROJECT (projectid, projectname, deadline, personid)
values (2, 'project zuckerberg', to_date('12-05-2011', 'dd-mm-yyyy'), 1);
insert into PROJECT (projectid, projectname, deadline, personid)
values (3, 'project Airmail', to_date('24-02-2019', 'dd-mm-yyyy'), 3);
insert into PROJECT (projectid, projectname, deadline, personid)
values (4, 'project Game on', to_date('02-04-2017', 'dd-mm-yyyy'), 3);
commit;
prompt 4 records loaded
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
prompt Loading TARGET...
insert into TARGET (dossier, personid)
values ('TZ- 3923123521 ,black hair,brown eyes,1.78,110kg ', 5);
insert into TARGET (dossier, personid)
values ('TZ- 23456732321 ,yellow hair,brown eyes,1.68,70kg ', 6);
insert into TARGET (dossier, personid)
values ('TZ- 45621324354 ,black hair,brown eyes,1.90,105kg ', 7);
insert into TARGET (dossier, personid)
values ('TZ- 876565435467 ,red hair,blue eyes,1.83,89kg ', 8);
commit;
prompt 4 records loaded
prompt Loading ACTIONREPORT...
insert into ACTIONREPORT (reportid, datereport, findings, spywareid, projectid, cleintid, personid)
values (1, to_date('26-08-2022', 'dd-mm-yyyy'), 'suspct listens to static and benel frequently - immediate action requierd', 1, 1, 1, 5);
insert into ACTIONREPORT (reportid, datereport, findings, spywareid, projectid, cleintid, personid)
values (2, to_date('13-09-2020', 'dd-mm-yyyy'), 'nothing to report ', 2, 2, 2, 6);
insert into ACTIONREPORT (reportid, datereport, findings, spywareid, projectid, cleintid, personid)
values (3, to_date('02-02-2019', 'dd-mm-yyyy'), 'made 1000 $', 3, 3, 3, 7);
insert into ACTIONREPORT (reportid, datereport, findings, spywareid, projectid, cleintid, personid)
values (4, to_date('15-02-2020', 'dd-mm-yyyy'), 'bank password is 123456', 4, 4, 4, 8);
commit;
prompt 4 records loaded
prompt Loading DEPARTMENT...
insert into DEPARTMENT (deptid, deptname, country, city, address)
values (1, 'HR', 'Israel', 'Herzlyia', 'Steel Wheels 22');
insert into DEPARTMENT (deptid, deptname, country, city, address)
values (2, 'Development', 'Israel', 'Herzlyia', 'Steel Wheels 22');
insert into DEPARTMENT (deptid, deptname, country, city, address)
values (3, 'IT', 'Israel', 'Raanana', 'Industry 25');
insert into DEPARTMENT (deptid, deptname, country, city, address)
values (4, 'Marketing', 'Israel', 'Raanana', 'Industry 25');
commit;
prompt 4 records loaded
prompt Loading SOLD_TO...
insert into SOLD_TO (price, solddate, salesreprestitive, spywareid, projectid, cleintid)
values (310200, to_date('26-06-2022', 'dd-mm-yyyy'), 3, 1, 1, 1);
insert into SOLD_TO (price, solddate, salesreprestitive, spywareid, projectid, cleintid)
values (150000, to_date('13-07-2020', 'dd-mm-yyyy'), 3, 2, 2, 2);
insert into SOLD_TO (price, solddate, salesreprestitive, spywareid, projectid, cleintid)
values (450000, to_date('02-01-2019', 'dd-mm-yyyy'), 4, 3, 3, 3);
insert into SOLD_TO (price, solddate, salesreprestitive, spywareid, projectid, cleintid)
values (375000, to_date('15-01-2020', 'dd-mm-yyyy'), 4, 4, 4, 4);
commit;
prompt 4 records loaded
prompt Loading TEAM...
insert into TEAM (teamname, teamid, teamleader, projectid, deptid)
values ('DEVHack', 1, 2, 1, 2);
insert into TEAM (teamname, teamid, teamleader, projectid, deptid)
values ('BigCrack', 2, 4, 2, 2);
commit;
prompt 2 records loaded
prompt Enabling foreign key constraints for PERSON...
alter table PERSON enable constraint SYS_C007609;
prompt Enabling foreign key constraints for WORKER...
alter table WORKER enable constraint SYS_C007626;
prompt Enabling foreign key constraints for PROJECT...
alter table PROJECT enable constraint SYS_C007632;
prompt Enabling foreign key constraints for SPYWARE...
alter table SPYWARE enable constraint SYS_C007640;
prompt Enabling foreign key constraints for TARGET...
alter table TARGET enable constraint SYS_C007620;
prompt Enabling foreign key constraints for ACTIONREPORT...
alter table ACTIONREPORT enable constraint SYS_C007676;
alter table ACTIONREPORT enable constraint SYS_C007677;
alter table ACTIONREPORT enable constraint SYS_C007678;
prompt Enabling foreign key constraints for DEPARTMENT...
alter table DEPARTMENT enable constraint SYS_C007616;
prompt Enabling foreign key constraints for SOLD_TO...
alter table SOLD_TO enable constraint SYS_C007666;
alter table SOLD_TO enable constraint SYS_C007667;
prompt Enabling foreign key constraints for TEAM...
alter table TEAM enable constraint SYS_C007647;
alter table TEAM enable constraint SYS_C007648;
alter table TEAM enable constraint SYS_C007649;
prompt Enabling triggers for CLIENT...
alter table CLIENT enable all triggers;
prompt Enabling triggers for LOCATION...
alter table LOCATION enable all triggers;
prompt Enabling triggers for PERSON...
alter table PERSON enable all triggers;
prompt Enabling triggers for WORKER...
alter table WORKER enable all triggers;
prompt Enabling triggers for PROJECT...
alter table PROJECT enable all triggers;
prompt Enabling triggers for SPYWARE...
alter table SPYWARE enable all triggers;
prompt Enabling triggers for TARGET...
alter table TARGET enable all triggers;
prompt Enabling triggers for ACTIONREPORT...
alter table ACTIONREPORT enable all triggers;
prompt Enabling triggers for DEPARTMENT...
alter table DEPARTMENT enable all triggers;
prompt Enabling triggers for SOLD_TO...
alter table SOLD_TO enable all triggers;
prompt Enabling triggers for TEAM...
alter table TEAM enable all triggers;
set feedback on
set define on
prompt Done.
