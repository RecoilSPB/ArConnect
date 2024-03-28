/*==============================================================*/
/* DBMS name:      PostgreSQL 15                                */
/* Created on:     11.03.2024 15:07:36                          */
/*==============================================================*/


/*==============================================================*/
/* Table: user_connection                                       */
/*==============================================================*/
create table user_connection (
   id                   bigint               not null,
   createdate           timestamp            null,
   createby             bigint               null,
   updatedate           timestamp            null,
   updateby             bigint               null,
   code                 uuid                 not null,
   text                 varchar(50)          not null
);

comment on table user_connection is
'user_connection';

comment on column user_connection.id is
'id';

comment on column user_connection.createdate is
'createdate';

comment on column user_connection.createby is
'createby';

comment on column user_connection.updatedate is
'updatedate';

comment on column user_connection.updateby is
'updateby';

comment on column user_connection.code is
'code';

comment on column user_connection.text is
'text';

alter table user_connection
   add constraint pk_user_connection primary key (id);

/*==============================================================*/
/* Index: i_user_conn_code                                      */
/*==============================================================*/
create unique index i_user_conn_code on user_connection (
code
);

/*==============================================================*/
/* Index: i_user_conn_text                                      */
/*==============================================================*/
create unique index i_user_conn_text on user_connection (
text
);

