--getNoticeList
SELECT ROWNUM, NOTICE.* FROM NOTICE ORDER BY REGDATE DESC;

SELECT * FROM (
    SELECT ROWNUM NUM, N.*
    FROM (SELECT * FROM NOTICE ORDER BY REGDATE DESC) N
)
WHERE NUM BETWEEN 6 AND 10;
SELECT * FROM (
    SELECT ROW_NUMBER() OVER (ORDER BY REGDATE DESC) NUM,
        NOTICE.* FROM NOTICE
)
WHERE NUM BETWEEN 6 AND 10;

--getNoticeCount

--getNotice

--getNextNotice
SELECT * FROM NOTICE
WHERE ID=(
    SELECT ID FROM NOTICE WHERE REGDATE > (SELECT REGDATE FROM NOTICE WHERE ID=3)
    AND ROWNUM=1
);
--getPrevNotice
SELECT * FROM NOTICE
WHERE ID=(
    SELECT ID 
    FROM (SELECT * FROM NOTICE ORDER BY REGDATE DESC) 
    WHERE REGDATE < (SELECT REGDATE FROM NOTICE WHERE ID=3)
    AND ROWNUM=1
);