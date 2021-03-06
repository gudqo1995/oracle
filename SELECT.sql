--ORDER BY 정렬
--ASC, DESC
SELECT * FROM NOTICE ORDER BY HIT DESC;
SELECT * FROM MEMBER WHERE NAME LIKE '박%' ORDER BY AGE;
--2차 정렬
UPDATE NOTICE SET HIT=23 WHERE WRITER_ID='okay';
SELECT * FROM NOTICE ORDER BY HIT DESC, REGDATE DESC;

--집계함수, GROUP BY
SELECT COUNT(TITLE) FROM NOTICE; --null값은 안셈
INSERT INTO NOTICE(ID, REGDATE, HIT, WRITER_ID)
VALUES(8, SYSDATE, 3, 'newlec');
SELECT WRITER_ID, COUNT(ID) COUNT FROM NOTICE GROUP BY WRITER_ID;
SELECT AVG(HIT) FROM NOTICE;
SELECT WRITER_ID, COUNT(ID), TITLE FROM NOTICE GROUP BY WRITER_ID;
--TITLE은 집계랑 상관없는 내용이기 떄문에 에러남
SELECT WRITER_ID, COUNT(ID) COUNT
FROM NOTICE
GROUP BY WRITER_ID
ORDER BY COUNT(ID) DESC;
--실행 순서: FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY -> SELECT
--그래서 SELECT에서 별칭쓴거는 ORDER BY 에서 사용 불가능
--집계함수는 GROUP BY 이후부터 사용 가능

--HAVING 집계된 결과를 필터링 할때 사용
SELECT WRITER_ID, COUNT(ID) COUNT
FROM NOTICE
GROUP BY WRITER_ID
HAVING COUNT(ID)<2
ORDER BY COUNT(ID) DESC;

--RANK 함수
SELECT ROWNUM, ID, TITLE, WRITER_ID, REGDATE, HIT
FROM NOTICE
ORDER BY HIT;
--ROWNUM은 WHERE절 실행될 때 만들어짐, 그리고 나서 ORDER BY로 정렬하면서 ROWNUM이 흐트러짐
--ROW_NUMBER이라는 함수 사용하기
SELECT ROW_NUMBER() OVER (ORDER BY HIT), ID, TITLE, WRITER_ID, REGDATE, HIT
FROM NOTICE;
SELECT RANK() OVER (ORDER BY HIT), ID, TITLE, WRITER_ID, REGDATE, HIT
FROM NOTICE;
SELECT DENSE_RANK() OVER (PARTITION BY WRITER_ID ORDER BY HIT DESC), ID, TITLE, WRITER_ID, REGDATE, HIT
FROM NOTICE;

--부조회 (서브쿼리)
SELECT *
FROM NOTICE
ORDER BY REGDATE DESC
WHERE ROWNUM BETWEEN 1 AND 5;
--이렇게 정렬을 먼저 해야 한다고 해서 ORDER BY절을 앞에 사용할 순 없음
SELECT *
FROM (
    SELECT * FROM NOTICE ORDER BY REGDATE DESC
)
WHERE ROWNUM BETWEEN 1 AND 5;
--FROM절에 테이블 대신 먼저 정렬된 결과(서브쿼리)를 집어넣을 수 있음

--이렇게 먼저 수행해야될게 있을 경우도 서브쿼리 사용
SELECT * FROM MEMBER WHERE AGE>=(SELECT AVG(AGE) FROM MEMBER);