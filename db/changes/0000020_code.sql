--liquibase formatted sql
-- changeset leo:code splitStatements:false
create table code (
    id bigint not null primary key default id_generator(),
    user_id bigint not null references login_user(id),
    code text not null check (code ~ '^[a-z0-9]+$'),
    expires timestamp not null default current_timestamp + interval '10 minutes'
);
