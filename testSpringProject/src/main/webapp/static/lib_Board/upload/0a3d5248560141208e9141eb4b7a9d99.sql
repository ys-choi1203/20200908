-- ����2

-- 1. �޿��� 12000�� �Ѵ� ����� �̸��� �޿��� ���
select last_name, salary
from HR.employees
where salary >=12000;

-- 2. ��� ��ȣ�� 176�� ����� �̸��� �μ���ȣ ���
select last_name, department_id
from HR.employees
where employee_id=176;

-- 3. �޿��� 5000���� 12000���̿� ���Ե��� �ʴ� ����� �̸��� �޿� ���
select last_name, salary 
from HR.employees
where salary not between 5000 and 12000;

-- 4. 1998�� 2�� 20�ϰ� 1998�� 5�� 1�� ���̿� �Ի��� �����
-- �̸� ����id  ������ ���
select last_name, job_id, hire_date
from HR.employees
where hire_date between '02/02/20' and '03/05/01';

-- 5. �μ� 20�� 50�� ���ϴ� ����� �̸��� �μ���ȣ ���, �̸��� ��������
select last_name, department_id
from HR.employees
order by last_name;

-- 6. �޿��� 5000�� 12000���̰� �μ���ȣ�� 20�Ǵ� 50�� ����� �̸��� �޿��� ���
-- ���̺��� Employee�� Monthl Salary�� ����
select last_name employee, salary monthlysalary
from HR.employees
where salary between 5000 and 12000 
and department_id in(20,50);

-- 7. 1994�⿡ �Ի��� ��� ����� �̸��� �Ի����� ���
select last_name, hire_date 
from HR.employees
where to_char(hire_date,'yyyy') = '2002';

-- 8. �����ڰ� ���� ��� ����� �̸��� ������ ���
select last_name,job_id
from HR.employees
where manager_id is null;

-- 9. Ŀ�̼��� �޴� ��� ����� �̸�, �޿�, Ŀ�̼��� �޿� �� Ŀ�̼��� �������� �������� ���
select last_name, salary, commission_pct
from HR.employees
where commission_pct is not null
order by salary desc;

-- 10. �̸��� ����° ���ڰ� 'a'�� ��� ����� �̸� ���
select last_name
from HR.employees
where last_name like '__a%';

--11. �̸��� 'a'�� 'e'�� �ִ� ��� ����� �̸��� ���
select last_name
from HR.employees
where last_name like '%a%' and last_name like '%e%';

-- 12. ������ 'ST_CLERK' �Ǵ� 'SA_REP'�̸鼭 
-- �޿��� 2500,3500 �Ǵ� 7000�� �ƴ� ��� ����� �̸� ���� �޿� ���
select last_name, job_id, salary
from HR.employees
where job_id in('ST_CLERK','SA_REP')
AND SALARY NOT IN(2500,3500,7000);

-- 13. Ŀ�̼� ������ 20%�� ��� ����� �̸� �޿� Ŀ�̼� ���
select last_name, salary, commission_pct
from HR.employees
where commission_pct = 0.20;













