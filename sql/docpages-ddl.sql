-- metadata view
drop view if exists covid19_muckrock.docpages;
create or replace view covid19_muckrock.docpages as
select d.*, p.pg, p.word_cnt, p.char_cnt, p.downloaded, 
       p.body, p.body_md5,
       case when pe.page_id is null then 'N' else 'Y'
       end exception 
    from covid19_muckrock.docs d 
            join covid19_muckrock.pages p 
                                    on (d.dc_id = p.dc_id)
            left join covid19_muckrock.page_exceptions pe
                on (p.page_id = pe.page_id);

