--------------------------------------------------------
--  ������ ������ - �����-12��-24-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "58Y"."BOARD" 
   (	"NO" NUMBER(3,0), 
	"BOARDNO" NUMBER(3,0), 
	"TITLE" NVARCHAR2(50), 
	"WRITER" NVARCHAR2(30), 
	"CONTENT" NVARCHAR2(500), 
	"HITS" NUMBER(3,0), 
	"REGDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TEAM58Y_TABLESPACE" ;
--------------------------------------------------------
--  DDL for Table BOARDTYPE
--------------------------------------------------------

  CREATE TABLE "58Y"."BOARDTYPE" 
   (	"BOARDNO" NUMBER(3,0), 
	"BOARDNAME" NVARCHAR2(30)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TEAM58Y_TABLESPACE" ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "58Y"."MEMBER" 
   (	"ID" VARCHAR2(30 BYTE), 
	"PW" VARCHAR2(30 BYTE), 
	"NAME" NVARCHAR2(30), 
	"RANK" NUMBER(1,0), 
	"PROFILE_IMG" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TEAM58Y_TABLESPACE" ;
--------------------------------------------------------
--  DDL for Table REPLY
--------------------------------------------------------

  CREATE TABLE "58Y"."REPLY" 
   (	"NO" NUMBER(3,0), 
	"BOARDNO" NUMBER(3,0), 
	"WRITER" NVARCHAR2(50), 
	"CONTENT" NVARCHAR2(500), 
	"REGDATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TEAM58Y_TABLESPACE" ;
REM INSERTING into "58Y".BOARD
SET DEFINE OFF;
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (282,2,'���ظ�� + ����ĵƮ��ž','son','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/2YidLjLo7-o" width="640"></iframe></p>

<p>�ΰ� ���� ����</p>
',1,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (283,7,'���� StageMix','son','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/Zi0Disjv-DY" width="640"></iframe></p>

<p>���� ������ ����</p>
',0,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (284,7,'�Ƹ� ���̷α�! ī����','son','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/TzdjEviN9JQ" width="640"></iframe></p>

<p>�̳� �Ϳ����� ����</p>
',1,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (285,7,'�Ϻ��� ���� ����','tottenham','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/EDVpc8t1cWc" width="640"></iframe></p>
',2,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (280,3,'��������� ���̴ϵ�','son','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/Z3Ycg7FL718" width="640"></iframe></p>
',67,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (281,2,'Ʈ���� �ñ׳� ��ķ','son','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/gruYTExJxVI" width="640"></iframe></p>

<p>����</p>
',0,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (286,7,'�Ҳɳ��� ��������!','tottenham','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/BrASylNQj8c" width="640"></iframe></p>
',1,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (300,1,'������ ��ź�ҳ�� �̱����� �ܼ�Ʈ Ƽ�� ���Ͻź� �ֳ���?','tottenham','<p>�� �������� ����</p>',1,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (301,1,'�����̰� �Ƹ� ���̷α� �����!','tottenham','<p>��ī����������</p>',10,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (302,1,'�º�� ���̺��� ���� ���Ĵ�?','duckhu','<p>�� �� ���ٴ�!</p>',7,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (380,0,'���̵��Խ��� ��û','admin','<p>��ۿ� �׷�� �����ֽø� ���� �ݿ��ϰڽ��ϴ�.</p>

<p>&nbsp;</p>

<p>ex) ������</p>

<p>ex) ���ι̽�����</p>
',50,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (381,3,'��ź�� �θ��� ĳ���̶��','10duck','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/92z9-o0QGrI" width="640"></iframe></p>

<p>¡�ۺ�����</p>
',1,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (382,12,'������ ������������','10duck','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/alh9YaK_lbI" width="640"></iframe></p>

<p>������</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (383,14,'�űԱ׷� �ֽ��� �����ٶ��','10duck','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/4tvQPrHcR4w" width="640"></iframe></p>

<p>���� �����Ѵٴ�</p>
',1,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (384,17,'�������� �º��Դϴ�','10duck','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/LzmdGtzby2s" width="640"></iframe></p>

<p>������ ȭ����</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (385,18,'���� ���̷α� �Դϴ� ����','10duck','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/KfXQnS01dZo" width="640"></iframe></p>

<p>���� �̻���</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (386,15,'Apple �º��Դϴ�.','10duck','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/XQSse3b2ge4" width="640"></iframe></p>

<p>���</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (387,16,'�ʿ��� ��⸦(I wish)','10duck','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/J7gOqqbBW6w" width="640"></iframe></p>

<p>��⸦ �ٶ��ٴ�</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (388,3,'[VLOG] �� | ������ ���� �ų��� �ް�','benz','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/1oDdbRCvuO8" width="640"></iframe></p>

<p>���α� �ö�Գ׿� ������</p>
',4,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (389,12,'Feel good �������� ����','benz','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/HxixXkpuQBU" width="640"></iframe></p>

<p>Į����!</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (390,17,'������ �뷡���� 2020������Ʈ �����Դϴ�','benz','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/xV_JgA5of08" width="640"></iframe></p>

<p>���ʼ�.</p>
',1,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (391,15,'[G-LOG] 20��° �ö�Գ׿�.','benz','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/UFYbvt7Mexw" width="640"></iframe></p>

<p>&nbsp;</p>

<p>���α�.</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (394,2,'�糪�� �Ϳ��׿�.','benz','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/NmgDi0oVPD4?rel=0" width="640"></iframe></p>

<p>�糪���Դϴ�.</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (392,18,'�������� �뷡�����Դϴ�.','benz','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/xgtgAwIiKmA" width="640"></iframe></p>

<p>�����Ϸ� �ǽʼ�.</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (393,16,'���ּҳ� ��Ź�� ��������.','benz','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/tiCsdN-7jEQ?rel=0" width="640"></iframe></p>

<p>&nbsp;</p>

<p>���ּҳ� ��Ź�� ��������.</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (395,3,'���̳ʸ���Ʈ ���̺��Դϴ�','arsenal4','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/rOaPIhiVYQo" width="640"></iframe></p>

<p>LIVE!!!!!!!!!!</p>
',20,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (396,12,'���ι̽����� (fromis_9) ���� �����ϱ�','arsenal4','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/-wfMe8DCZGA" width="640"></iframe></p>

<p>Fromise_9!</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (397,16,'Butterfly','arsenal4','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/N3k1d23Rfns" width="640"></iframe></p>

<p>Butterfly stage MIX!</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (398,15,'����ģ�� �뷡���� �������','arsenal4','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/1DdVQBKKxNo" width="640"></iframe></p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (399,14,'������ �ȹ� �ſ���','arsenal4','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/56VZni0qO1Q" width="640"></iframe></p>

<p>���Ӥ���mode</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (400,2,'Ʈ���̽� ���߹���','star','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/vYkGpOeqp4g" width="640"></iframe></p>

<p>���߹����Դϴ� ������</p>
',1,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (401,12,'��ī��Ʈ�ٿ� ''��������'' ����','star','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/0xlRKKsWVsw" width="640"></iframe></p>

<p><a dir="auto" href="https://www.youtube.com/hashtag/%ED%94%84%EB%A1%9C%EB%AF%B8%EC%8A%A4%EB%82%98%EC%9D%B8" spellcheck="false">#���ι̽�����</a> <a dir="auto" href="https://www.youtube.com/hashtag/fromis_9" spellcheck="false">#fromis_9</a> <a dir="auto" href="https://www.youtube.com/hashtag/%EC%9C%A0%EB%A6%AC%EA%B5%AC%EB%91%90" spellcheck="false">#��������</a></p>
',6,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (402,7,'�����̰� ��Ʈ�� ����','star','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/n2i2C3HyQW8" width="640"></iframe></p>

<p>Best Hit Song</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (403,2,'����� 7�ð� ���̺�','momo','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/eQKZxp-oKTU" width="640"></iframe></p>

<p>������</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (404,2,'���������� �������� ���� ���','momo','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/Vy3lb1rdO9w" width="640"></iframe></p>
',1,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (405,1,'�ȳ��ϼ��� �����̰� �� �����Դϴ� ��','20seok','<p>�� ��Ź�����</p>',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (406,1,'���̸����� ���̵��̶��!','10duck','<p>�׷����ʳĴ�?</p>',9,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (407,3,'BTS (��ź�ҳ��) ''Dynamite'' Official MV','20seok','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/gdZLi9oWNZg" width="640"></iframe></p>

<h1>BTS (��ź�ҳ��) &#39;Dynamite&#39; Official MV</h1>
',34,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (408,7,'The Fifth Season LIVE','20seok','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/AAf3ZV2K5bM" width="640"></iframe></p>

<p>LIVE GOODDDDDD</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (261,7,'�����̰� Dolphin ��ķ�Դϴ�.','20seok','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/nWYv2cXwMSc" width="640"></iframe></p>

<p>�츮 �����̰� ��ķ ���鼭 �������ô� !!</p>
',0,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (262,2,'Ʈ���̵� cheer up ��ķ!','20seok','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/rfA1nNx42g0" width="640"></iframe></p>

<p>��������׿� ������</p>
',0,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (263,3,'���� �������� �Դϴ� �̳�������','20seok','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/rcAOcoM9tHQ" width="640"></iframe></p>

<p>���̽��</p>
',1,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (264,3,'BTS ����ȩ�� ���̷α� �Դϴ�','20seok','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/tAYR30va_N4" width="640"></iframe></p>

<p>�� Į���� ���鷯 �̱��� ����� ����</p>
',1,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (265,3,'���̺� �ܼ�Ʈ �����Դϴ�','20seok','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/i_4t8OjyPmo" width="640"></iframe></p>

<p>���� �����Ű��ƿ�</p>
',4,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (266,2,'���� ��� �糪�� ���̷α��Դϴ� ����','20seok','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/kyAmD48xhLY" width="640"></iframe></p>

<p>���� ���� ��԰�ͳ׿�</p>
',1,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (267,7,'������� �������� �Դϴ�.','20seok','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/QIN5_tJRiyY" width="640"></iframe></p>

<p>���� ���� �����ϴ� �뷡����</p>
',0,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (268,7,'��¦ ������ ��ķ�̿���','ebichu','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/aEZWQa530Zo" width="640"></iframe></p>

<p>���� Į���� ����</p>
',0,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (269,2,'��ũ��ũ ���������Դϴ�!','ebichu','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/CAlvLJCINhk" width="640"></iframe></p>

<p>�����!</p>
',1,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (270,3,'������ ����� �º�!','ebichu','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/-5q5mZbe3V8" width="640"></iframe></p>

<p>����</p>
',1,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (271,3,'BTS ���̳ʸ���Ʈ Ƽ�������Դϴ�.','ebichu','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/oxoWhyS9buA" width="640"></iframe></p>
',1,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (272,2,'Ʈ���� i can''t stop ! MV','ebichu','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/CM4CkVFmTds" width="640"></iframe></p>
',0,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (273,7,'�ټ���°���� ������������!!','duckhu','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/IOIusGYqyUM" width="640"></iframe></p>

<p>�̻ڴٴ�!</p>
',0,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (274,7,'Bungee Xmas Ver.','duckhu','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/Jo7p0yQYzTY" width="640"></iframe></p>

<p>�޸� ũ�������� ����!</p>
',0,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (275,2,'Ʈ���� �ҽ� ��������','duckhu','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/y4Geh8Z9oCc" width="640"></iframe></p>
',0,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (276,2,'���ĵ��� ��������!','duckhu','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/dFLwWPgafjI" width="640"></iframe></p>

<p>�η��׿� ���ĵ弮</p>
',0,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (277,3,'BTS �������� ��','duckhu','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/djl7EaOjmos" width="640"></iframe></p>

<p>������ ���Ƴ׿� ������</p>
',1,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (278,3,'Dynamite Michael Jackson Ver.','duckhu','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/aEJm5bvoOQY" width="640"></iframe></p>
',1,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (279,3,'����!!','son','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/xEeFrLSkMm8" width="640"></iframe></p>

<p>����ġ �����ǿ�</p>
',4,to_date('20/12/22','RR/MM/DD'));
REM INSERTING into "58Y".BOARDTYPE
SET DEFINE OFF;
Insert into "58Y".BOARDTYPE (BOARDNO,BOARDNAME) values (2,'Twice');
Insert into "58Y".BOARDTYPE (BOARDNO,BOARDNAME) values (3,'BTS');
Insert into "58Y".BOARDTYPE (BOARDNO,BOARDNAME) values (0,'��û�Խ���');
Insert into "58Y".BOARDTYPE (BOARDNO,BOARDNAME) values (7,'�����̰�');
Insert into "58Y".BOARDTYPE (BOARDNO,BOARDNAME) values (14,'aespa');
Insert into "58Y".BOARDTYPE (BOARDNO,BOARDNAME) values (15,'����ģ��');
Insert into "58Y".BOARDTYPE (BOARDNO,BOARDNAME) values (16,'���ּҳ�');
Insert into "58Y".BOARDTYPE (BOARDNO,BOARDNAME) values (17,'������');
Insert into "58Y".BOARDTYPE (BOARDNO,BOARDNAME) values (18,'��������');
Insert into "58Y".BOARDTYPE (BOARDNO,BOARDNAME) values (1,'�����Խ���');
Insert into "58Y".BOARDTYPE (BOARDNO,BOARDNAME) values (12,'Fromis_9');
REM INSERTING into "58Y".MEMBER
SET DEFINE OFF;
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('ebichu','123','������',0,'40x40pink2.png');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('napoli','123','napoli',0,'napoli.jpg');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('duckhu','123','��Ÿ��',0,'40x40green1.png');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('20seok','123','�̿���',0,'napoli1.jpg');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('son','123','sonheungmin',0,'40x40red.png');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('tottenham','123','�����',0,'40x40blue1.png');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('admin','admin','admin',1,'asdasdasdasd.png');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('qwdqwdqwdqw',null,'asdassdasdasd',0,null);
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('10duck','123','�ʴ�',0,'asdasdas.png');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('benz','123','������',0,'123123123123.png');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('arsenal4','123','�ƽ������',0,'asdasdasd.png');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('star','123','starbucks',0,'asd����-1.png');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('a123','123','btsfan',0,'xzczxcxzc.png');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('rich','123','rich12',0,'���� ����-12.png');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('momo','123','�����',0,'aasdas.png');
REM INSERTING into "58Y".REPLY
SET DEFINE OFF;
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (221,282,'tottenham','Good Good!!',to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (330,380,'10duck','AKB48�� ���Ĵ�?',to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (241,301,'duckhu','i saw!!',to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (260,284,'duckhu','kawaiiiiiiiiiii',to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (331,380,'benz','�ҳ�ô�',to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (332,395,'star','��ź�ҳ�� �뷡 ��¥ �ߺҷ���!',to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (333,395,'a123','BTS�ְ�!!!!BTS�ְ�!!!!BTS�ְ�!!!!BTS�ְ�!!!!BTS�ְ�!!!!BTS�ְ�!!!!BTS�ְ�!!!!',to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (334,400,'rich','�츮 Ʈ���̵� ���� ����',to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (335,383,'momo','���� �����ؿ�',to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (336,380,'20seok','��� ��Ź�ؿ� ����',to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (337,406,'20seok','�׸��� ���̵��� �ɼ������ ��',to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (338,395,'20seok','���̺� ���Գ� ��',to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (339,279,'20seok','�� �־ְ��Դϴ� ����',to_date('20/12/23','RR/MM/DD'));
