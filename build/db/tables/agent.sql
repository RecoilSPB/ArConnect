/*==============================================================*/
/* DBMS name:      PostgreSQL 15                                */
/* Created on:     11.03.2024 15:07:36                          */
/*==============================================================*/


/*==============================================================*/
/* Table: agent                                                 */
/*==============================================================*/
create table agent (
   id                   bigint               not null,
   createdate           timestamp            null,
   createby             bigint               null,
   updatedate           timestamp            null,
   updateby             bigint               null,
   code                 uuid                 not null,
   text                 text                 null,
   url                 text                 null,
   organization_id      bigint               not null
);

comment on table agent is
'agent';

comment on column agent.id is
'id';

comment on column agent.createdate is
'createdate';

comment on column agent.createby is
'createby';

comment on column agent.updatedate is
'updatedate';

comment on column agent.updateby is
'updateby';

comment on column agent.code is
'code';

comment on column agent.text is
'text';

comment on column agent.organization_id is
'organization_id';

alter table agent
   add constraint pk_agent primary key (id);

/*==============================================================*/
/* Index: i_agent_code                                          */
/*==============================================================*/
create unique index i_agent_code on agent (
code
);

/*==============================================================*/
/* Index: i_agent_org_id                                        */
/*==============================================================*/
create  index i_agent_org_id on agent (
organization_id
);

alter table agent
   add constraint fk_agent_org foreign key (organization_id)
      references organization (id)
      on delete restrict on update restrict;

