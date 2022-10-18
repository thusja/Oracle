-- 2022.10.17

-- DQL(���Ǿ�) ������ ��ȸ

-- select �÷���
-- from ���̺��

-- ��ü ������
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp;

select *
from emp;

-- �κм��� ������
select empno,ename,mgr
from emp;

select deptno
from emp;

select DISTINCT(deptno)
from emp;

select job
from emp;

select DISTINCT(job)
from emp;

-- +, -, *. / ������ �����ڴ� ����
-- �÷��� ������� �����Ѵ�
-- null ���� ������ �Ұ��ϴ�
-- �÷��� ��Ī�� ����� �� �ִ� as ��Ī
select ename as ����� ,sal,sal*12+nvl(comm,0)as ����,comm
from emp; 


-- 2022.10.18

-- ������ ����
-- select �÷���
-- from ���̺��
-- order by �÷���(���ı����� �Ǵ� ��) asc(��������)/desc(��������)

select *
from emp
order by sal asc; -- �������� ���� (���������� ���� �����ϴ� order by sal;)

select *
from emp
order by sal desc; -- �������� ����

-- ����(1~10), ��¥(���ų�¥~�ֱٳ�¥), ����(��������)

-- ���ǰ˻�
-- select �÷���
-- from ���̺��
-- where ���ǽ�(�÷��� = ��); <, >, =, != / <>, <=, >=, and, or

select *
from emp
where sal >= 3000; -- �޿��� 3000�̻��� ���

select *
from emp
where deptno = 30; -- 30���� �μ��ϴ� ���

-- and �ΰ��� �̻��� ������ ��� ���� ���
select *
from emp
where deptno = 30 and job = 'SALESMAN' and empno = 7499; -- ���ڰ��� ��ҹ��� ����

-- ���ڸ� �������� ����ҋ�
-- ��ҹ��� ����
-- '' �ҵ���ǥ ���̱�
select *
from emp
where ename = 'FORD'; -- �ҹ��� ford�� ����

-- ��¥�� �������� ����� ��
-- ''
-- ��¥�� ũ�Ⱑ �ִ�\
-- 80/12/20 -> 1980 12 20 �ð� �� �� ����
select *
from emp
where hiredate < '1982/01/01';

-- or �ΰ��̻��� �����߿� �ϳ��̻� ���� ���
select *
from emp
where deptno = 10 or sal >= 2000;

-- not ������ ������
select *
from emp
where sal != 3000;

select *
from emp
where not sal = 3000;

-- and, or
-- ���� ������ ǥ���Ҷ� ���
select *
from emp
where sal >= 1000 and sal <= 3000;

select *
from emp
where sal <= 1000 or sal >= 3000;

-- between and (a�� b���̰�)
select *
from emp
where sal between 1000 and 3000;

-- in (or�� ������ ���ʿ� ���� in�ȿ� ���� �־��ָ� �ȴ�)
select *
from emp
where sal = 800 or sal = 3000 or sal = 5000;

select *
from emp
where sal in(800,3000,5000);

-- like ������
-- ���� �Ϻθ� ������ �����͸� ��ȸ�Ѵ�
-- ���̵� ī�带 ����Ѵ� %, _
-- % ��� ���ڸ� ��ü�Ѵ�
-- _ �� ���ڸ� ��ü�Ѵ�
select *
from emp
where ename = 'FORD';

select *
from emp
where ename like 'F%'; -- F�� �����ϴ� ��� ����

select *
from emp
where ename like '%D'; -- D�� ������ ��� ����

select *
from emp
where ename like '%O%'; -- ���̰� �ڰ� �ϴ� O�� �����ϸ� ���

select *
from emp
where ename like '___D'; -- D ���� 3���ڰ� ���ԵǾ��Ѵ�

select *
from emp
where ename like 'S___%'; -- S ������ 3���ڴ� �����ϰ� ���� %�� ��ü ����

-- null ������
-- is null / is not null
select *
from emp
where comm = null; -- null�� �� �Ұ�

select *
from emp
where comm is null;

select *
from emp
where comm is not null;

-- ���� ������
-- �ΰ��� select ������ ����Ѵ�
-- �÷��� ������ Ÿ���� �����ؾ��Ѵ�
-- �÷��� �̸��� �������
-- ������(UNION), ������(MINUS), ������(INTERSECT)

select empno,ename,sal,deptno
from emp
where deptno = 10
UNION -- ������
select empno,ename,sal,deptno
from emp
where deptno = 20;

select empno,ename,sal,deptno
from emp
where deptno = 10
UNION ALL -- ������ (�ߺ��� ������ �ѹ��� ����Ѵ�, �ߺ��ص� ����� ������ �ڿ� ALL�� ������)
select empno,ename,sal,deptno
from emp
where deptno = 10;

select empno,ename,sal,deptno
from emp
MINUS -- ������
select empno,ename,sal,deptno
from emp
where deptno = 10;

select empno,ename,sal,deptno
from emp
INTERSECT -- ������
select empno,ename,sal,deptno
from emp
where deptno = 10;

-- where
-- �񱳿�����, ��������, like, is null / is not null, ���տ�����
-- <, >, <=, >=, =, !=
-- and, or, not, between and, in
-- like(%,_)
-- is null, is not null
-- UNION, UNION ALL, MINUS, INTERSECT

-- ex01
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp
where ename like '%S';

-- ex02
select empno,ename,job,sal,deptno
from emp
where deptno = 30 and job = 'SALESMAN';

-- ex03-1
select empno,ename,job,sal,deptno
from emp
where deptno in(20,30)
INTERSECT
select empno,ename,job,sal,deptno
from emp
where sal > 2000;

-- ex03-2
select empno,ename,job,sal,deptno
from emp
where deptno in(20,30) and sal > 2000;

-- ex04
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp
where sal < 2000 or sal > 3000;

-- ex05
select ename,empno,sal,deptno
from emp
where ename like '%E%' and deptno = 30 and sal not between 2000 and 3000;


--e ex06
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp
where comm is null and job in('MANAGER','CLERK') and mgr is not null and ename not like '_L%';






































