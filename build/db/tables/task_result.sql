/*==============================================================*/
/* DBMS name:      PostgreSQL 15                                */
/* Created on:     11.03.2024 15:07:36                          */
/*==============================================================*/


/*==============================================================*/
/* Table: task_result                                           */
/*==============================================================*/
create table task_result (
   id                   bigint               not null,
   createdate           timestamp            null,
   createby             bigint               null,
   updatedate           timestamp            null,
   updateby             bigint               null,
   task_info_id         bigint               not null,
   code                 uuid                 not null,
   message              text                 null,
   status               smallint             null
);

comment on table task_result is
'task_result';

comment on column task_result.id is
'id';

comment on column task_result.createdate is
'createdate';

comment on column task_result.createby is
'createby';

comment on column task_result.updatedate is
'updatedate';

comment on column task_result.updateby is
'updateby';

comment on column task_result.task_info_id is
'task_info_id';

comment on column task_result.code is
'code';

comment on column task_result.message is
'message';

comment on column task_result.status is
'status';

alter table task_result
   add constraint pk_task_result primary key (id);

/*==============================================================*/
/* Index: i_task_res_ti_id                                      */
/*==============================================================*/
create  index i_task_res_ti_id on task_result (
task_info_id
);

/*==============================================================*/
/* Index: i_task_res_code                                       */
/*==============================================================*/
create unique index i_task_res_code on task_result (
code
);

/*==============================================================*/
/* Index: i_task_res_status                                     */
/*==============================================================*/
create  index i_task_res_status on task_result (
status
);

alter table task_result
   add constraint fk_task_result_task_info foreign key (task_info_id)
      references task_info (id)
      on delete restrict on update restrict;

