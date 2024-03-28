/*==============================================================*/
/* DBMS name:      PostgreSQL 15                                */
/* Created on:     11.03.2024 15:07:36                          */
/*==============================================================*/


/*==============================================================*/
/* Table: organization                                          */
/*==============================================================*/
create table organization (
   id                   bigint               not null,
   createdate           timestamp            null,
   createby             bigint               null,
   updatedate           timestamp            null,
   updateby             bigint               null,
   code                 uuid                 not null,
   text                 text                 not null,
   region_id            bigint               not null,
   customer_code        text                 not null
);

comment on table organization is
'organization';

comment on column organization.id is
'id';

comment on column organization.createdate is
'createdate';

comment on column organization.createby is
'createby';

comment on column organization.updatedate is
'updatedate';

comment on column organization.updateby is
'updateby';

comment on column organization.code is
'code';

comment on column organization.text is
'text';

comment on column organization.region_id is
'region_id';

comment on column organization.customer_code is
'Код МО по контракту(Redmine). Например: ru780012/kzvos0002';

alter table organization
   add constraint pk_organization primary key (id);

/*==============================================================*/
/* Index: i_org_code                                            */
/*==============================================================*/
create unique index i_org_code on organization (
code
);

/*==============================================================*/
/* Index: i_org_region_id                                       */
/*==============================================================*/
create  index i_org_region_id on organization (
region_id
);

/*==============================================================*/
/* Index: i_org_customer_code                                   */
/*==============================================================*/
create unique index i_org_customer_code on organization (
customer_code
);

alter table organization
   add constraint fk_org_region foreign key (region_id)
      references region (id)
      on delete restrict on update restrict;

