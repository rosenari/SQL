-- 없어진 기록 찾기

SELECT b.ANIMAL_ID, b.NAME
FROM ANIMAL_INS as a
RIGHT OUTER JOIN ANIMAL_OUTS as b
ON a.ANIMAL_ID = b.ANIMAL_ID
WHERE a.ANIMAL_ID IS NULL
ORDER BY b.ANIMAL_ID;

-- 있었는데요 없었습니다

SELECT A.ANIMAL_ID, A.NAME
FROM ANIMAL_INS as A
INNER JOIN ANIMAL_OUTS as B
ON A.ANIMAL_ID = B.ANIMAL_ID
WHERE B.DATETIME < A.DATETIME
ORDER BY A.DATETIME;

-- 오랜 기간 보호한 동물(1)

SELECT A.NAME, A.DATETIME
FROM ANIMAL_INS AS A
LEFT OUTER JOIN ANIMAL_OUTS AS B
ON A.ANIMAL_ID = B.ANIMAL_ID
WHERE B.ANIMAL_ID IS NULL
ORDER BY A.DATETIME LIMIT 3;

-- 보호소에서 중성화한 동물

SELECT A.ANIMAL_ID, A.ANIMAL_TYPE, A.NAME
FROM ANIMAL_INS AS A
INNER JOIN ANIMAL_OUTS AS B
ON A.ANIMAL_ID = B.ANIMAL_ID
WHERE A.SEX_UPON_INTAKE LIKE '%Intact%' AND B.SEX_UPON_OUTCOME NOT LIKE '%Intact%'
ORDER BY ANIMAL_ID;
