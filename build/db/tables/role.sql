/*==============================================================*/
/* DBMS name:      PostgreSQL 15                                */
/* Created on:     11.03.2024 15:07:36                          */
/*==============================================================*/


/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role (
   id                   bigint               not null,
   createdate           timestamp            null,
   createby             bigint               null,
   updatedate           timestamp            null,
   updateby             bigint               null,
   code                 uuid                 not null,
   text                 text                 not null
);

comment on table role is
'role';

comment on column role.id is
'id';

comment on column role.createdate is
'createdate';

comment on column role.createby is
'createby';

comment on column role.updatedate is
'updatedate';

comment on column role.updateby is
'updateby';

comment on column role.code is
'code';

comment on column role.text is
'text';

alter table role
   add constraint pk_role primary key (id);

/*==============================================================*/
/* Index: i_role_code                                           */
/*==============================================================*/
create unique index i_role_code on role (
code
);

