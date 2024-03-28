/*==============================================================*/
/* DBMS name:      PostgreSQL 15                                */
/* Created on:     11.03.2024 15:07:36                          */
/*==============================================================*/


/*==============================================================*/
/* Table: task_list                                             */
/*==============================================================*/
create table task_list (
   id                   bigint               not null,
   createdate           timestamp            null,
   createby             bigint               null,
   updatedate           timestamp            null,
   updateby             bigint               null,
   code                 uuid                 not null,
   text                 text                 not null,
   note                 text                 null,
   connect_type         varchar(10)          not null
);

comment on table task_list is
'task_list';

comment on column task_list.id is
'id';

comment on column task_list.createdate is
'createdate';

comment on column task_list.createby is
'createby';

comment on column task_list.updatedate is
'updatedate';

comment on column task_list.updateby is
'updateby';

comment on column task_list.code is
'code';

comment on column task_list.text is
'text';

comment on column task_list.note is
'note';

comment on column task_list.connect_type is
'Тип поединения: ORA, PG, HTTP';

alter table task_list
   add constraint pk_task_list primary key (id);

/*==============================================================*/
/* Index: i_tl_code                                             */
/*==============================================================*/
create unique index i_tl_code on task_list (
code
);

/*==============================================================*/
/* Index: i_tl_connect_type                                     */
/*==============================================================*/
create  index i_tl_connect_type on task_list (
connect_type
);

