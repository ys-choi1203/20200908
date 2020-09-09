-- 20.06.02 ��������

-- 1. ������̺��� ������ 'MAN'�� �����ϰ� �޿��� 10000�̻��� �����
-- �����ȣ�� ���� ���� �׸��� �޿��� ���
select employee_id, last_name, job_id, salary
from HR.employees
where job_id like '%MAN%'
AND salary >=10000;

--2. ������ SA_REP�� AD_PRES �̸鼭 �޿��� 15000�� �ʰ��ϴ� 
-- ����� ����Ͻÿ�. ��, ��, ����, �޿��� ��� or�� and�� ���
select last_name, job_id, salary
from HR.employees
where (job_id = 'SA_REP' or job_id = 'AD_PRES')
and salary > 15000;

-- �μ���ȣ , �޿�, �Ի���, ��
--3. �������̺��� �μ��� ������������ �����Ͽ� ����Ͻÿ�.
select department_id, salary, hire_date, last_name
from HR.employees
order by department_id;

--4. �μ��� ������������ �����ϰ� �Ի��ϵ� ������������ ����
select department_id, salary, hire_date, last_name
from HR.employees
order by department_id, hire_date desc;

--5. �μ��� ������������ �����ϰ� �Ի����� ������������ �����Ͽ� ���
select department_id, salary, hire_date, last_name
from HR.employees
order by department_id desc, hire_date asc;

--6. �μ��� ������������ �����ϰ� �Ի����� ������������ �����Ͽ� 
--   �޿��� ������������ �����Ͽ� ���
select department_id, salary, hire_date, last_name
from HR.employees
order by department_id desc, hire_date asc, salary desc;

--Lower, Upper, initcap, concat, substr
select last_name, lower(last_name) , hire_date
from hr.employees
where lower(last_name) = 'grant';

--7. ��� �ҹ����� grant�� ��� �빮���� 'GRANT'�� ������ �ش� ����� ã���� �Ѵ�.  (Grant) 
select last_name, lower(last_name), upper(last_name)
from HR.employees
where lower(last_name)='grant'
and upper(last_name)='GRANT';

--8. 'GranT'�� �Է������� ������̺��� 'Grant'�� ã���ÿ�.
select INITCAP('GranT')
from HR.employees;

--9. ���� ��� �빮�ڷ� ��ȯ�ϰ� �̸� ��� �ҹ��� ��ȯ�Ͽ�
-- ���� �̸��� �ѿ� ����� �� ' ���� GRANT douglas �Դϴ�'�� ��µǰ� �Ͻÿ�.
select '���� ' || upper(last_name) ||' '||lower(first_name) ||' �Դϴ�'
from HR.employees;

--10. ���� �̸��� �ٿ� ���
select concat(last_name, first_name)
from HR.employees;

--11. ���� ��� �빮�ڷ� ��ȯ�ϰ� �̸� ��� �ҹ��� ��ȯ�Ͽ�
-- ���� �̸��� �ѿ� ����� �� ' ���� GRANT douglas �Դϴ�'�� ��µǰ� �Ͻÿ�. concat�� �̿�
select concat('���� ',last_name, first_name,'�Դϴ�.')
from HR.employees;

--12. ���� Davies���� av�� ����Ͻÿ�.
select substr('Davies',2,2) from HR.employees
where last_name='Davies';

--13. ���� �ι�° ��¥���� ��� ����Ͻÿ�.
select last_name, substr(last_name , 2)
from HR.employees;

--14. ���� ������ ���ڿ��� �α�¥�� �������ÿ�.
select last_name, substr(last_name,-2)
from HR.employees;

--15. ���� �ڿ� on���� ������ ����� ã���ÿ�.
select last_name, substr(last_name,-2)
from HR.employees
where substr(last_name,-2)='on';

--16. ���� �ڿ� ����° ���ڰ� so�� ����� ����Ͻÿ�.
select last_name, substr(last_name,-3,2)
from HR.employees
where substr(last_name,-3,2)='so';

-- ������ȣ, ��, �޿�, ����
--17. ���� ������ ����ϴµ� �̸����� ���ʿ��� 3���ڸ� ����Ͻÿ�.
select employee_id, last_name, salary, job_id,email, substr(email,1,3)
from HR.employees;

--18. ���� ������ ����ϴµ� �̸����� �����ʿ��� 3���ڸ� ����Ͻÿ�.
select employee_id, last_name, salary, job_id, email,substr(email,-3,3)
from HR.employees;

-- 19. Ʋ�� ���� ã�� ������ ���Ͻÿ�


-- ������ȣ ��, ���� ��ġ, ����
--20. o�� �ִ� ���� o�� ���°�� �ִ� ��ġ�� ����Ͻÿ�.
select employee_id, last_name, instr(last_name, 'o'), job_id
from HR.employees;

--21. oc�� �ִ� �� �� oc�� ���°�� �ִ� ��ġ�� ����Ͻÿ�.
select employee_id, last_name, instr(last_name, 'oc'), job_id
from HR.employees;

--22. ������ RE�� �ִ� ��� RE���� 3���ڸ� ����Ͻÿ�.
-- ������ȣ �� ���� ������ ����
select employee_id, last_name, job_id, substr(job_id,instr(job_id, 'RE'),3)
from HR.employees;

--23. ������ȣ, ��, �Ի��� , �޿�, �޿��տ� * ǥ�ð� �ǰ� ����.
select employee_id, last_name, hire_date,concat('*',salary)
from HR.employees;

--24. ������ȣ, ��, �Ի��� , �޿�, �޿��ڿ� * ǥ�ð� �ǰ� ����.
select employee_id, last_name, hire_date,concat(salary,'*')
from HR.employees;

--25. ������ȣ, ��, �Ի���, ������ ����ϴµ� ������ RE�� �ִٸ� 
-- RE�� AB�� �����Ͽ� ���
select employee_id, last_name, hire_date, job_id,
replace(job_id,'RE','AB')
FROM HR.employees;

--26. ������ȣ, ����ó, Ŀ�̼�, �μ���ȣ,�޿�
-- �޿��� 3000���� �������� ���� �������� ����Ͻÿ�.
select employee_id, phone_number, commission_pct, salary,
mod(salary,3000)
from HR.employees;

--27. 2002�⵵�� �Ի��� �������� ����Ͻÿ�
select * from HR.employees
where hire_date > TO_DATE('2002','yyyy');

--28. ���ش� ���ñ��� ���ְ� �������� Ȯ���Ͻÿ�
select (sysdate-to_date('02/01/01','yy/mm/dd'))/7 from dual;

--29. �������� ��� �ٹ��ش��� ���
-- ������ȣ, ��, ����ó, �μ�, �ٹ����
select employee_id, last_name, phone_number, department_id,
(sysdate-hire_date)/365 year
from HR.employees;

--30. �ټӳ�� 8�� �̻��� ����鸸 ���
select * from HR.employees
where (sysdate-hire_date)/365 >=8;

-- 2��
--31. ������ ���ó�¥�� �Ի����� ��� �Ǿ����� ���
-- ������ȣ ���� �Ի��� �Ի簳��(MONTH_BETWEEN)
select employee_id, job_id, hire_date, 
months_between(sysdate, hire_date)
from HR.employees;

--32. ������ �Ի��� ���κ��� 6�����Ĵ� �����Դϱ�?
-- ������ȣ �� �Ի��� 6������(ADD_MONTHS)
select employee_id, last_name, hire_date,
add_months(hire_date,6)
from HR.employees;

--33. ������ �Ի����� 36������ ���� ����� ���
-- ������ȣ �� �Ի���
select employee_id, last_name, hire_date
from HR.employees
where months_between(sysdate,hire_date)>=36;

--34. ������ �Ի����� 36���� �̸��� ����� ����Ͻÿ�
-- ������ȣ �� �Ի���
select employee_id, last_name, hire_date
from HR.employees
where months_between(sysdate,hire_date)<36;

--35. ���ú��� ���� �ݿ����� ���� �Դϱ�?(NEXT_DATE);
select next_day(sysdate,'�ݿ���')from dual;

--36. �Խ��� ����Ʈ���� ������ 5����*****
-- ������ ���� 3���ڸ� ��� �ڿ� *�� ������ ���
-- ������ȣ �Ի��� ��
select employee_id, hire_date,concat(last_name,'***')
from HR.employees;

--37. ȫ�浿�� ������Դϱ�?
select length('ȫ�浿')from dual;

--38. "ȫ�浿\n"���� �Ǿ� �ִ� ���� html���� ��ٲ��� �ǵ��� 
-- "ȫ�浿 <br>"�����Ͻÿ�

--39. �Ի����� 'YYYY-MM-DD'�� ��¥�� 31-05-2019 16:25:30 ������ ���·� ���
select to_char(hire_date,'yyyy-mm-dd'),
to_char(hire_date,'dd-mm-yyyy hh24:mi:ss am') 
from HR.employees;

--40. ����(3333333)�� 3�ڸ����� ��ǥ�� �� ���
select to_char('3333333','999,999') from dual;

--41. �������̺��� �޿��� w33,333,333������ ���
select salary, to_char(salary,'L999,999')
from HR.employees;

--42. ������ 2018-10-25���� �ٹ��ϼ��� ����Ͻÿ�
-- ������ȣ �μ���ȣ �Ի��� �ٹ��ϼ�
select employee_id, department_id, hire_date,
to_date(to_char(2018-10-25,'yyyy-mm-dd'))-to_date(to_char(hire_date,'yyyy-mm-dd'))
from HR.employees;

--43. '10-25-2002'�� �Ի��� ��� ���
-- ������ȣ �μ���ȣ �Ի��� �ٹ��ϼ�
select employee_id, department_id, hire_date,
sysdate-hire_date
from HR.employees;

--44. ���������� �Ϸ��� �մϴ�. ����(�޿�*12) : �޿��� Ŀ�̼Ǳ��� ����
-- ������ ������ ���Ͻÿ�
-- ������ȣ �μ���ȣ �޿� ����
select employee_id, department_id, salary,
salary*12+nvl(commission_pct,0)
from HR.employees;

--45. �μ��� 90�̰ų� 30�� �μ��� ������ ������ ���Ͻÿ�
-- ������ȣ �μ���ȣ �޿� ����
select employee_id, department_id, salary,
salary*12+nvl(commission_pct,0)
from HR.employees
where department_id in(90,30);

--46. nvl2, ������ȣ�� ���� �޿� �׸��� ������ ���
select employee_id, last_name, salary,
nvl2(commission_pct, salary*12+commission_pct,salary*12)
from HR.employees;

--47. �޿��� 10000�̻��̸� "�̻���Դϴ�"
--             7000�̻��̸� "������Դϴ�"
--             5000�̻��̸� "������Դϴ�"
--             �������� ������� ����Ͻÿ�.
--             ���� �޿��� ���� ����Ѵ�.

--case
select employee_id, salary, job_id,
case  when salary >= 10000 then '�̻���Դϴ�'
      when salary >= 7000 then '������Դϴ�'
      when salary >= 5000 then '������Դϴ�'
      else '����Դϴ�.'  end
from hr.employees;

--decode
select employee_id, salary, job_id
decode(salary, salary>=10000,'�̻���Դϴ�.'
            , salary>=7000,'������Դϴ�.'
            , salary>=5000,'������Դϴ�.'
            ,'����Դϴ�.') jo
            from HR.employees;

--48. �޿��� 2000���� ���� ���� ���� 
--       0�̸� 0.00
--       1�̸� 0.09
--       2�̸� 0.20
--       3�̸� 0.30
--       4�̸� 0.40
--       5�̸� 0.42
--       6�̸� 0.44
--             0.45 ��ŭ ������ �ο��ȴ�.
-- �ο��Ǵ� ������ ����Ͻÿ�.
-- ���� �޿��� ���� ����Ͻÿ�.(��, �μ��� 80�� �����)       
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

--49. ���� ��ü���� �Ի����� ���� ���� ����� �ֱٿ� �Ի��� ����� ���


--50. ����� ���� ����Ͻÿ�.
select count(employee_id) from HR.employees;

--51. �������̺��� �μ��� ����� ���
select count(department_id) from HR.employees;

--52. ��� ���̺��� �� �μ��� �޿������ ������
select avg(salary) from HR.employees
where department_id;

--53. �� �������� �μ��� ������������ �����Ͽ� ���

--54. �� �μ��� �޿��� ����� ���ϴ� ��հ��� �����ͺ��� ���

--55. �� �μ��� �ִ� ����� ������ �޿��� ����� ���Ͻÿ�









