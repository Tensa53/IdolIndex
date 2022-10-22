USE casadiscografica;

-- durata album (versione derivabile)
SELECT B.CodiceDisco,D.Titolo,sum(B.Durata) AS DurataDisco
FROM BRANO B JOIN DISCO D ON B.CodiceDisco = D.AN
GROUP BY B.CodiceDisco,D.Titolo
HAVING B.CodiceDisco <> '';

-- numero brani album (versione derivabile)
SELECT B.CodiceDisco,D.Titolo,count(B.CodiceDisco) AS NumeroBrani
FROM BRANO B JOIN DISCO D ON B.CodiceDisco = D.AN
GROUP BY B.CodiceDisco,D.Titolo
HAVING B.CodiceDisco <> '';

-- Elencare i brani che non sono parte di un disco evidenziando il fatto che siano dei singoli
SELECT B.Titolo,B.Idol,D.Titolo as Disco
FROM BRANO B LEFT JOIN DISCO D ON B.CodiceDisco = D.AN
WHERE B.CodiceDisco is NULL;

-- contare il numero di brani 
SELECT count(*) AS NumeroBrani
FROM BRANO B;

-- contare il numero di brani per Idol
SELECT count(*) AS NumeroBrani,B.Idol
FROM BRANO B
GROUP BY B.Idol;

-- elencare gli idol che hanno un numero di brani maggiore di 2
SELECT count(*) AS NumeroBrani,B.Idol
FROM BRANO B
GROUP BY B.Idol
HAVING NumeroBrani > 2;

-- elencare gli idol che hanno il maggior numero di brani
DROP VIEW IF EXISTS BraniIdol;
CREATE VIEW BraniIdol AS (SELECT count(*) AS NumeroBrani,B.Idol
						  FROM BRANO B
						  GROUP BY B.Idol);
                          
SELECT *
FROM BraniIdol
WHERE NumeroBrani = (SELECT max(NumeroBrani) FROM BraniIdol);

-- elencare gli idol che si sono esibiti in tutti i MusicShow
SELECT B.Idol FROM BRANO B WHERE NOT EXISTS (SELECT * FROM MUSICSHOW M WHERE NOT EXISTS (SELECT * FROM ESIBIZIONE E
																						 WHERE E.ShowOspitante = M.Nome AND E.BranoEseguito = B.Titolo AND E.IdolEsibito = B.Idol));
