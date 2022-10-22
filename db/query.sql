USE casadiscografica;

-- 1. Elencare in ordine decrescente di Ora Inizio gli show che si svolgono la Domenica e il cui nome inizia per 'M' oopure quelli che iniziano per 'T' (Nome,Giorno,Ora Inizio) 
SELECT Nome,OraInizio,Giorno
FROM MUSICSHOW M
WHERE (M.Giorno = "Domenica" AND M.Nome LIKE 'M%') OR M.Nome LIKE 'T%'
ORDER BY (M.Orainizio) DESC;

-- 2. Elencare i brani realizzati dall'Autore 'Pawoo' che hanno una durata maggiore di 3 minuti - 180 secondi - e sono titletrack (Brano.Titolo,Brano.Idol,Autore.NomeArte)
SELECT B.Titolo,B.Idol,A.NomeArte
FROM (AUTORE A JOIN REALIZZAZIONE R ON A.NomeArte = R.NomeArte) JOIN BRANO B ON B.Titolo = R.Titolo AND B.Idol = R.Idol
WHERE A.NomeArte = "Pawoo" AND B.Durata > 180 AND B.Titletrack = true;

-- 3. Contare il numero di profili Social
SELECT count(*) AS NumeroProfili
FROM SOCIAL;

-- 4. Contare il numero di profili Social e raggruppa per Idol
SELECT Idol,count(*) AS NumeroProfili
FROM SOCIAL S
GROUP BY S.Idol;

-- 5. Elencare gli  idol che hanno un numero di profili maggiore uguale di 2 (Idol.Pseudonimo,Idol.Nome,Idol.Cognome,NumeroProfili)
SELECT I.Pseudonimo,I.Nome,I.Cognome,count(*) as NumeroProfili
FROM IDOL I JOIN SOCIAL S ON I.Pseudonimo = S.Idol
GROUP BY I.Pseudonimo,I.Nome,I.Cognome
HAVING NumeroProfili >= 2;

-- 6. Elencare gli idol il cui numero di profili è il più alto (Idol.Pseudonimo,Idol.Nome,Idol.Cognome,NumeroProfili)
DROP VIEW IF EXISTS IdolSocial;

CREATE VIEW IdolSocial AS  (SELECT I.Pseudonimo,I.Nome,I.Cognome,count(*) as NumeroProfili
							FROM IDOL I JOIN SOCIAL S ON I.Pseudonimo = S.Idol
							GROUP BY I.Pseudonimo,I.Nome,I.Cognome);

SELECT *
FROM IdolSocial
WHERE NumeroProfili = (SELECT max(NumeroProfili) from IdolSocial);

-- 7. Elencare gli autori che hanno realizzato brani per l'idol 'Jessi' e non per l'idol 'Lisa' (NomeArte,Nome,Cognome)
SELECT A.NomeArte,A.Nome,A.Cognome
FROM AUTORE A JOIN REALIZZAZIONE R ON A.NomeArte = R.NomeArte
WHERE R.Idol = "Jessi" AND A.NomeArte NOT IN (SELECT A.NomeArte
													FROM AUTORE A JOIN REALIZZAZIONE R ON A.NomeArte = R.NomeArte
													WHERE R.Idol = "Lisa");
                                                    
-- 8. Elencare gli autori che hanno partecipato alla realizzazione di tutti i brani titletrack (NomeArte)
SELECT A.NomeArte
FROM AUTORE A
WHERE NOT EXISTS (SELECT * FROM BRANO B WHERE B.Titletrack = true AND NOT EXISTS(SELECT *
														FROM REALIZZAZIONE R
                                                        WHERE A.NomeArte = R.NomeArte AND B.Titolo = R.Titolo AND B.Idol = R.Idol));													
