use shoppy;
select database();
show tables;
select * from information_schema.views where table_schema = 'shoppy';
select * from member;
select * from product;
desc product;

select  pid,
        concat('images/', image) as image
from product;        

select  p.pid,
		name,
        price,
        info,
        rate,
        concat('images/', image) as image,
        img_list as imgList,
        title_ko,
        title_en,
        list
	from product p, product_detailinfo pd 
    where p.pid = pd.pid and p.pid = 1;

show tables;
select * from product_detailinfo;

--