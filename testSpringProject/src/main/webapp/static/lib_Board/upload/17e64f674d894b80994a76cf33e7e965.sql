desc userorder;
desc cart;

alter table userorder
drop column user_order_date;
alter table userorder
drop column user_order_num;
commit;
alter table userorder
add(goods_image VARCHAR2(200));

alter table userorder
add(user_order_num number);

alter table userorder
add(user_order_date timestamp(6) default sysdate);

commit;

DESC USERORDER;