select * from hr.employees;

--�����ϴ� 
select * from hr.employees
where last_name like '%o%' or email like '%o%';

-- �����ϴ�
-- ���� 'A'�� �����ϴ� �̸��� ����Ͻÿ�.
select * from hr.employees
where first_name like 'A%';
-- ������
--���� �̸��� 'a'�� ������ ����� �˻��Ͻÿ�.
select * from hr.employees
where first_name like '%a';

-- 2002�⵵�� �Ի��� ������� ����Ͻÿ�.
select * from hr.employees
where hire_date like '02%';

-- �ι�° ���ڿ� 'o'�� �̸��� ���Ե� ����� ����Ͻÿ�.
select * from hr.employees
where first_name like '_o%';

-- ����° ���ڿ� 'o'�� ���ԵǾ� �ִ� ����� ����Ͻÿ�.
select * from hr.employees
where first_name like '__o%';

-- �ڿ��� �̸��� �ι�°�� 'o'�� ���ԵǾ� �ִ� ����� ����Ͻÿ�.
select * from hr.employees
where first_name like '%o_';

-- �̸��� �̸��Ͽ� sa�� ���Ե� ����� ����Ͻÿ�.
select * from hr.employees
where first_name like '%sa%' or email like '%sa%';

select  last_name, job_id, commission_pct
from hr.employees;

-- Ŀ�̼��� ���� ���ϴ� ��� ����Ͻÿ�.
select * from hr.employees
where commission_pct is null;

-- Ŀ�̼��� �޴� ��� ����Ͻÿ�.
select * from hr.employees
where commission_pct is not null;
-- �μ��� ���� ����� ����Ͻÿ�.
select * from hr.employees
where department_id is null;

-- and | or
-- �޿��� 10000�̰ų� ������ MAN�� �����ϰ� �ִ� ����� ����Ͻÿ�.
select * from hr.employees
where salary = 10000 or job_id like '%MAN%';

-- �޿��� 15000�̻��̸鼭 ������ 'SA_REP'�̰ų� 'Ad_PRES'�� 
-- ����� ����Ͻÿ�.
select * from hr.employees
where salary >= 15000 and (job_id = 'SA_REP' or job_id = 'Ad_PRES'); 

select * from hr.employees
where salary >= 15000 and job_id in( 'SA_REP', 'Ad_PRES');

-- �μ��� 30�̰� 60�� �μ����� �޿��� 10000�̻��� ������� ����Ͻÿ�.
select * from hr.employees
where (department_id = 30 or department_id = 60)
and salary >= 10000;

-- ����
--- �̸��� ������������ �����Ͽ� ���
select * from hr.employees
order by first_name ;

-- �Ի����� ���� ������� ����Ͻÿ�.
select * from hr.employees
order by hire_date asc;

-- �ֱٿ� �Ի��� ������� ����Ͻÿ�.
select * from hr.employees
order by hire_date desc;
-- table ���� Ȯ��
DESCRIBE HR.employees;

-- �����ȣ, ��, ����� ����ϴµ� ����� ansal�� ����Ͻÿ�.
select employee_id, last_name, salary * 12 ansal
from hr.employees;
-- �� ���뿡�� ����� ������������ ����Ͻÿ�.
select employee_id , last_name, salary * 12 ansal
from hr.employees
order by ansal; -- ���Ľÿ� ��Ī�� ����� �� �ִ�.
select employee_id , last_name, salary * 12 ansal
from hr.employees
order by 3;

-- �μ��� ������������ �����ϰ�
-- ���� �μ��� ������� �޿��� ����������� �����Ͻÿ� 
select * from hr.employees
order by department_id asc, salary desc;

-- 50�κμ��� ������� ������ ������������ �����ϰ� 
-- ������ ���� �޿��� ���� �������� �����Ͻÿ�.
select * 
from hr.employees
where department_id = 50
order by job_id desc, salary asc;
-- �޿��� 10000�� �ƴ� ������� ����Ͻÿ�.
select * from hr.employees
where salary != 10000;
-- where salary ^= 10000;
-- where salary <> 10000;

-- ������ 'SA_REP', 'Ad_PRES'�� �������� ���� ������� ����Ͻÿ�.
select * from hr.employees
where job_id not in ('SA_REP','Ad_PRES');
select * from hr.employees
where job_id != 'SA_REP' and job_id != 'Ad_PRES';

-- ���� ����� �޿��� 3000���� �۰� 10000���ٴ� ū ����� ����Ͻÿ�.
select * from hr.employees
where salary not between 3000 and 10000;


-- ����� �� Higgins��� ����� ����Ͻÿ�.
select * from HR.employees
where last_name = 'Higgins';

-- ����� �� higgins��� ����� ����Ͻÿ�.
select * from HR.employees
where lower(last_name) = 'higgins';

select last_name , lower(last_name) from hr.employees;

-- ���� �̸��� �ٿ��� ����Ͻÿ�. �޿��� ������ ���� ����Ͻÿ�.
select last_name || first_name name , salary, job_id
from hr.employees;
select concat(last_name , first_name) name , salary, job_id
from hr.employees;

-- ���� �̸��� ����ϴµ� �̸��� ���̸� ���� ����Ͻÿ�.
select last_name, first_name, length(first_name)
from HR.employees;

-- �����ȣ�� �̸� , ����, �޿��� ����ϴµ� ������ 4��°��¥�� REF��
-- �����ϴ� ����� ���Ͻÿ�.
select employee_id, first_name, job_id, salary
from hr.employees
where job_id like '___REP';

select employee_id, first_name, job_id, salary
from hr.employees
where substr(job_id,4) = 'REP%';

-- ������ 4���� ���� 3��¥�� PRO�� ������ ����Ͻÿ�.
select * from hr.employees
where substr(job_id,4,3) = 'PRO';

-- �����ȣ�� �޿�, ������ ����ϴ� �� ������ 4��°���� 3��¥�� ����Ͻÿ�.
select employee_id, salary, job_id, substr(job_id,4,3)
from hr.employees;

-- �����ȣ�� �޿�, ������ ����ϴ� �� 
-- ������ �ڿ��� 3��¥���� 2��¥�� ����Ͻÿ�.
select employee_id, salary, job_id, substr(job_id, -3, 2)
from hr.employees;

-- ������ �ڿ��� 3��¥���� 2��¥�� RE�� ������� ����Ͻÿ�.
select * from hr.employees
where substr(job_id,-3,2) = 'RE'; 

-- �̸��� s��� ��¥�� �ִ� ��� ���°���� ����Ͻÿ�.(indexOf())
select first_name, instr(first_name,'s')
from hr.employees;
--- firstName.indexOf('s') // �ڹٽ�Ÿ��
--�̸��� 's'�� 6��°�� �ִ� ����� ����Ͻÿ�.
select * from HR.employees
where instr(first_name,'s') = 6;

-- �����ȣ, ��, �̸�, ����, �̸��� ���� �׸��� ���� 'a'�� �ִ� ��ġ��
-- ����ϴµ�  ������ 4��° ��¥���� 3��¥�� 'REP'�� ����� ����Ͻÿ�.
select employee_id, last_name, first_name, length(first_name),
instr(last_name,'a')
from hr.employees
where substr(job_id,4,3) = 'REP';

select * from hr.employees;
-- �����ȣ, ��, ����, �޿��� ����ϴµ� �޿��� 1234�� ���� �� 1000����
-- ���� ���� ����Ͻÿ�.
select employee_id, last_name, job_id, (salary-1234)/1000
from hr.employees;
--�� ���뿡�� ��µ� �޿��� �Ҽ��� ���ڸ� ����ϰ� �Ͻÿ�.
--�ݿø�
select employee_id, last_name, job_id, 
        (salary-1235)/1000, round((salary-1235)/1000, 2),
        round((salary-1235)/1000, 1), 
        round((salary-1235)/1000, 0),
        round((salary-1235)/1000, -1)
from hr.employees;

SELECT ROUND(45.923,2), ROUND(45.923,0),
       ROUND(45.923,-1),ROUND(45.923,-2)
FROM   DUAL;

--���� trunc
SELECT trunc(45.925,2), trunc(45.923,0),
       trunc(45.923,-1),trunc(45.923,-2)
FROM   DUAL;

-- ���� �޿��� ����ϴµ� �޿��� 5000���� ���� �������� ���� ����Ͻÿ�.
-- ��, ������ 'SA_REP'�� ����� ����Ͻÿ�.
select last_name, salary, mod(salary, 5000)
from hr.employees
where job_id= 'SA_REP';


-- ��¥ 
-- ���� ��¥ ��� (new Date()) System.out.println(new Date());
select sysdate from dual;
--
-- �Ի����� 2007�� 01�� 01�Ϻ��� ������ �������� ����Ͻÿ�.
select * from hr.employees
where hire_date < '07/01/01';
select * from hr.employees
where hire_date < to_date('01/01/07','DD/MM/YY');

-- �����ȣ, ���� �Ի����� ����ϴµ� 
-- ������� �Ի��Ϸ� ���� ���ְ� �Ǿ����� ���� ����Ͻÿ�.
select employee_id, job_id, hire_date, (sysdate-hire_date) /7
from hr.employees;

-- ����� �Ǿ����� ����Ͻÿ�.
select employee_id, job_id, hire_date, (sysdate-hire_date) /365
from hr.employees;

-- �Ի����� ����� �Ǿ����� ����Ͻÿ�.
-- �����ȣ, ����, �Ի���, ���
select employee_id, job_id, hire_date, 
        months_between(sysdate,hire_date)
from hr.employees;

-- �Ի����� 6������ �� ��¥�� �����Դϱ�?
-- �����ȣ, ����, �Ի���
select employee_id, job_id, hire_date, add_months(hire_date,6)
from hr.employees;

select hire_date, sysdate - 14
from hr.employees;

-- ���� ��¥���� 14�� ���� �Ի��� ������?
select * from hr.employees
where hire_date = sysdate - 14;

-- �Ի��Ϸκ��� ���� �ݿ����� ���� �Դϱ�.?
select employee_id, job_id, hire_date, 
       next_day(hire_date,'�ݿ���')
from hr.employees;

-- ���� ���������� ���
-- �Ի��� ���� ������ ���� �����Դϱ�.
select employee_id, job_id, hire_date, last_day(hire_date)
from hr.employees;

-- �Ի��Ϸ� ���� 36������ ���� ������� ����Ͻÿ�.
select * 
from hr.employees
where months_between(sysdate, hire_dated) > 36;
-------
select * from hr.employees
where sysdate - hire_date > 36; -- ��

-- �Ի��Ϸ� ���� ������ �������� ���Ͻÿ�.
select sysdate - hire_date
from hr.employees;

--- �����ȣ, ����, �Ի����� ����ϴµ� �Ի����� ��4�ڸ��� ����Ͻÿ�.
-- ��¥ ǥ�⸦ yyyy-MM-DD
select employee_id, job_id, hire_date, 
        to_char(hire_date, 'yyyy-MM-DD')
from hr.employees;

select employee_id, job_id, hire_date, 
        to_char(hire_date, 'yyyy-MM-DD HH : MI : SS AM')
from hr.employees;

select sysdate, to_char(sysdate, 'YYYY-MM-DD HH24 : MI : SS AM')
from dual;

-- �����ȣ ���� �޿��� ����ϴµ� �޿� �տ� $�� ���� ���ڸ����� ','�� 
-- �������.
select employee_id, job_id, to_char(salary, '$999,999')
from hr.employees;
-- �����ȣ ���� �޿��� ����ϴµ� �޿� �տ� ����ȭ�� ������ 
-- ���̰� ���ڸ����� ','�� �������.
select employee_id, job_id, to_char(salary, 'L999,999MI')
from hr.employees;

--- ��¥�� 10-10-2002���Ŀ� �Ի��� ������ ����Ͻÿ�.
select * from hr.employees
where to_char(hire_date,'mm-dd-yyyy') > '10-10-2002';

select * from hr.employees
where hire_date > to_date('10-10-2002','dd-mm-yyyy');


-- �Ϲ� �Լ� : NVL NVL2 NULLIF
select * from hr.employees;
-- �����ȣ, ����, Ŀ�̼��� ������ �޿��� ����Ͻÿ�.
select employee_id, job_id, 
       salary + salary * nvl(commission_pct,0)
from hr.employees;

select employee_id, job_id, 
    nvl2(commission_pct, salary + salary * commission_pct, salary)
from hr.employees;
--�����ȣ, ����, ����� ���Ͻÿ�.
select employee_id, job_id, 
       salary * (1 + nvl(commission_pct,0)) *12
from hr.employees;

-------------- ���� ����ϴ� ���
select employee_id, job_id, 
    nvl2(commission_pct, 'sal+comm' ,'sal')
from hr.employees;

-- ���� ǥ����
-- ������ 'IT_PROG'��� �޿��� 1.1�踦 �ϰ�
--       'ST_CLERK'��� �޿��� 1.15�踦 �ϰ� 
--       'SA_REP'��� �޿��� 1.2�踦�Ѵ�.
-- ������������ �޿��� �����Ѵ�.
-- �����ȣ, �޿� , ����, ���ǿ� ���� ���� ���
select employee_id, salary, job_id,
    case job_id when 'IT_PROG' then 1.10 * salary
                when 'ST_CLERK' then 1.12 * salary
                when 'SA_REP' then 1.20 * salary
    else salary end sal, hire_date
from hr.employees;
--decode
select employee_id, salary, job_id,
    decode( job_id , 'IT_PROG' , 1.10 * salary
                   , 'ST_CLERK' , 1.12 * salary
                   , 'SA_REP' , 1.20 * salary
                   , salary ) sal, hire_date
from hr.employees;

-- �޿��� 10000�̻��̸� "�̻���Դϴ�"
--             7000�̻��̸� "������Դϴ�"
 --            5000�̻��̸� "������Դϴ�"
 --            �������� ������� ����Ͻÿ�.
 --     ���� �޿��� ���� ����Ѵ�.
select employee_id, salary, job_id,
case  when salary >= 10000 then '�̻���Դϴ�'
      when salary >= 7000 then '������Դϴ�'
      when salary >= 5000 then '������Դϴ�'
      else '����Դϴ�.'  end
from hr.employees;


--����) �޿��� 2000���� ���� ���� ���� 
--       0�̸� 0.00
--       1�̸� 0.09
--       2�̸� 0.20
--       3�̸� 0.30
--       4�̸� 0.40
--       5�̸� 0.42
--       6�̸� 0.44
--             0.45 ��ŭ ������ �ο��ȴ�.
--�ο��Ǵ� ������ ����Ͻÿ�.-
--���� �޿��� ���� ����Ͻÿ�.(��, �μ��� 80�� �����)
--decode�� ����Ͻÿ�.
select employee_id, salary, last_name,
 decode (trunc(salary/2000, 0), 0, salary * 0.00
			      , 1, salary * 0.09
                              , 2, salary * 0.20
 			      , 3, salary * 0.30
			      , 4, salary * 0.40
			      , 5, salary * 0.42
			      , 6, salary * 0.44
			      , salary * 0.45) tex
from hr.employees
where department_id = 80;







