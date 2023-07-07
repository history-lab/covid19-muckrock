drop table if exists covid19_muckrock.emails;
create table covid19_muckrock.emails (
    email_id            integer primary key generated always as identity,
    processed           timestamp with time zone default now(),
    dc_id               integer not null references covid19_muckrock.metadata,
    file_pg_start       integer not null,
    pg_cnt              integer not null,
    header_begin_ln     integer not null,
    header_end_ln       integer not null,
    subject             text,
    sent                text,  -- timestamp with time zone,
    from_email          text,
    to_emails           text,
    cc_emails           text,
    bcc_emails          text,
    attachments         text,
    importance          text,
    body                text,
    header_unprocessed  text,
    header_validated    boolean,
    sent_str            text
    );