--숫자를 문자열로 변환
SELECT TO_CHAR(12345678, '$99,999,999,999.99') FROM DUAL;
SELECT TRIM(TO_CHAR(1234567890.34567, '99,999,999,999.99')) || '원' FROM DUAL;

--날짜를 문자열로 변환
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD PM HH24:MI:SS') FROM DUAL;

--문자열을 날짜로 변환
SELECT TO_DATE('2020-08-04 13:04:51', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;

--문자열을 숫자 형식으로 변환
SELECT TO_NUMBER('2020') + 1 FROM DUAL;