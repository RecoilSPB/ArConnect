/*==============================================================*/
/* DBMS name:      PostgreSQL 15                                */
/* Created on:     11.03.2024 15:07:36                          */
/*==============================================================*/


/*==============================================================*/
/* Table: task_object                                           */
/*==============================================================*/
create table task_object (
   id                   bigint               not null,
   createdate           timestamp            null,
   createby             bigint               null,
   updatedate           timestamp            null,
   updateby             bigint               null,
   code                 uuid                 not null,
   text                 text                 not null,
   connect_type         varchar(10)          not null,
   status               smallint             not null default '1',
   organization_id      bigint               not null
);

comment on table task_object is
'Объект для взаимодействия';

comment on column task_object.id is
'id';

comment on column task_object.createdate is
'createdate';

comment on column task_object.createby is
'createby';

comment on column task_object.updatedate is
'updatedate';

comment on column task_object.updateby is
'updateby';

comment on column task_object.code is
'code';

comment on column task_object.text is
'text';

comment on column task_object.obj_type is
'Тип физического устройства: DB, PC';

comment on column task_object.status is
'1 - активный, 0 - архивный';

comment on column task_object.organization_id is
'organization_id';

alter table task_object
   add constraint pk_task_object primary key (id);

/*==============================================================*/
/* Index: i_task_obj_code                                       */
/*==============================================================*/
create unique index i_task_obj_code on task_object (
code
);

/*==============================================================*/
/* Index: i_task_obj_obj_type                                   */
/*==============================================================*/
create  index i_task_obj_obj_type on task_object (
obj_type
);

/*==============================================================*/
/* Index: i_task_obj_status                                     */
/*==============================================================*/
create  index i_task_obj_status on task_object (
status
);

/*==============================================================*/
/* Index: i_task_obj_org_id                                     */
/*==============================================================*/
create  index i_task_obj_org_id on task_object (
organization_id
);

alter table task_object
   add constraint fk_task_obj_org foreign key (organization_id)
      references organization (id)
      on delete restrict on update restrict;

