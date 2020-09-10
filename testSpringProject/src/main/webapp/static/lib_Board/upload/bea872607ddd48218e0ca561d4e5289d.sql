select * from HR.employees;

select * from HR.departments;

select department_id, location_id from HR.departments;

select employee_id, first_name, email from HR.employees;

select job_id, department_id
from HR.employees;

SELECT
last_name, phone_number from HR.employees;

select departement_id, manager_id from HR.departments;

select
commission_pct, salary, employee_id from HR.employees;

select * from HR.employees;

desc HR.employees;

select last_name, salary, salary+300 from HR.employees;
--�ּ��̴�--

select last_name, salary, salary*12+300 from HR.employees;

--����--
--��� ������� �Ŵ� 100��ŭ�� ������ �� �ȴٰ� �Ѵ�.--
--first_name�� �޿� �׸��� ����� ���Ͻÿ�--
select first_name, salary, (salary+100)*12 from HR.employees;

select last_name, job_id, salary, commission_pct
from HR.employees;

select last_name, 12*salary*commission_pct
from HR.employees;

--�÷����� �����ϱ�--
select last_name as name, commission_pct comm
from HR.employees;

--��ҹ��� ����--
select last_name as "Name", commission_pct "comm pct"
from HR.employees;
--jsp������ ""�� ����� �������ƶ�--

--����) first_name�� '����'�̰� last_name�� '���϶�--
--'�̼���'�� ��µǵ����Ͻÿ�.--
select last_name ||' ' || first_name name, 25 literal --���ͳ�
from HR.employees;

--����) �̼����� ������ �����Դϴ�. ó�� ����Ͻÿ�
select last_name||first_name||'�� ������ '||job_id||'�Դϴ�.' job
from HR.employees;

select department_name ||
q'[, it's assigned Manager Id: ]'|| manager_id
as "Department and Manager"
from HR.departments;

select department_id from HR.employees;

--�ݺ������� ��µǴ� �μ��� �ѹ��� ���--
select DISTINCT department_id from HR.employees;

--�μ��� ������ ����Ͻÿ�.--
select distinct job_id, department_id from HR.employees;

select employee_id, last_name, job_id, department_id
from HR.employees
where department_id=90;

--������ ST_MAN�� ����� ã�ƶ�--
select employee_id, last_name, job_id, department_id
from HR.employees
where job_id='ST_MAN';

--�����͸� ���Ҷ� ��ҹ��� ����--
select last_name, job_id, department_id
from HR.employees
where last_name='Whalen';

SELECT * FROM HR.employees
WHERE LAST_NAME='King';

select * from member where user_id='highland' and user_pw='1234';

select * from HR.employees
where salary < 3000;

select * from HR.employees
where hire_date < '05/12/01';

select * from HR.employees
where first_name< 'Neena';

--����) �Ի����� 02/01/01���� 04/12/31���̿� �Ի��� ���� ���
select * from HR.employees
where hire_date >= '02/01/01' and hire_date <= '04/12/31';

select * from HR.employees
where hire_date between'02/01/01' and '04/12/31';

--�޿��� 5000 ~ 10000���̿� �ִ� ����� ���
select * from HR.employees
where salary >= 5000 and salary <= 10000;

select * from HR.employees
where salary between 5000 and 10000;

-- �̸��� 'Lex'�̰� ������ 'AD_VP'�� ����� ����Ͻÿ�--
select *from HR.employees
where first_name ='Lex' and job_id='AD_VP';

-- �μ��� 10�̰ų� 30�̰ų� 50�� ������� ����Ͻÿ�--
SELECT *from HR.employees
where department_id = 10 or department_id=30 or department_id=50;

-- �����ڰ� 100�̰ų� 120�̰ų� 110�� ����� ����Ͻÿ�
select * from HR.employees
where manager_id=100 or manager_id=120 or manager_id=110;

select * from HR.employees
where manager_id in(100,120,110);


-- �������� 1
select last_name, job_id, salary as sal from HR.employees;]

select * from hr.job_grades;

select employee_id, last_name,
salary * 12 
from HR.employees;
-- 5. sal�̶�� �÷��� ���� annual salary�� �ȵ�

select department_id, department_name, manager_id, location_id
from HR.departments;

select employee_id,last_name, job_id, hire_date startdate
from HR.employees;

select distinct job_id
from HR.employees;

select employee_id "Emp#",last_name "Employee", job_id "Job", hire_date "Hire Date"
from HR.employees;

select last_name||', '||job_id "Employee and Title"
from HR.employees;

select employee_id ||', '|| first_name||', '|| last_name||', '|| email||', '||
phone_number||', '||hire_date||', '|| job_id||', '|| salary||', '||
commission_pct||', '|| manager_id||', '|| department_id THE_OUTPUT
from HR.employees;

-- �����ϴ� 
select * from hr.employees
where last_name like '%o%' or email like '%o%';
-- % ����̶�� �� 

-- Strubg val = "o";
--String sql = "select * from hr.emplyees" + "where last_name like '%" + val + "%'" + "or email like '%" + val + "%'";

--�����ϴ�
--���� �빮�� A�� �����ϴ� 
SELECT * FROM hr.employees where first_name like 'A%';

--������ 
SELECT * FROM hr.employees where first_name like '%a';

--2002�⵵�� �Ի��� ������� ����Ͻÿ� 02�� �����ϴ� 
SELECT * FROM hr.employees where hire_date like '02%';

--�ι�° ���ڿ� 'o'�� �̸��� ���Ե� ����� ����Ͻÿ�. _ǥ��!!
SELECT * FROM hr.employees where first_name like '_o%';

--����° ���ڿ� 'o'�� ���ԵǾ� �ִ� ������� ���
select * from hr.employees where first_name like '__o%';

--�ڿ��� �̸��� �ι��� 'o'�� ���ԵǴ� ���
select * from hr.employees where first_name like 'o_';

--�̸��� sa�� ���Ե� ����� ����Ͻÿ�.
select * from hr.employees where first_name like '%sa%' or email like '%sa%';

--where�� ���� 
SELECT last_name, job_id, commission_pct FROM hr.employees;

--Ŀ�̼��� ���� ���ϴ� ��� ����Ͻÿ�.
-- null �� = �Ұ��� ���� �𸣴ϱ� is���  
SELECT * FROM hr.employees where commission_pct is null;

--Ŀ�̼��� �ް� �ִ� ��� 
select * from hr.employees where commission_pct is not null;

--�μ��� ���� ����� ����Ͻÿ�.
select * from hr.employees where department_id is null;

--and | or
--�޿��� 10000�̰ų� ������ MAN�� �����ϰ� �մ� ����� ���
SELECT * FROM hr.employees where salary = 10000 or job_id like '%MAN%';

--�޿��� 15000�̻��̸鼭 ������ 'SA_REP'�̰ų� 'AD_PRES'�� ����� ���
--select * from hr.employees where salary >= 15000 and job_id like '%SA_REP%' or salary >= 15000 and job_id like '%ad_PRES%'
select * from hr.employees where salary >= 15000 and (job_id = 'SA_REP' or job_id = 'Ad_PRES');

SELECT
    *
FROM hr.employees where salary >= 15000 and job_id in ('SA_REP','AD_PRES');

--�μ��� 30�̰� 60�� �μ����� rmqdurk 10000�̻��� ������� ���
select * from employees where (department_id = 30 or department_id = 60) and salary >= 10000; 


--����
--�̸��� ������������ �����Ͽ� ���
--�������� asc �������� desc
select * from hr.employees
order by first_name;

--�Ի����� ���� ������� ��� �Ͻÿ�.
select * from hr.employees ORDER BY hire_date asc;
--�ֱٿ� �Ի��� ������� ����Ͻÿ�.
select * from hr.employees ORDER BY hire_date desc;

desc hr.employees; --�̰� ���̺� ���� Ȯ��

--�����ȣ, ��, �޿��� ������ ����ϴµ� ������ ansal�� ���
SELECT employee_id, last_name, salary * 12 ansal FROM hr.employees;

--�� ���뿡�� ������ �������� ����Ͻÿ�.
--���Ľÿ� ��Ī�� ����� �� �ִ�. �Ǵ� ���� ��� ��. 
SELECT employee_id, last_name, salary * 12 ansal from hr.employees order by ansal;

--�μ��� ������������ ���� �ϴµ� �μ��� ������� �޿��� ���� �������� ����
--�μ� ������������ ������ �� �ȿ��� ������� �޿��� ������������ �Ѱ�
select * from hr.employees ORDER BY department_id asc, salary desc;

-- select
 -- from
 -- where
 -- order by


--50�� �μ��� //������� ������ ������������ �����ϰ� ������ ���� �޿��� ������������ ����
SELECT * FROM hr.employees where department_id = 50 order by job_id desc, salary asc;

--�޿��� 10000�� �ƴ� ������� ����Ͻÿ�. ^
SELECT * FROM hr.employees where salary != 10000;
--SELECT * FROM hr.employees where salary ^= 10000;
--SELECT * FROM hr.employees where salary <> 10000;


--������ 'SA_REP', 'AD_PRES'�� �������� ���� ������� ����Ͻÿ�.
SELECT * FROM hr.employees where job_id != 'SA_REP' and  job_id != 'Ad_PRES';
--SELECT * FROM hr.employees where job_id not in ( 'SA_REP','AD_PRES');

--����� �޿��� 3000���� �۰� 10000���ٴ� ū ����� ����Ͻÿ�
SELECT * FROM hr.employees where salary not between 3000 and 10000;

--����� �� higgins ��� ����� ����Ͻÿ�.
SELECT * FROM hr.employees where lower(last_name) = 'higgins';

SELECT last_name, lower(last_name) FROM hr.employees; 

--���� �̸��� �ٿ��� ����Ͻÿ�. �޿��� ������ ���
SELECT last_name || first_name name , salary , job_id FROM hr.employees;

SELECT concat(last_name, first_name) name , salary , job_id FROM hr.employees;

--���� �̸��� ����ϴµ� �̸��� ���̸� ���� ����Ͻÿ�.
SELECT last_name, first_name, length(first_name) FROM hr.employees;

--�����ȣ�� �̸� , ����, �޿��� ����ϴµ� ������ 4��° ���ڰ�  REF�� �����ϴ� ����� ����Ͻÿ�.
select employee_id, first_name, job_id, salary from hr.employees where job_id like '___REP';
where substr(job_id,4) = 'REP'; -- %��� �� �� ����.

--������ 4��° �� 2���ڰ� pr�� ������ ����ϽäǤ�.
SELECT * FROM hr.employees where substr (Job_id,4,2) = 'PR'; -- < 'pr' ���ؾ��Ѵ� �Ӥ��� 

--�����ȣ�� �޿�, ������ ����ϴµ� �����Ǵ� 5��°���� 3��«�� �߷�.
SELECT  * from hr.employees wehre SUBSTR(job_Id,4,3) = 'PRO';
--�����ȣ�� �޿� ������ ����ϴµ� ������ �ڿ���3��¥���� 2���� ���

SELECT employee_id, salary, job_Id, substr(job_id, -3,2)FROM hr.employees;

--������ �ڿ��� 3��¥���� 2��¦ re����� ���
select * from hr.employees where SUBSTR(job_id, -3,2) = 'RE';

--�̸��� s��� ��¥�� �ִ� ��� ���° ���� ����Ͻÿ�.(indexof())

SELECT first_name, instr(first_name,'s') FROM hr.employees; --firstName.indexOf('s');

--�̸��� 's'�� 6��°�� �ִ� ����� ����Ͻÿ�.
SELECT * FROM hr.employees where inster(first_name,'s') = 6;

--�����ȣ �� �̸����� �̸��� ���� �׸��� ���� a�� �ִ� ��ġ�� ����ϴµ� ������ 4���� ��¥���� 3���ڰ� 'REP'�λ���� ���
SELECT employee_id, last_name,instr(last_name,'a') ,length(first_name) FROM hr.employees where SUBSTR(job_id, 4, 3) = 'REP';

--�����ȣ �� �����޿��� ����ϴµ� �޿��� 1234f�� ���� 1000���� ����
SELECT employee_id, last_name, job_id, (salary-1234)/1000 FROM hr.employees;

--�� ���뿡�� ��µ� �޿��� �Ҽ��� ���ڸ� ���� ����ϰ� �Ͻÿ�.
SELECT employee_id, last_name, job_id, (salary-1235)/1000,round((salary-1235)/1000,2),round((salary-1235)/1000,0) FROM hr.employees;

select round(45.923,2),round(45.923,0),round(45.923,-1) from dual;

--���� trunc
select trunc(45.925,2),trunc(45.923,0),trunc(45.923,-1) from dual;

--���� �޿��� ����ϴµ� �޿��� 5000���� ���� �������� ���� ����Ͻÿ�.
-- �� , ������ 'SA_REP'�� ����� ����Ͻÿ�.
SELECT last_name, mod(salary,5000) FROM hr.employees where job_id = 'SA_REP';

--��¥
--���� ��¥ ���(new Date() system.out.println(new Date());
SELECT sysdate FROM dual; 
--�Ի����� 2007�� 01�� 01�� ���� ������ �������� ����Ͻÿ�.
SELECT * FROM hr.employees where hire_date < '07/01/01';

SELECT * FROM hr.employees where hire_date < to_date ('01/01/07', 'DD/MM/YY');

--�����ȣ ���� �Ի����� ����ϴ� ������� �Ի��Ϸκ��� ���ֱⰡ �Ǿ����� ���� ����Ͻÿ�.
SELECT employee_id,job_id,hire_date,(sysdate -hire_date)/7 FROM hr.employees;

--������ ����� �Ǿ����� ���
SELECT employee_id,job_id,hire_date,round((sysdate -hire_date)/365 )
FROM hr.employees;

-- �Ի����� ����� �Ǿ����� ���
SELECT employee_id, job_id, hire_date, 
       trunc(months_between(sysdate, hire_date))
FROM hr.employees;

-- �Ի����� 6������ �� ��¥�� �����Դϱ�?
-- �繫��ȣ, ����, �Ի���
SELECT employee_id, job_id, hire_date, add_months(hire_date,6) 
FROM hr.employees;

-- �Ի����� 14���� ���� ��¥
SELECT employee_id, job_id, hire_date, hire_date+14
FROM hr.employees;

-- ���� ��¥���� 14�� ���� �Ի��� ����
select * from HR.employees
where hire_date = sysdate-14;

-- �Ի��Ϸκ��� ���� �ݿ����� �����Դϱ�
select employee_id, job_id, hire_date,
       next_day(hire_date, '�ݿ���')
from HR.employees;

-- ���� ���������� ���
-- �Ի��� ���� ������ ���� ����
select employee_id, job_id, hire_date, last_day(hire_date)
from HR.employees;

-- �Ի��Ϸ� ���� 36������ ���� ������� ����Ͻÿ�
select * from HR.employees
where months_between(sysdate,hire_date) > 36;

-- ��
select * from HR.employees
where sysdate-hire_date > 36;

-- �Ի��Ϸκ��� ������ �������� ���Ͽ�
select sysdate-hire_date from HR.employees;

-- �����ȣ, ����, �Ի������, �Ի����� 4�ڸ��� ���
select employee_id, job_id, hire_date, to_char(hire_date,'yyyy-MM-DD')
from HR.employees;

select employee_id, job_id, hire_date,
to_char(hire_date, 'yyyy-MM-DD HH : MI : SS AM')
from hr.employees;

select sysdate, to_char(sysdate, 'YYYY-MM-DD HH24 : MI : SS AM')
FROM dual;

-- �����ȣ, ����, �޿� ����ϴµ� �޿� �տ� $�� ���̰� ���ڸ����� ','�� ��´�
select employee_id, job_id, to_char(salary, '$999,999')
from HR.employees;

-- �����ȣ ���� �޿��� ����ϴµ� �޿� �տ� ����ȭ��('L') ������ 
-- ���̰� ���ڸ����� ','�� �������
select employee_id, job_id, to_char(salary, 'L999,999')
from HR.employees;

-- ��¥�� 10-10-2002�� ���ĸ� ���
select * from HR.employees
where to_char(hire_date,'mm-dd-yyyy') > '10-10-2002';

select * from HR.employees
where hire_date > to_date('10-10-2002','mm-dd-yyyy');

-- �Ϲ� �Լ� : NVL NVL2 NULLIF
select employee_id, job_id, salary+salary*nvl(commission_pct,0)
from HR.employees;

select employee_id,job_id, nvl2(commission_pct, salary+salary*commission_pct,salary)
from HR.employees;

-- �����ȣ ���� ������ ���Ͻÿ�
select employee_id, job_id,salary*(1+nvl(commission_pct,0))*12
from HR.employees;

----------------------- ���� ����ϴ� ���
select employee_id,job_id, nvl2(commission_pct, 'sal+comm','sal')
from HR.employees;

-- ���� ǥ����
-- ������ 'IT_PROG'��� �޿��� 1.1�踦 �ϰ�
--       'ST_CLERK'��� �޿��� 1.15�踦 �ϰ�
--       'SA_REP'��� �޿��� 1.2�踦 �Ѵ�.
--       ������ ������ �޿��� �����Ѵ�.
-- �����ȣ, �޿�, ����, ���ǿ� ���� ��
select employee_id, salary, job_id, 
       case job_id when 'IT_PROG' then salary*1.10
                   when 'ST_CLERK' then salary*1.15
                   when 'SA_REP' then salary*1.20
       else salary end sal, hire_date
from HR.employees;

-- �޿��� 10000�̻��̸� "�̻���Դϴ�."
--          7000�̻��̸� "������Դϴ�."
--          5000�̻��̸� "������Դϴ�."
--          �������� ������� ���
-- ���� �޿��� ���� ���
select last_name, salary, job_id,
case when salary>=10000 then '�̻���Դϴ�.'
     when salary>=7000 then '������Դϴ�.'
     when salary>=5000 then '������Դϴ�.'
     else '����Դϴ�.' end
from HR.employees;

-- decode
-- ������ 'IT_PROG'��� �޿��� 1.1�踦 �ϰ�
--       'ST_CLERK'��� �޿��� 1.15�踦 �ϰ�
--       'SA_REP'��� �޿��� 1.2�踦 �Ѵ�.
--       ������ ������ �޿��� �����Ѵ�.
-- �����ȣ, �޿�, ����, ���ǿ� ���� ��
select employee_id, salary, job_id, 
       decode(job_id ,'IT_PROG' ,salary*1.10
                   ,'ST_CLERK', salary*1.15
                  , 'SA_REP', salary*1.20
       , salary ) sal, hire_date
from HR.employees;

-- �޿��� 10000�̻��̸� "�̻���Դϴ�."
--          7000�̻��̸� "������Դϴ�."
--          5000�̻��̸� "������Դϴ�."
--          �������� ������� ���
-- ���� �޿��� ���� ���
select last_name, salary, job_id,
    decode(salary>=10000, '�̻���Դϴ�.'
          ,salary>=7000, '������Դϴ�.'
          ,salary>=5000, '������Դϴ�.'
          ,'����Դϴ�.')
from HR.employees;

-- ����) �޿��� 2000���� ���� ����
--            0�̸� 0.00
--            1�̸� 0.09
--            2�̸� 0.20
--            3�̸� 0.30
--            4�̸� 0.40
--            5�̸� 0.42
--            6�̸� 0.44
--                 0.45 ��ŭ ������ �ο��ȴ�.
-- �ο��Ǵ� ������ ���
--���� �޿��� ���� ���(��, �μ��� 80�� �����) decode�� ���
select last_name, salary,
decode(trunc(salary/2000, 0),0, salary*0.00
                            ,1,salary*0.09
                            ,2,salary*0.20
                            ,3,salary*0.30
                            ,4,salary*0.40
                            ,5,salary*0.42
                            ,6,salary*0.44
                              ,salary*0.45) tax_rate
from HR.employees
where department_id =80;
                            

            
            
































