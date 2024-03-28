/*==============================================================*/
/* DBMS name:      PostgreSQL 15                                */
/* Created on:     11.03.2024 15:07:36                          */
/*==============================================================*/


/*==============================================================*/
/* Table: grp                                                   */
/*==============================================================*/
create table grp (
   id                   bigint               not null,
   createdate           timestamp            null,
   createby             bigint               null,
   updatedate           timestamp            null,
   updateby             bigint               null,
   code                 uuid                 not null,
   text                 text                 not null,
   super_group          smallint             null
);

comment on table grp is
'grp';

comment on column grp.id is
'id';

comment on column grp.createdate is
'createdate';

comment on column grp.createby is
'createby';

comment on column grp.updatedate is
'updatedate';

comment on column grp.updateby is
'updateby';

comment on column grp.code is
'code';

comment on column grp.text is
'text';

comment on column grp.super_group is
'super_group';

alter table grp
   add constraint pk_grp primary key (id);

/*==============================================================*/
/* Index: i_grp_code                                            */
/*==============================================================*/
create unique index i_grp_code on grp (
code
);

/*==============================================================*/
/* Index: i_grp_super_group                                     */
/*==============================================================*/
create  index i_grp_super_group on grp (
super_group
);

