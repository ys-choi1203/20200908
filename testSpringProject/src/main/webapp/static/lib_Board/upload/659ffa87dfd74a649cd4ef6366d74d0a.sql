desc userOrder;


create table userOrder(
   GOODS_NAME         VARCHAR2(20), 
GOODS_PRICE        NUMBER,        
QTY                NUMBER,        
TOTAL_PRICE        NUMBER,        
USER_ID            VARCHAR2(20),  
COLOR_OPTION       VARCHAR2(200), 
SIZE_OPTION        VARCHAR2(200), 
GOODS_IMAGE        VARCHAR2(200), 
USER_ORDER_NUM     NUMBER,        
USER_ORDER_DATE    TIMESTAMP(6)
);
desc userOrder;
commit;

select * from member;

delete member where user_id='yundar';