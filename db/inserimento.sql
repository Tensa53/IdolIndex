INSERT INTO MUSICSHOW values 
("MCountdown","Viale Garibaldi","07","97534","Venerdi","17:00:00"),
("The Show","Via Roma","04","34569","Sabato","12:00:00"),
("Music Core","Viale Monaco","34","12344",default,"21:00:00"),
("Music Bank","Via Verdi","13","98764",default,default);

INSERT INTO IDOL values
("Lisa","Lalisa","Manoban",'F',"Rapper","1997-03-23","Bangkok",null,"2-5"),
("Jessi","Jessica","Oh",'F',"Rapper","1988-12-17","New York",null,"Chant"),
("IU","Jieun","Lee",'F',"Vocalist","1993-05-16","Seoul","Soprano",null),
("Hwasa","Hyejin","Ahn",'F',"Vocalist","1995-07-23","Seoul","Contralto",null);

INSERT INTO DISCO values
("2398833438547","Lilac",10,2217,"2021-03-25"),
("7566733982776","Maria",7,1285,"2020-09-25");

INSERT INTO AUTORE values
-- lisa
("Teddy","Hong","Park"),
("Vince","Joe","Rhee"),

-- hwasa
("Cosmic Girl","Jooyi","Yoo"),
("Pawoo","Woosang","Park"),

-- jessi
("DoubleK","Michael","Turner"),

-- IU
("Bilsby","Jeppe","London"),
("Suga","Yoongi","Min"),
("El Capitan","Yijeong","Jang"),
("Gorilla","Hyungi","Go"),

-- JOLLY
("Jolly","MiServiPerIl","NonExists");

INSERT INTO SOCIAL values
("iuofficial","IU"),
("lisaofficial","Lisa"),
("lisapublic","Lisa"),
("lisasecond","Lisa"),
("lisaprivate","Lisa"),
("jessiofficial","Jessi"),
("jessipublic","Jessi"),
("hwasaofficial","Hwasa");

INSERT INTO BRANO values
("Money","Lisa",168,true,"2021-09-10",null),
("What Type of X","Jessi",198,true,"2021-03-17",null),

("Nobody Else","Hwasa",117,false,null,"7566733982776"),
("Maria","Hwasa",199,true,null,"7566733982776"),
("Kidding","Hwasa",165,false,null,"7566733982776"),
("Why","Hwasa",201,false,null,"7566733982776"),
("Twit","Hwasa",190,true,"2019-02-13","7566733982776"),
("I'm bad too","Hwasa",132,false,null,"7566733982776"),
("LMM","Hwasa",281,false,null,"7566733982776"),

("Lilac","IU",214,true,null,"2398833438547"),
("Flu","IU",188,false,null,"2398833438547"),
("Coin","IU",193,false,null,"2398833438547"),
("Hi Spring Bye","IU",324,false,null,"2398833438547"),
("Celebrity","IU",195,true,"2021-01-27","2398833438547"),
("Troll","IU",189,false,null,"2398833438547"),
("Empty Cup","IU",139,false,null,"2398833438547"),
("My Sea","IU",346,false,null,"2398833438547"),
("Ah Puh","IU",200,false,null,"2398833438547"),
("Epilogue","IU",229,false,null,"2398833438547");

INSERT INTO REALIZZAZIONE VALUES
("Teddy","Money","Lisa"),
("Vince","Money","Lisa"),

("DoubleK","What Type of X","Jessi"),

("Pawoo","I'm bad too", "Hwasa"),
("Pawoo","Kidding", "Hwasa"),
("Pawoo","LMM", "Hwasa"),
("Cosmic Girl","LMM", "Hwasa"),
("Cosmic Girl","Maria", "Hwasa"),
("Pawoo","Nobody Else", "Hwasa"),
("Pawoo","Twit", "Hwasa"),
("Cosmic Girl","Twit","Hwasa"),
("Pawoo","Why", "Hwasa"),

("Suga","Lilac","IU"),
("Bilsby","Lilac","IU"),
("El Capitan","Lilac","IU"),
("Bilsby","Flu","IU"),
("El Capitan","Coin","IU"),
("Gorilla","Hi Spring Bye","IU"),
("Suga","Celebrity","IU"),
("Gorilla","Celebrity","IU"),
("Bilsby","Troll","IU"),
("Gorilla","Empty Cup","IU"),
("Suga","My Sea","IU"),
("El Capitan","Ah Puh","IU"),
("Suga","Epilogue","IU"),
("Bilsby","Epilogue","IU"),
("Gorilla","Epilogue","IU"),
("El Capitan","Epilogue","IU"),

-- righe aggiuntive per "avere output" sulla query del not exists (con condizione intermedia)
("Jolly","Money","Lisa"),
("Jolly","What Type of X","Jessi"),
("Jolly","Maria", "Hwasa"),
("Jolly","Twit","Hwasa"),
("Jolly","Celebrity","IU"),
("Jolly","Lilac","IU");

-- righe aggiuntive per "avere output" sulla query del not exists (senza condizione intermedia)
/*("Jolly","I'm bad too", "Hwasa"),
("Jolly","Kidding", "Hwasa"),
("Jolly","LMM", "Hwasa"),
("Jolly","Nobody Else", "Hwasa"),
("Jolly","Why", "Hwasa"),
("Jolly","Flu","IU"),
("Jolly","Coin","IU"),
("Jolly","Hi Spring Bye","IU"),
("Jolly","Troll","IU"),
("Jolly","Empty Cup","IU"),
("Jolly","My Sea","IU"),
("Jolly","Ah Puh","IU"),
("Jolly","Epilogue","IU");*/

INSERT INTO ESIBIZIONE VALUES
("MCountdown","Twit","Hwasa",true,"2019-02-15",false),

("MCountdown","Maria","Hwasa",false,"2020-09-25",false),
("Music Core","Maria","Hwasa",false,"2020-09-27",true),
("The Show","Maria","Hwasa",false,"2020-10-03",true),
("Music Bank","Maria","Hwasa",false,"2020-10-04",false),
("MCountdown","Maria","Hwasa",false,"2020-10-11",false),

("MCountdown","Lilac","IU",false,"2021-03-26",false),
("The Show","Lilac","IU",false,"2021-03-27",false),
("Music Core","Lilac","IU",false,"2021-03-28",false),
("MCountdown","Lilac","IU",false,"2021-04-02",false),
("Music Bank","Lilac","IU",false,"2021-04-04",false),

("MCountdown","What Type of X","Jessi",false,"2021-03-20",false),
("MCountdown","What Type of X","Jessi",false,"2021-03-27",false),

("The Show","Money","Lisa",false,"2021-09-12",false),
("The Show","Money","Lisa",false,"2021-09-19",false);
