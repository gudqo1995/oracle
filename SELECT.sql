--ORDER BY ����
--ASC, DESC
SELECT * FROM NOTICE ORDER BY HIT DESC;
SELECT * FROM MEMBER WHERE NAME LIKE '��%' ORDER BY AGE;
--2�� ����
UPDATE NOTICE SET HIT=23 WHERE WRITER_ID='okay';
SELECT * FROM NOTICE ORDER BY HIT DESC, REGDATE DESC;

--�����Լ�, GROUP BY
SELECT COUNT(TITLE) FROM NOTICE; --null���� �ȼ�
INSERT INTO NOTICE(ID, REGDATE, HIT, WRITER_ID)
VALUES(8, SYSDATE, 3, 'newlec');
SELECT WRITER_ID, COUNT(ID) COUNT FROM NOTICE GROUP BY WRITER_ID;
SELECT AVG(HIT) FROM NOTICE;
SELECT WRITER_ID, COUNT(ID), TITLE FROM NOTICE GROUP BY WRITER_ID;
--TITLE�� ����� ������� �����̱� ������ ������
SELECT WRITER_ID, COUNT(ID) COUNT
FROM NOTICE
GROUP BY WRITER_ID
ORDER BY COUNT(ID) DESC;
--���� ����: FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY -> SELECT
--�׷��� SELECT���� ��Ī���Ŵ� ORDER BY ���� ��� �Ұ���
--�����Լ��� GROUP BY ���ĺ��� ��� ����

--HAVING ����� ����� ���͸� �Ҷ� ���
SELECT WRITER_ID, COUNT(ID) COUNT
FROM NOTICE
GROUP BY WRITER_ID
HAVING COUNT(ID)<2
ORDER BY COUNT(ID) DESC;

--RANK �Լ�
SELECT ROWNUM, ID, TITLE, WRITER_ID, REGDATE, HIT
FROM NOTICE
ORDER BY HIT;
--ROWNUM�� WHERE�� ����� �� �������, �׸��� ���� ORDER BY�� �����ϸ鼭 ROWNUM�� ��Ʈ����
--ROW_NUMBER�̶�� �Լ� ����ϱ�
SELECT ROW_NUMBER() OVER (ORDER BY HIT), ID, TITLE, WRITER_ID, REGDATE, HIT
FROM NOTICE;
SELECT RANK() OVER (ORDER BY HIT), ID, TITLE, WRITER_ID, REGDATE, HIT
FROM NOTICE;
SELECT DENSE_RANK() OVER (PARTITION BY WRITER_ID ORDER BY HIT DESC), ID, TITLE, WRITER_ID, REGDATE, HIT
FROM NOTICE;

--����ȸ (��������)
SELECT *
FROM NOTICE
ORDER BY REGDATE DESC
WHERE ROWNUM BETWEEN 1 AND 5;
--�̷��� ������ ���� �ؾ� �Ѵٰ� �ؼ� ORDER BY���� �տ� ����� �� ����
SELECT *
FROM (
    SELECT * FROM NOTICE ORDER BY REGDATE DESC
)
WHERE ROWNUM BETWEEN 1 AND 5;
--FROM���� ���̺� ��� ���� ���ĵ� ���(��������)�� ������� �� ����

--�̷��� ���� �����ؾߵɰ� ���� ��쵵 �������� ���
SELECT * FROM MEMBER WHERE AGE>=(SELECT AVG(AGE) FROM MEMBER);