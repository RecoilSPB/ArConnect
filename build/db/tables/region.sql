/*==============================================================*/
/* DBMS name:      PostgreSQL 15                                */
/* Created on:     11.03.2024 15:07:36                          */
/*==============================================================*/


/*==============================================================*/
/* Table: region                                                */
/*==============================================================*/
create table region (
   id                   bigint               not null,
   createdate           timestamp            null,
   createby             bigint               null,
   updatedate           timestamp            null,
   updateby             bigint               null,
   code                 uuid                 not null,
   text                 text                 not null,
   code_reg             text                 not null
);

comment on table region is
'region';

comment on column region.id is
'id';

comment on column region.createdate is
'createdate';

comment on column region.createby is
'createby';

comment on column region.updatedate is
'updatedate';

comment on column region.updateby is
'updateby';

comment on column region.code is
'code';

comment on column region.text is
'text';

comment on column region.code_reg is
'code_reg';

alter table region
   add constraint pk_region primary key (id);

/*==============================================================*/
/* Index: i_region_code                                         */
/*==============================================================*/
create unique index i_region_code on region (
code
);

/*==============================================================*/
/* Index: i_region_code_reg                                     */
/*==============================================================*/
create unique index i_region_code_reg on region (
code_reg
);

