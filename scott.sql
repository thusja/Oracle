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

-- ���ڸ� �������� �����??
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
UNION ALL -- ������ (�ߺ��� ������ �ѹ��� ����Ѵ�, �ߺ��ص� ����� ����?? �ڿ� ALL�� ������)
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

-- �Լ�
-- �����Լ� : upper, lower, substr, instr, replace, lpad, rpad, concat
-- �����Լ�
-- ��¥�Լ�


-- �����Լ�
select 'Welcome',upper('Welcome')
from dual;

select lower(ename),upper(ename)
from emp;

select *
from emp 
where ename = 'FORD';

select *
from emp
where lower(ename) = 'scott';

select ename,length(ename)
from emp;

-- substr('�۾�', ������ġ, ��������ġ)
select 'Welcome to Oracle', substr('Welcome to Oracle',1,3)
from dual;

select 'Welcome to Oracle', substr('Welcome to Oracle',2,3),substr('Welcome to Oracle',10)
from dual;

select 'Welcome to Oracle', substr('Welcome to Oracle',-3,3),substr('Welcome to Oracle',-17)
from dual;

-- ù��° o ��ȣ ã��
select instr('Welcome to Oracle','o')
from dual;

-- 6��°���� o ��ȣ ã��
select instr('Welcome to Oracle','o',6)
from dual;

-- 6��°���� �ι�° o ã��
select instr('Welcome to Oracle','o',6,2)
from dual;

-- 3��°���� �ι�° e ã��
select instr('Welcome to Oracle','e',3,2)
from dual;

-- replace �۾� �ٲٱ�
select 'Welcome to Oracle',replace('Welcome to Oracle','to','of')
from dual;


select 'Oracle',lpad('Oracle',10,'#'),rpad('Oracle',10,'*'),lpad('Oracle',10)
from dual;

select rpad('990103-',14,'*')
from dual;

select concat(empno,ename), empno || '' || ename
from emp;


-- �����Լ�

-- �ݿø� ��ġ ����
select round(1234.5678), round(1234.56789,0), round(1234.56789,1), round(1234.56789,2),round(1234.56789,-1)
from dual;

-- ������ ��ġ ����
select trunc(1234.5678), trunc(1234.5678,0), trunc(1234.5678,1),trunc(1234.5678,2),trunc(1234.5678,-1)
from dual;

-- ceil(�ڽź��� ū ���� ����� ����) / floor(�ڽź��� ���� ���� ����� ����)
select ceil(3.14), floor(3.14), ceil(-3.14), floor(-3.14)
from dual;

-- mod ���� �������� ���ϱ�
select mod(5,2), mod(10,4)
from dual;

-- ����� Ȧ���� �ο� ���ϱ�
select *
from emp
where mod(empno,2) = 1;


-- 2022.10.19


-- ��¥�Լ�
-- sysdate : ���� ��¥
select sysdate
from dual;

-- ��¥ �����ʹ� ������ �����ϴ�
-- sysdate-1 ����, sysdate ����, sysdate+1 ����
select sysdate-1,sysdate,sysdate+1
from dual;

-- �ٹ��ϼ�
select sysdate - hiredate as �ٹ��ϼ�
from emp;

-- �ټӳ��
select trunc((sysdate-hiredate)/365) as �ټӳ��
from emp;

-- ��¥ �����ʹ� round, trunc�Լ� ������ �����ϴ�.
select sysdate,
    round(sysdate, 'CC') as format_cc,
    round(sysdate, 'YYYY') as format_yyy,
    round(sysdate, 'Q') as format_q,
    round(sysdate, 'DDD') as format_ddd,
    round(sysdate, 'HH') as format_hh
from dual;

-- ��ȯ�Լ�(p.158 �׸� ����)
-- to_char : ���� �Ǵ� ��¥ �����͸� ���� �����ͷ� ��ȯ
-- to_number : ���� �����͸� ���� �����ͷ� ��ȯ
-- to_date : ���� �����͸� ��¥ �����ͷ� ��ȯ

-- ��¥�� ���ڷ� ��ȯ
select sysdate, to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') as ����ð�
from dual;

select hiredate, to_char(hiredate,'YYYY-MM-DD HH24:MI:SS DAY') as �Ի�����
from emp;

-- ���ڸ� ���ڷ� ��ȯ(ȭ������� ���� �� ���� ���)
select to_char(123456,'L999,999') -- L : ���� ������ ȭ�� �ٿ���
-- 9: ������ �� �ڸ��� �ǹ�(�� �ڸ��� ä���� ����)
-- 0: ������ ��ĭ �ڸ��� 0���� ä��
from dual;

select to_char(sal,'L999,999')
from emp;

-- ���ڸ� ���ڷ� ��ȯ
-- ** �ݵ�� ���ڰ� ������������ ������ �Ǿ��־����
-- ���ڷ� �����Ǿ������� �����߻�

select '20000'-10000 -- ���ڿ��� ���ڻ��� ����(�ڵ�����ȯ)
from dual;

select '20000'-'5000' -- ���ڿ��� ���ڻ��� ����(�ڵ�����ȯ)
from dual;

select '20,000'-'5,000' -- ���� ���̿� ��ǥ�� �־ �ڵ�����ȯ�� ���� �ʾ� ����Ұ�
from dual;

select to_number('20,000','999,999') - to_number('5,000','999,999') 
--> ���ڸ� ���ڷ� �ٲ�� ������ ������ ��������
from dual;

-- ���ڸ� ��¥�� ��ȯ
-- ** ���ڰ� �ݵ�� ��¥ �������� �Ǿ��־�� ��ȯ�� �����ϴ�.
select to_date('20221019','YYYY/MM/DD')
from dual;

select *
from emp
where hiredate < 19820101;  -- 19820101�� �����̱� ������ ��¥ �����Ϳ� ���� �Ұ�

select *
from emp
where hiredate < to_date('19820101', 'YYYY-MM-DD');

-- NULL������ ó��
-- NVL(null�� �ִ� �÷��̸�, �ٲٰ���� ������)
-- �ٲٰ���� �����ʹ� NULL �������� Ÿ�԰� ���� Ÿ������ �����ؾ��Ѵ�.
--> NVL(����,����) / NVL(����,����)
select ename �����, sal, sal * 12 + nvl(comm,0) as ����, comm
from emp;

select ename,job,mgr
from emp
where mgr is null;

select ename,job,nvl(mgr,'CEO') --> mgr�� ����Ÿ������ �Ǿ��ֱ� ������ ���ڷ� �ٲ� �� ����.
from emp
where mgr is null;

select ename,job,nvl(to_char(mgr,'9999'),'CEO') --> mgr�� ����Ÿ������ ��ȯ�߱� ������ ������ ������ �����ϴ�.
from emp
where mgr is null;

-- nvl2
-- NVL(null�� �ִ� �÷��̸�, ���ϴ� ��, ���ϴ� ��)
-- null�� ��� �ڿ� �� ���, null�� �ƴѰ�� �տ� �� ���
-- Ÿ����ġ���� �ʾƵ� ��
select comm, nvl2(comm,'O','X')
from emp;

-- ���ǹ��� ǥ���ϴ� �Լ�
-- decode() -> �ڹ��� switch����
-- case() -> �ڹ��� if ��

-- decode(�÷���,�����Ͱ�,�ٲٱ� ���ϴ°�,�����Ͱ�,�ٲٱ� ���ϴ°�,...,��ġ�� ��찡 ���� �� ��ȯ�� ��)
select ename,job,deptno,
    decode(deptno,10,'AAA',20,'BBB',30,'CCC','��Ÿ')as �μ���
from emp;

-- case : ������ �������� ������ �� �ִ�.
-- case
--    when ���ǽ� then ���๮
--    when ���ǽ� then ���๮
--    when ���ǽ� then ���๮
--    else ���ǿ� ���� ���� ��� ������ ���๮
-- end as ��Ī

select ename,job,deptno,
    case
    when deptno = 10 then 'AAA'
    when deptno = 20 then 'BBB'
    when deptno = 30 then 'CCC'
    else '��Ÿ'
    end as �μ���
from emp;

select ename,job,sal,
    case
    when sal between 3000 and 5000 then '�ӿ�'
    when sal >= 2000 and sal < 3000 then '������'
    when sal >= 500 and sal < 2000 then '���'
    else '��Ÿ'
    end as ����
from emp;


-- 2022.10.20


-- ����(Join)
-- 2�� �̻��� ���̺��� �����͸� ��ȸ
-- from���� �ΰ� �̻��� ���̺��� �ۼ��Ѵ�
-- where���� ���� ������ �ۼ��ؾ��Ѵ�.
-- ����
-- cross join(�� ������� ����) : where�� ���� ����
-- equi join : �����. where���� �������(=)�� ���. ���� ����� ������ �� �����ʹ� ��ȸ�� �� ��.
-- non equi join : where���� ����������(and,or)�� ���
-- self join : where���� �ϳ��� ���̺��� ���
-- out join : where���� �����Ǵ� �����͸� ���� ��ȸ�ϱ� ���� ��� -> �����Ͱ� ���� �ʿ� (+)�� ����

-- equi join
select emp.ename,emp.job,emp.deptno,dept.dname,dept.loc --> ��� ���̺� �ִ� �����͸� ���������� �տ� ���������/�÷��̸��� �������� ������ ���� ���� �ʾƵ� �Ǳ� ��.
from emp,dept
where emp.deptno = dept.deptno; --> deptno�� emp,dept���̺� ��� �ֱ� ������ �� �Ҽ��� ���������.

select ename,job,e.deptno,dname,loc --> select�������� deptno�� �� ���̺� �� �ֱ� ������ �Ҽ��� �������Ѵ�.
from emp e,dept d --> ���̺� ��Ī�� �༭ ���̺� �̸��� �����ϰ� ����� �� �ִ�. ��Ī�� ���̸� ���̺��� ���� �̸��� ����� �� ����.
where e.deptno = d.deptno and sal >= 3000;  --> �߰��� �ٸ� ������ ����� �� �ִ�. join���ǿ� �ش��ϴ� ������ �߿� �߰� ���Ǳ��� �ش��ϴ� �����͸� ��ȸ�Ѵ�.

-- non equi join
select ename,sal,grade,losal,hisal
from emp e,salgrade s
--where e.sal >= s.losal and e.sal <= s.hisal;
where e.sal between s.losal and s.hisal; --> between�� ����ϸ� �� ����������.

-- ���, �̸�, �޿�, �μ���ȣ, �μ���, �޿���� ��ȸ
select empno,ename,sal,d.deptno,dname,grade
from emp e,dept d,salgrade s
where e.deptno = d.deptno 
and e.sal between s.losal and s.hisal; --> equi ���ΰ� non equi������ �Բ� �� �� �ִ�.

-- self join
select e.empno,e.ename,e.mgr,m.ename
from emp e, emp m -- ���� ���̺��� ������ �� ���̺�� ����ٰ� ����. ���� �ݵ�� ��Ī�� �ο��ؾ���.
where e.mgr = m.empno;
--> ����� 14���ε� 13�� ��ȸ�� ���� : king�� mgr�� ���� ������ �񱳴�󿡼� ���ܰ� �ȴ�.

-- scott�� ���� �μ��� �ٹ��ϴ� ��� ��ȸ
select work.ename, friend.ename
from emp work, emp friend
where work.deptno = friend.deptno 
and work.ename = 'SCOTT'    -- scott�� ���� ����� ��ȸ
and friend.ename != 'SCOTT'; -- ��������
    
-- �ܺ�����(out join)
-- ��� �����Ǵ� �����͸� ���� ��ȸ�ϱ� ���ؼ� ���
select e.empno,e.ename,e.mgr,m.ename
from emp e, emp m -- �ݵ�� ��Ī�ο�
where e.mgr =  m.empno(+); -- �����Ͱ� ���� ���̺� �ʿ� (+)�� ���δ�.

select ename,sal,d.deptno,dname
from emp e, dept d
where e.deptno(+) = d.deptno;

-- ANSI join(ǥ�� ���� ���)
-- ����
-- cross join
-- natural join
-- inner join(equi, non equi,self)
-- outer join --> left, right, full ���(�����Ͱ� �ִ� ���� ������)
-- full�� ���� ��� ������ �����͸� ��ȸ���ش�.
select ename,sal,dname,loc
from emp e inner join dept d
on e.deptno = d.deptno;

select ename,sal,dname,loc
from emp e inner join dept d
using(deptno); -- ���� ���̺��� �÷����� �����ϴٴ� ���ǿ��� ��밡��

select ename,sal,dname,loc
from emp e inner join dept d
using(deptno)
where ename = 'SCOTT'; -- �߰������� ���� �� where�� ����Ѵ�

--ANSI join���� self join�� ǥ�� ����
select e.empno,e.ename,e.mgr,m.ename
from emp e inner join emp m
on e.mgr = m.empno;

--non equi ǥ������
select empno,ename,sal,grade
from emp e inner join salgrade s
on e.sal between s.losal and s.hisal;

--out joinǥ��
select e.empno,e.ename,e.mgr,m.ename
from emp e left outer join emp m  -- �����Ͱ� �ִ� ���� �����Ѵ�.
on e.mgr = m.empno;

-- ���� �������� ��
select empno,ename,sal,d.deptno,dname,grade
from emp e inner join dept d
on e.deptno = d.deptno
inner join salgrade s
on e.sal between s.losal and s.hisal;

-- �Ϲ� ������ ansi �������� �ٲٱ�
select ename,sal,d.deptno,dname
from emp e, dept d
where e.deptno(+) = d.deptno;
---->
select ename,sal,d.deptno,dname
from emp e right outer join dept d
on e.deptno = d.deptno;

-------------------------------------------------------------------------------
-- p.239~240(ansi join������� Ǯ��)
--1.
select e.deptno,dname,empno,ename,sal
from emp e inner join dept d
on e.deptno = d.deptno
where sal > 2000  --> �߰������� ���� �� inner join�ƴϰ� where
order by deptno;

select d.deptno,d.dname,e.empno,e.ename,e.sal
from emp e inner join dept d
on e.deptno = d.deptno
where e.sal > 2000
order by d.deptno;

--2.
select e.deptno,dname,trunc(avg(sal))as avg_sal,max(sal)as max_sal,min(sal)as min_sal,count(sal)as cnt
from emp e inner join dept d
on e.deptno = d.deptno
group by e.deptno,dname
order by deptno;

select e.deptno,d.dname,trunc(avg(sal))as avg_sal,max(sal)as max_sal,min(sal)as min_sal,count(*)as cnt
from emp e inner join dept d
on e.deptno = d.deptno -- using() : ��Ī ���� ������ ���ѵȴ�.
group by e.deptno,d.dname; --> e.deptno�� d.dname�� �Ϲ��÷��̱� ������ ������ �Լ��� ����� �� ��� �׷����� ������� ����� ����������.

--3.
select d.deptno,dname,empno,ename,job,sal
from emp e right outer join dept d
on e.deptno = d.deptno
order by deptno,dname;

select d.deptno,d.dname,e.empno,e.ename,e.job,e.sal
from emp e right outer join dept d
on e.deptno = d.deptno
order by d.deptno,e.ename;  --> �����ϴ� �÷� �� ����!

--4.
select d.deptno,dname,e.empno,e.ename,e.mgr,e.sal,e.deptno,losal,hisal,grade,e.mgr as mgr_empno,e.ename as mgr_ename
from emp e right outer join dept d
on e.deptno = d.deptno
inner join salgrade s
on e.sal between s.losal and s.hisal
left outer join emp m
on e.mgr = m.empno
order by e.deptno,empno;

select d.deptno,d.dname,e.empno,e.ename,e.mgr,e.sal,e.deptno,s.losal,s.hisal,s.grade,m.empno,m.ename
from emp e right outer join dept d
on e.deptno = d.deptno
full outer join salgrade s
on e.sal between s.losal and s.hisal
left outer join emp m
on e.mgr = m.empno
order by d.deptno, e.empno;

--------------------------------------------------------------------------------
-- �������� : sql���� �����ϴ� �� �ʿ��� �����͸� �߰��� ��ȸ�ϱ� ���� sql�� ���ο��� ����ϴ� select ���̴�.
-- where���� select���� ��ø�ؼ� ���

-- ������ �������� : �������� �ϳ�
-- scott����� �ٹ��� �μ����� ��ȸ
select deptno
from emp
where enmae = 'SCOTT';  -- 20

select dname
from dept
where deptno = 20;
---> �� ������ ���ļ� ���������� �����.
select dname
from dept
where deptno = (
select deptno
from emp
where ename = 'SCOTT'
);  --> ���� 20��� 20�� ������ ������������ �״�� �ۼ��Ѵ�.
                
-- �޿��� ���帹�� �޴� ����� �̸� ��ȸ
-- select ename, max(sal)
-- from emp;
--> �̷��� ǥ���� �� ��� ���������� ����Ͽ� �Ʒ�ó�� �ۼ��Ѵ�.

select ename,sal
from emp
where sal = (
select max(sal)
from emp
);

-- DALLAS���� �ٹ��ϴ� ����� �̸��� �μ���ȣ ��ȸ
select ename,deptno
from emp
where deptno = (
select deptno
from dept
where loc = 'DALLAS'
);
                
-- �ڽ��� ���ӻ���� KING�� ����� �̸��� �޿��� ��ȸ
select ename,sal
from emp
where mgr = (
select empno
from emp
where ename = 'KING'
);
            
-- ������ �������� : �������� ������
-- �Ϲ� �񱳿����� ���ȵ�
-- in : ��� �߿� �ϳ��� �����ϸ� �ȴ�.
-- >any : ��� �߿� ���� ������ ���� ũ�� �ȴ�
-- >all : ����߿� ���� ū�� ���� ũ�� �ȴ�

--in() : �������� �ϳ��� ��ġ�ϸ� ��ȸ
select *
from emp
where sal in(5000,3000,2850);
--> �������������� �ٲٱ�

select *
from emp
where sal in(
select max(sal)
from emp
group by deptno
);
                
--any()
select *
from emp
where sal = any(
select max(sal)   -- any�� �ܵ����� �� �� ���� �ε�ȣ�� �ٿ����Ѵ�.
from emp
group by deptno
);
    
-- all()      
select ename,sal
from emp
where sal > all(
select sal      -- ���� ū ������ ũ�� ��ȸ
from emp
where deptno = 30
);

-- ���߿� �������� : ���������� select���� ���� �����͸� ������ �����ϴ� ���
select *
from emp
where (deptno,sal) in(
select deptno,max(sal)
from emp
group by deptno
);


-- 2022.10.21


-- DML(���������۾�) : insert, update, delete

-- insert : ���̺� ������ ����
-- insert into ���̺�� ( �÷���1,�÷���2,...)
-- values (��1,��2,...)
-- �÷��� ���� Ÿ�԰� ������ ��ġ�ؾ� �Ѵ�
-- �ۼ� ������� 1 : 1 ��Ī�ؾߵȴ�

create table dept_temp
as
select * from dept;

select *
from dept_temp;

insert into dept_temp (deptno,dname,loc)
values (50,'DATABASE','SEOUL');

insert into dept_temp -- �÷�����
values (70,'HTML','SEOUL');

insert into dept_temp -- �÷�����, ����� null ������ ����
values (80,'HTTP',null);

insert into dept_temp (deptno,dname)-- ������ null ������ ����
values (60,'JSP');

create table emp_temp -- �����͸� ���ְ� �÷��� �����´�
as
select * from emp
where 1 != 1;

select *
from emp_temp;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values (9999,'ȫ�浿','PRESIDENT',NULL,'2001/01/01',5000,1000,10);

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values (3111,'��û��','MANAGER',9999,sysdate,4000,null,30);

-- update : �÷��� �����͸� ����(����)
-- update ���̺��
-- set �÷��� = ��, �÷��� = ��, ...
-- where ���ǽ�
-- �������� ������� ������ �ش� �÷��� ��� ����ȴ�

-- ��Ÿ������ �����ߴ�
-- update emp_temp
-- set job = 'MANAGER'
-- where ename = '��û��';

create table dept_temp2
as
select * from dept;

select *
from dept_temp2;

update dept_temp2
set loc = 'SEOUL'; -- where���� �Ƚ�⶧���� ��� loc�� �����ȴ�

drop table dept_temp2; -- ���̺� ����

update dept_temp2
set dname = 'DATABASE', loc = 'SEOUL'
where deptno = 40;

-- delete(������ ����)
-- delete from ���̺��
-- where ���ǽ�
-- �������� ������� ������ ��� ���� ������

create table emp_temp2
as
select * from emp;

select *
from emp_temp2;

delete from emp_temp2; -- ������ ��ü����

delete from emp_temp2
where ename = 'SCOTT'; -- SCOTT�̶�� ����� �����͸� ����

-- TCL(�������� �������� �Ǵ� ���)
-- Ʈ�����
-- commit, rollback, savepoint
-- commit : ������ ���� ����(���̺��� ������ �ݿ�)
--          create������ ����ؼ� ��ü�����Ҷ�(�ڵ�)
--          developer ������ commit�� ����� �ܺο����� ���δ�
-- rollback : ������ ���� ���(���̺��� ������ �̹ݿ�) ���󺹱�
--            õ������,����,����(�ڵ�)
--            commit ���Ŀ��� �ѹ��� �ȵȴ�

create table dept01
as
select * from dept;

select *
from dept01;

delete from dept01;

drop table dept01;

-- commit;
rollback;

create table dept02
as
select * from dept;

select *
from dept02;

drop table dept02;

-- Ʈ����� ���� ����

delete from dept02;

truncate table dept02; -- truncate ��������(�����͸� �������ڸ��� �ڵ�commit�� �߻�)

-- DDL(������ ���Ǿ�) : table(��簴ü)�� ����, ����, �����ϴ� ��ɾ�
-- create(����), alter(����), drop(����)

-- create table ���̺��( -- table(��ü)
-- �÷���1 Ÿ��,          -- column(�Ӽ�)
-- �÷���2 Ÿ��,
-- �÷���3 Ÿ��
-- );

create table emp_ddl(
-- ���,�̸�,��å,������,�Ի���,�޿�,������,�μ���ȣ
empno number(4),
ename varchar2(10), -- ũ��� byte
job varchar2(9),
mgr number(4),
hiredate date,
sal number(7,2), -- 7�ڸ��� 2�ڸ��� �Ҽ������� ��� �������� ������ 5�ڸ�
comm number(7,2),
deptno number(2)
);

select *
from emp_ddl;

insert into emp_ddl
values (9999,'�̼���','MANAGER',1111,sysdate,1000,null,10);

create table dept_ddl -- ���̺��� ����(������ȣ �� �纻�׽�Ʈ��)
as
select * from dept;

create table dept_30
as
select * from dept
where deptno = 30;

select *
from dept_30;

create table dept_m
as
select dname,loc 
from dept;

select *
from dept_m;

create table dept_d
as
select * from dept
where 1 != 1; -- ���̺��� ������ �����Ѵ�

select *
from dept_d;

-- ���̺� ����(�÷��� ��������)
-- ���ο� �÷��߰�, �÷��� �̸�����, �ڷ����� ����, �÷��� ����
-- add, rename, modify, drop
-- alter

create table emp_alter
as
select * from emp;

select *
from emp_alter;

alter table emp_alter
add address varchar2(100);

alter table emp_alter
rename column address to addr;

alter table emp_alter
modify empno number(10);

alter table emp_alter
drop column addr;

-- ���̺���� DROP
-- drop table ���̺��


-- ex 01
create table emp_hw (
empno number(4),
ename varchar2(10),
job varchar2(9),
mgr varchar2(4),
hiredate date,
sal number(7,2),
comm number(7,2),
deptno number(2)
);

-- ex 02
alter table emp_hw
add bingo varchar2(20);

-- ex 03
alter table emp_hw
modify bingo varchar2(30);

-- ex 04
alter table emp_hw
rename column bingo to remark;

-- ex 05
insert into emp_hw
select empno,ename,job,mgr,hiredate,sal,comm,deptno,null
from emp;

-- ex 06
drop table emp_hw;

-- ������ ����
desc user_tables;

select table_name -- ������ ���̺�����
from user_tables;

select table_name -- ��ü ���̺����
from all_tables;

select owner,table_name -- ���̺��� ����
from all_tables;

-- index(�˻��ӵ��� ����ϱ����� ����ϴ� ��ü)
-- create, drop
-- select ������ �˼��� ����Ų��
-- ��ü ���ڵ��� 3~5%�����϶� index��ü�� �÷��� �����ؼ� ����Ѵ�

-- create index �ε�����
-- on ���̺��(�÷���)

create table emp01
as
select * from emp;

select *
from emp01;

insert into emp01
select * from emp01;

drop table emp01;

insert into emp01(empno,ename)
values (1111,'bts');

-- index ��ü ������
select empno,ename
from emp01
where ename = 'bts';

-- index ��ü ������
create index idx_emp01_ename
on emp01(ename);

drop index idx_emp01_ename;

-- ���̺� ������ ���󺹱�
show recyclebin; -- �����Ѹ���Ʈ����(������)

-- flashback table ���̺��_alter �����뿡�� ���Ϸ� �����ϱ�
-- to before drop;

purge recyclebin; -- ������ ����

-- ��������(���Ἲ) : �߸��� ���� �����ͷ� ���Ǵ°� ���ϰ� �ϴ� ��
-- not null (null�� ������������)
-- unique (�ߺ��� ����������� ��, null���� ����)
-- primary key (�⺻Ű - �����ϰ� ������ �� �� �ְԲ� ���� �����Ѵ� null���� �ߺ��� �Ұ�����)
-- foreign key (�ܷ�Ű/����Ű) (foreign key�� ���� �ȵǰ� references�� ��߸� �Ѵ�)
-- 1. �θ�� �ڽ��� ���踦 ������ �ڽ��� ���̺� �÷��� �����Ѵ�
-- 2. �θ��� ���̺��� �÷��� �ݵ�� primary key �Ǵ� unique �ؾ��Ѵ�
-- check
-- default

-- emp,dept

-- insert into emp / ���Ἲ ���������� ����(�θ�Ű�� ����) 
-- values (1111,'aaa','MANAGE','9999',sysdate,1000,null,50);

drop table emp02;

create table emp02(
empno number(4)constraint emp02_empno_pk primary key, -- not null unique �� null�� ��뵵 ���ϸ鼭 �ߺ��� �Ұ���Ų�� - �Ѵ� ��ġ�� primary key�� �ȴ�
ename varchar2(10)not null,
job varchar2(9),
deptno number(2)
);

-- not null �̶�� null���� ������� �ʱ⿡ null�� ������ ������ �����
insert into emp02
values (null,null,'MANAGER',30);

insert into emp02
values (1111,'ȫ�浿','MANAGER',30);

insert into emp02
values (1111,'�̼���','MANAGER',20);

insert into emp02
values (null,'������','SA:ESMAN',20);

select *
from emp02;


-- 2022.10.24


-- ���̺��� ����� �����̸Ӹ� ���� �͵��� ������� �����Ƿ� ���� �������ϴ� ��쵵 �ִ�

create table emp03 (
empno number(4) constraint emp03_empno_pk primary key,
ename varchar2(9) constraint emp03_empno_nn not null,
job varchar2(9),
deptno number(2) constraint emp03_deptno_fk references dept03(deptno) -- �̰͸� ����� �θ����̺��� ���� ����� �ڽ����̺��� ���߿� �����
);

create table dept03(
deptno number(2) constraint dept03_deptno_pk primary key,
dname varchar2(20) constraint dept03_dname_nn not null,
loc varchar2(20) constraint dept03_loc_nn not null
);

drop table dept03;

insert into detp03
select * from dept;

insert into emp03
select empno,ename,job,deptno from emp;

insert into emp03
values (1111,'aaa','MANAGE',50);

create table emp04 (
empno number(4) primary key,
ename varchar2(10)not null,
sal number(7)constraint emp04_sal_ck check(sal between 500 and 5000), -- 500�� 5000������ ���� ���� �� �ִ�
gender varchar2(2) constraint emp04_gender_ck check(gender in('M','F')) --  M �� F�� ���� �� �ְ� �����Ǿ���
);
-- constraint �� ���������� �������� ���迡���� �����̴�

select * from emp04;

insert into emp04
values(1111,'hong',1000,'M');

insert into emp04
values(2222,'hong',200,'M');

insert into emp04
values(3333,'hong',1000,'A');

create table dept04(
deptno number(2) primary key,
dname varchar2(10) not null,
loc varchar2(15) default 'SEOUL' -- �⺻���� null�� �Ǵ°� �ƴ϶� 'SEOUL'�� ��ü�Ǵ� ����Ʈ ���� ����
);

select * from dept04;

insert into dept04(deptno,dname)
values(10,'SALES');

insert into dept04(deptno,dname,loc)
values(20,'SALES','BUSAN');

-- �������� �������
-- �÷������� ���� (not null�� �÷� ���������� ���밡���ϴ�)
-- ���̺� ������ ���� (not null�� ���� �� �� ����)

create table emp05(
empno number(4),
ename varchar2(20) constraint emp05_ename_nn not null,
job varchar2(20),
deptno number(20),

constraint emp05_empno_pk primary key(empno),
constraint emp_05_job_uk unique(job),
constraint emp_05_deptno_fk foreign key(deptno) references dept(deptno)
-- ������� foreign key�� ���� �ȵǰ� references�� ������
-- ���̺� ������ ���������� foreign key�� ���� �����Ŀ� references�� ����)
);

insert into emp05
values(3333,'hong','PRESIDENT',80);

-- ����Ű(�⺻Ű�� �ΰ��� �÷��� ����ϴ� ���)
-- ���̺� ���� ������θ� ���밡��
-- 1. ���̺�ȿ��� �����ϴ� ���
-- 2. Alter ��ɾ� ����ϴ� ���

create table member(
name varchar2(10),
address varchar2(30),
hphone varchar2(10),

constraint member_name_adress_pk primary key(name,address)
);

create table emp06 (
empno number(4),
ename varchar2(20),
job varchar2(20),
deptno number(20)
);

alter table emp06
add constraint emp06_empno_pk primary key(empno);

alter table emp06
add constraint emp06_empno_fk foreign key(deptno) references dept(deptno);

-- not null�� ������ ����(null -> not null)
-- �÷��� �ִ� ��ġ�� ���̴�
alter table emp06
modify job constraint emp06_job_nn not null;

alter table emp06
modify ename constraint emp06_ename_nn not null;

-- drop �������Ǹ�(constraint) �Ǵ� ��������(primary key)
-- ���� ���Ǹ��� ���ִ°� ���� �����ϴ�(���������� �� �ÿ� ��ü�� ������ �� ������ �ִ�)
alter table emp06
drop constraint emp06_empno_pk;

create table emp07 ( -- 1��
empno number(4),
ename varchar2(20),
job varchar2(20),
deptno number(20)
);

alter table emp07
add constraint emp07_empno_pk primary key(empno); -- 2��

alter table emp07
add constraint emp07_empno_fk foreign key(deptno) references dept07(deptno); -- �Ǹ����� 5��

create table dept07( -- 3��
deptno number(2),
dname varchar2(10),
loc varchar2(15)
);

alter table dept07 -- 4��
add constraint dept07_deptno_pk primary key(deptno);

insert into dept07
select* from dept;

insert into emp07
select empno,ename,job,deptno
from emp;

delete from dept07
where deptno = 10; -- �ڽ� ���ڵ尡 �߰��� �Ǿ��⋚���� �θ� ���ڵ带 ���� �� ����

-- alter table dept07
-- disable primary key cascade; ��Ȱ��ȭ�� ���� �θ� ���ڵ带 ����� �ִ� 

-- alter table dept07
-- drop primary key; -- �ڽķ��ڵ尡 ���� �ֱ⶧���� ���� �� ����

-- alter table dept07
-- drop primary key cascade; -- ���� ������ ���� ��Ų��

--p.394 ���̺��� ���� ������� Ǯ��
-- 1. dept_const ���̺�
create table dept_const(
    deptno number(2),
    dname varchar2(14),
    loc varchar2(13)
);

alter table dept_const
add constraint deptconst_deptno_pk primary key(deptno);

alter table dept_const
add constraint deptconst_daname_unq unique(dname);

alter table dept_const
modify loc constraint deptconst_loc_nn not null;

-- 2. emp_const���̺�
create table emp_const(
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    tel varchar2(20),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2)
);

alter table emp_const
add constraint empconst_empno_pk primary key(empno);

alter table emp_const
modify ename constraint empconst_empno_nn not null;

alter table emp_const
add constraint empconst_tel_unq unique(tel);

alter table emp_const
add constraint empconst_sal_chk check(sal between 1000 and 9999);

alter table emp_const
add constraint empconst_deptno_fk foreign key(deptno) references dept_const(deptno);

--------------------------------------------------------------------------------
-- ��(p.338)--
-- ��ü(=create ��ɾ Ȱ���Ͽ� ���� ����ϴ� ��) : table, index, view
-- create or replace view �����̺��([alias])
-- as
-- ��������(select)
-- [with chect option]
-- [with read only]
-- �ܼ��� : ���������� ���̺� �Ѱ��� ���
-- ���պ� : ���������� ���̺� ������ ���

create table dept_copy
as
select * from dept;

create table emp_copy  -- ����Ǵ� ���̺��� ���������� �Ѿ���� �ʴ´�
as
select * from emp;

alter table emp_copy  -- �������� �߰�
add constraint emp_copy_deptno_fk foreign key(deptno) references dept(deptno);

select * from emp_copy;  -- 14���� �����Ͱ� ��ȸ��

-- 30�� �μ��� ��ȸ
create or replace view emp_view30
as
select empno,ename,sal,deptno from emp_copy
where deptno = 30;
--> "������ ������մϴ�"�� �߸� �ý��۰������� scott�� ���� view���� ������ Ǯ�������

select * from emp_view30;

insert into emp_view30 -- ������ ���� ����. �׷��� ���� ������ ó���� ���� ���̺��� �Ͼ��.
values(1111,'hong',1000,30);

select * from emp_copy; 

insert into emp_view30(empno,ename,sal) -- foreign key ���������� null�� ����ϱ� ������ ������ ������ �����ϴ�
values(2222,'hong',2000);

insert into emp_view30(empno,ename,sal,deptno) -- �������̺��� foreign key �������ǿ� ����Ǳ� ������ ������ ������ �Ұ����ϴ�
values(2222,'hong',2000,50);

-- ��Ī �ο�
create or replace view emp_view(�����ȣ,�����,�޿�,�μ���ȣ)
as
select empno,ename,sal,deptno from emp_copy;

select * from emp_view;

select * from emp_view
where �μ���ȣ = 20;  -- ������ ��Ī���� �˻��ؾ���
-- where deptno = 20;  >> error. �������̺��� �÷����� ���Ұ�

-- ���պ�
create or replace view emp_dept_view
as
select empno,ename,sal,e.deptno,dname,loc
from emp_copy e inner join dept_copy d
on e.deptno = d.deptno
order by empno desc;

select * from emp_dept_view;

-- ���� : �μ��� �ּ� �޿��� �ִ�޿��� �並 ����� ��ȸ�ϱ�
-- dname, min_sal, max_sal
create or replace view sal_view
as
select dname,min(sal) as min_sal,max(sal) as max_sal -- as�� ����Ͽ� ��Ī�� �൵ ��
from emp_copy e inner join dept_copy d
on e.deptno = d.deptno
group by d.dname;

select * from sal_view;


-- 2022.10.25


-- ��� ��ü�� �̸��� �ߺ��� �� ����

-- [with chect option]
create or replace view view_chk30
as
select empno,ename,sal,comm,deptno
from emp_copy
where deptno = 30 with check option; -- �������� �÷��� �������� ���ϰ� �Ѵ�

update view_chk30
set deptno = 10;
-- ���� with check option�� ���ǿ� ���� �˴ϴ�

-- [with read only]
create or replace view view_read30
as 
select empno,ename,sal,comm,deptno
from emp_copy
where deptno = 30 with read only; -- ��� �÷��� ���� C U D �� �Ұ���

update view_read30
set deptno = 10;
-- �б����� �信���� DML�۾��� ������ �� �����ϴ�(insert, update, delete)

-- ���� Ȱ��
-- TOP - N ��ȸ�ϱ�
-- rownum
select * from emp;

-- �Ի����� ���� ���� 5���� ����� ��ȸ
select * from emp
order by hiredate asc;

select * from emp
where hiredate <= '81/05/01';

select rownum,empno,ename,hiredate
from emp
where rownum <= 5;

select rownum,empno,ename,hiredate 
from emp
order by hiredate asc;
-- rownum�� ���� ������ �ǰ� order by�� �Ǹ������� ������ �Ǳ⋚���� ���ڰ� ���δ�(��߳���)
-- �׷��Ƿ� ���� rownum�� ���°� ��õ�Ѵ�

-- ���� order by�� ���Ÿ� view�� ���°� ����
create or replace view view_hiredate
as
select empno,ename,hiredate
from emp
order by hiredate asc;

select * from view_hiredate;

-- �ٵ� �ѹ� ���ĵ� view�� rownum�� ���ٸ� ��ȣ�� ����� ���´�
select rownum,empno,ename,hiredate
from view_hiredate;

-- rownum���� ���� ���� ����
select rownum,empno,ename,hiredate
from view_hiredate
where rownum <= 7;

select rownum,empno,ename,hiredate
from view_hiredate
where rownum between 2 and 5; -- rownum�� �������� ���� ���� 1�� �����ϴ� ���ǽ��� ������ �Ѵ�

-- �׷��Ƿ� �����̺��� �ٽ� ����� rownum�� �÷�ȭ�ؾ��Ѵ�
create or replace view view_hiredate_rm
as
select rownum rm,empno,ename,hiredate -- rownum�� �Ҵ�����ٷ��� ��Ī�� �ٿ� �÷�ȭ(�ν�?����?)�� ��������Ѵ�
from view_hiredate;

select rm,empno,ename,hiredate
from view_hiredate_rm
where rm between 2 and 5;

-- �ζ��� ��
select rm,empno,ename,hiredate
from(
select rownum rm, empno,ename,hiredate
from(
select empno,ename,hiredate
from emp
order by hiredate asc
) -- a���̺�
)
where rm >=2 and rm <= 5; -- b���̺�
-- �� �Ʒ� ���� ������� ����
select rm,b.*
from(
select rownum rm,a.*
from(
select empno,ename,hiredate
from emp
order by hiredate asc
)a -- a���̺�
)b -- b���̺�
where rm >=2 and rm <= 5;

-- �Ի����� ���� ���� 5���� ��ȸ�ϼ���
-- �ζ��κ�
select rownum,empno,ename,hiredate 
from(
select empno,ename,hiredate
from emp
order by hiredate asc
)
where rownum <= 5;

-- ������ ��ü
-- �ڵ����� ��ȣ�� ������Ű�� ����� �����Ѵ�
-- create, drop

-- create sequence ��������
-- start with ���۰�
-- increment by ����ġ
-- maxvalue �ִ밪 => 10�� 1027����
-- minvalue �ִ밪 => 10�� -1027����

create sequence dept_deptno_seq
increment by 10
start with 10;

select dept_deptno_seq.currval -- Ȯ�ο�
from dual;

select dept_deptno_seq.nextval -- �������� ���
from dual;

create sequence emp_seq
start with 1
increment by 1
maxvalue 1000;

drop table emp01;

create table emp01
as 
select empno,ename,hiredate from emp
where 1 != 1;

select * from emp01;

insert into emp01
values (emp_seq.nextval,'hong',sysdate);























































































