--liquibase formatted sql
-- changeset leo:initial-squema splitStatements:false

create sequence global_id_sequence;
-- rollback drop sequence global_id_sequence cascade;

CREATE OR REPLACE FUNCTION id_generator(OUT result bigint) AS $$
DECLARE
    our_epoch bigint := 1314220021721;
    seq_id bigint;
    now_millis bigint;
    -- the id of this DB shard, must be set for each
    -- schema shard you have - you could pass this as a parameter too
    shard_id int := 1;
BEGIN
    SELECT nextval('global_id_sequence') % 1024 INTO seq_id;

    SELECT FLOOR(EXTRACT(EPOCH FROM clock_timestamp()) * 1000) INTO now_millis;
    result := (now_millis - our_epoch) << 23;
    result := result | (shard_id << 10);
    result := result | (seq_id);
END;
$$ LANGUAGE PLPGSQL;
-- rollback drop function id_generator cascade;

create table login_user (
    id bigint not null primary key default id_generator(),
    name text not null,
    email text not null,
    enabled boolean default false
);
-- rollback drop table login_user cascade;

create table role (
    id bigint not null primary key default id_generator(),
    name text not null,
    tag text not null check (tag ~ '^[A-Za-z0-9_]+$')
);
-- rollback drop table role cascade;

create table user_role (
    id bigint not null primary key default id_generator(),
    role_id bigint not null references role(id),
    user_id bigint not null references login_user(id)
);
-- rollback drop table user_role cascade;
