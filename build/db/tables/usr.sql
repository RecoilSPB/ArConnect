/*==============================================================*/
/* DBMS name:      PostgreSQL 15                                */
/* Created on:     11.03.2024 15:07:36                          */
/*==============================================================*/


/*==============================================================*/
/* Table: usr                                                   */
/*==============================================================*/
create table usr (
   id                   bigint               not null,
   createdate           timestamp            null,
   createby             bigint               null,
   updatedate           timestamp            null,
   updateby             bigint               null,
   code                 uuid                 not null,
   text                 text                 not null,
   pass                 text                 not null,
   login                text                 not null,
   status               smallint             not null default '1'
);

comment on table usr is
'usr';

comment on column usr.id is
'id';

comment on column usr.createdate is
'createdate';

comment on column usr.createby is
'createby';

comment on column usr.updatedate is
'updatedate';

comment on column usr.updateby is
'updateby';

comment on column usr.code is
'code';

comment on column usr.text is
'text';

comment on column usr.pass is
'pass';

comment on column usr.login is
'login';

comment on column usr.status is
'status';

alter table usr
   add constraint pk_usr primary key (id);

/*==============================================================*/
/* Index: i_usr_code                                            */
/*==============================================================*/
create unique index i_usr_code on usr (
code
);

/*==============================================================*/
/* Index: i_usr_login                                           */
/*==============================================================*/
create unique index i_usr_login on usr (
login
);

/*==============================================================*/
/* Index: i_usr_status                                          */
/*==============================================================*/
create  index i_usr_status on usr (
status
);

