create table XXX_t (id number (3) primary key, name varchar2(50));

insert into XXX_t (id, name) values (1, 'Kate');
insert into XXX_t (id, name) values (2, 'Alina');
insert into XXX_t (id, name) values (3, 'Anna');
commit;

update XXX_T set name = 'Lena' where id = 2;
update XXX_T set name = 'Sonya' where id = 3;
commit;

select count(*) as TotalCount
from XXX_t
where id > 1;
    
delete from XXX_t where id = 3;
commit;

create table XXX_t_child (  id_child number(3) primary key,
                            id_parent number(3),
                            name varchar2(50),
    constraint fk_xxx_t foreign key (id_parent) references XXX_t(id))

insert into XXX_t_child (id_child, id_parent, name) values (1, 2, 'Stas');
insert into XXX_t_child (id_child, id_parent, name) values (2, 1, 'Masha');

select XXX_t.id, XXX_t.name, XXX_t_child.name 
    from XXX_t inner join XXX_t_child 
        on XXX_t.id = XXX_t_child.id_parent;

select XXX_t.id, XXX_t.name, XXX_t_child.name 
    from XXX_t left join XXX_t_child 
        on XXX_t.id = XXX_t_child.id_parent;

select XXX_t.id, XXX_t.name, XXX_t_child.name 
    from XXX_t right join XXX_t_child 
        on XXX_t.id = XXX_t_child.id_parent;

drop table XXX_t_child;
drop table XXX_t;