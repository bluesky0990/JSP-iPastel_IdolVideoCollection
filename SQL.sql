--------------------------------------------------------
--  파일이 생성됨 - 목요일-12월-24-2020   
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
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (282,2,'모어앤모어 + 아이캔트스탑','son','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/2YidLjLo7-o" width="640"></iframe></p>

<p>두곡 같이 들어용</p>
',1,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (283,7,'번지 StageMix','son','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/Zi0Disjv-DY" width="640"></iframe></p>

<p>편집 지린당 ㄷㄷ</p>
',0,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (284,7,'아린 브이로그! 카와이','son','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/TzdjEviN9JQ" width="640"></iframe></p>

<p>겁나 귀여워여 ㅋㅋ</p>
',1,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (285,7,'일본어 버전 모음','tottenham','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/EDVpc8t1cWc" width="640"></iframe></p>
',2,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (280,3,'가요대축제 아이니듀','son','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/Z3Ycg7FL718" width="640"></iframe></p>
',67,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (281,2,'트둥이 시그널 직캠','son','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/gruYTExJxVI" width="640"></iframe></p>

<p>ㅎㅎ</p>
',0,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (286,7,'불꽃놀이 교차편집!','tottenham','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/BrASylNQj8c" width="640"></iframe></p>
',1,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (300,1,'여러분 방탄소년단 미국투어 콘서트 티켓 구하신분 있나용?','tottenham','<p>난 구했지롱 낄낄</p>',1,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (301,1,'오마이걸 아린 브이로그 본사람!','tottenham','<p>초카와이이이이</p>',10,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (302,1,'뮤비와 라이브중 뭐가 좋냐능?','duckhu','<p>난 다 좋다능!</p>',7,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (380,0,'아이돌게시판 요청','admin','<p>댓글에 그룹명 남겨주시면 추후 반영하겠습니다.</p>

<p>&nbsp;</p>

<p>ex) 마마무</p>

<p>ex) 프로미스나인</p>
',50,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (381,3,'방탄이 부르는 캐롤이라능','10duck','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/92z9-o0QGrI" width="640"></iframe></p>

<p>징글벨데스</p>
',1,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (382,12,'런펌펌 교차편집데스','10duck','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/alh9YaK_lbI" width="640"></iframe></p>

<p>런펌펌</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (383,14,'신규그룹 애스파 블랙맘바라능','10duck','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/4tvQPrHcR4w" width="640"></iframe></p>

<p>데뷔 축하한다능</p>
',1,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (384,17,'딩가딩가 뮤비입니다','10duck','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/LzmdGtzby2s" width="640"></iframe></p>

<p>마마무 화이팅</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (385,18,'나은 브이로그 입니다 ㅋㅋ','10duck','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/KfXQnS01dZo" width="640"></iframe></p>

<p>나은 이쁘죠</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (386,15,'Apple 뮤비입니당.','10duck','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/XQSse3b2ge4" width="640"></iframe></p>

<p>사과</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (387,16,'너에게 닿기를(I wish)','10duck','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/J7gOqqbBW6w" width="640"></iframe></p>

<p>닿기를 바란다능</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (388,3,'[VLOG] 뷔 | 나른한 뷔의 신나는 휴가','benz','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/1oDdbRCvuO8" width="640"></iframe></p>

<p>븨로그 올라왔네요 ㅎㅎㅎ</p>
',4,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (389,12,'Feel good 교차편집 ㅎㅎ','benz','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/HxixXkpuQBU" width="640"></iframe></p>

<p>칼군무!</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (390,17,'마마무 노래모음 2020업데이트 버전입니다','benz','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/xV_JgA5of08" width="640"></iframe></p>

<p>들어보십쇼.</p>
',1,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (391,15,'[G-LOG] 20번째 올라왔네요.','benz','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/UFYbvt7Mexw" width="640"></iframe></p>

<p>&nbsp;</p>

<p>지로그.</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (394,2,'사나님 귀엽네요.','benz','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/NmgDi0oVPD4?rel=0" width="640"></iframe></p>

<p>사나님입니다.</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (392,18,'에이프릴 노래모음입니다.','benz','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/xgtgAwIiKmA" width="640"></iframe></p>

<p>좋은하루 되십쇼.</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (393,16,'우주소녀 부탁해 교차편집.','benz','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/tiCsdN-7jEQ?rel=0" width="640"></iframe></p>

<p>&nbsp;</p>

<p>우주소녀 부탁해 교차편집.</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (395,3,'다이너마이트 라이브입니다','arsenal4','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/rOaPIhiVYQo" width="640"></iframe></p>

<p>LIVE!!!!!!!!!!</p>
',20,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (396,12,'프로미스나인 (fromis_9) 숙소 관찰일기','arsenal4','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/-wfMe8DCZGA" width="640"></iframe></p>

<p>Fromise_9!</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (397,16,'Butterfly','arsenal4','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/N3k1d23Rfns" width="640"></iframe></p>

<p>Butterfly stage MIX!</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (398,15,'여자친구 노래모음 광고없음','arsenal4','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/1DdVQBKKxNo" width="640"></iframe></p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (399,14,'블랙맘바 안무 거울모드','arsenal4','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/56VZni0qO1Q" width="640"></iframe></p>

<p>ㅁㅣㄹㅓmode</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (400,2,'트와이스 데뷔무대','star','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/vYkGpOeqp4g" width="640"></iframe></p>

<p>데뷔무대입니다 ㅋㅋㅋ</p>
',1,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (401,12,'엠카운트다운 ''유리구두'' 무대','star','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/0xlRKKsWVsw" width="640"></iframe></p>

<p><a dir="auto" href="https://www.youtube.com/hashtag/%ED%94%84%EB%A1%9C%EB%AF%B8%EC%8A%A4%EB%82%98%EC%9D%B8" spellcheck="false">#프로미스나인</a> <a dir="auto" href="https://www.youtube.com/hashtag/fromis_9" spellcheck="false">#fromis_9</a> <a dir="auto" href="https://www.youtube.com/hashtag/%EC%9C%A0%EB%A6%AC%EA%B5%AC%EB%91%90" spellcheck="false">#유리구두</a></p>
',6,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (402,7,'오마이걸 히트송 모음','star','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/n2i2C3HyQW8" width="640"></iframe></p>

<p>Best Hit Song</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (403,2,'모모의 7시간 라이브','momo','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/eQKZxp-oKTU" width="640"></iframe></p>

<p>ㅎㅎㅎ</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (404,2,'스위스에서 데구리와 만난 모모','momo','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/Vy3lb1rdO9w" width="640"></iframe></p>
',1,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (405,1,'안녕하세요 오마이걸 팬 영석입니다 ㅋ','20seok','<p>잘 부탁드려용</p>',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (406,1,'아이마스도 아이돌이라능!','10duck','<p>그렇지않냐능?</p>',9,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (407,3,'BTS (방탄소년단) ''Dynamite'' Official MV','20seok','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/gdZLi9oWNZg" width="640"></iframe></p>

<h1>BTS (방탄소년단) &#39;Dynamite&#39; Official MV</h1>
',34,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (408,7,'The Fifth Season LIVE','20seok','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/AAf3ZV2K5bM" width="640"></iframe></p>

<p>LIVE GOODDDDDD</p>
',0,to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (261,7,'오마이걸 Dolphin 직캠입니다.','20seok','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/nWYv2cXwMSc" width="640"></iframe></p>

<p>우리 오마이걸 직캠 보면서 힘내봅시다 !!</p>
',0,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (262,2,'트둥이들 cheer up 직캠!','20seok','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/rfA1nNx42g0" width="640"></iframe></p>

<p>사랑스럽네여 ㅋㅋㅋ</p>
',0,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (263,3,'상남자 뮤직비디오 입니다 겁나멋져요','20seok','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/rcAOcoM9tHQ" width="640"></iframe></p>

<p>멋이써용</p>
',1,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (264,3,'BTS 제이홉의 브이로그 입니당','20seok','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/tAYR30va_N4" width="640"></iframe></p>

<p>닭 칼각수 만들러 미국에 갔어요 ㅋㅋ</p>
',1,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (265,3,'라이브 콘서트 영상입니다','20seok','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/i_4t8OjyPmo" width="640"></iframe></p>

<p>정말 멋진거같아여</p>
',4,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (266,2,'나연 모모 사나의 브이로그입니당 ㅋㅋ','20seok','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/kyAmD48xhLY" width="640"></iframe></p>

<p>저도 같이 밥먹고싶네용</p>
',1,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (267,7,'비밀정원 뮤직비디오 입니다.','20seok','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/QIN5_tJRiyY" width="640"></iframe></p>

<p>제가 가장 좋아하는 노래에용</p>
',0,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (268,7,'살짝 설렜어 직캠이에용','ebichu','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/aEZWQa530Zo" width="640"></iframe></p>

<p>완전 칼군무 ㄷㄷ</p>
',0,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (269,2,'노크노크 교차편집입니다!','ebichu','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/CAlvLJCINhk" width="640"></iframe></p>

<p>녹녹녹녹!</p>
',1,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (270,3,'라이프 고즈온 뮤비!','ebichu','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/-5q5mZbe3V8" width="640"></iframe></p>

<p>랖랖</p>
',1,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (271,3,'BTS 다이너마이트 티저영상입니다.','ebichu','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/oxoWhyS9buA" width="640"></iframe></p>
',1,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (272,2,'트둥이 i can''t stop ! MV','ebichu','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/CM4CkVFmTds" width="640"></iframe></p>
',0,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (273,7,'다섯번째계절 교차편집데스!!','duckhu','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/IOIusGYqyUM" width="640"></iframe></p>

<p>이쁘다능!</p>
',0,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (274,7,'Bungee Xmas Ver.','duckhu','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/Jo7p0yQYzTY" width="640"></iframe></p>

<p>메리 크리스마스 데스!</p>
',0,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (275,2,'트둥이 팬시 교차편집','duckhu','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/y4Geh8Z9oCc" width="640"></iframe></p>
',0,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (276,2,'스탠딩석 가는이유!','duckhu','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/dFLwWPgafjI" width="640"></iframe></p>

<p>부럽네용 스탠드석</p>
',0,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (277,3,'BTS 공연반응 ㄷ','duckhu','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/djl7EaOjmos" width="640"></iframe></p>

<p>분위기 미쳤네여 ㅋㅋㅋ</p>
',1,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (278,3,'Dynamite Michael Jackson Ver.','duckhu','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/aEJm5bvoOQY" width="640"></iframe></p>
',1,to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".BOARD (NO,BOARDNO,TITLE,WRITER,CONTENT,HITS,REGDATE) values (279,3,'봄날!!','son','<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/xEeFrLSkMm8" width="640"></iframe></p>

<p>눈꼬치 떠러쪄용</p>
',4,to_date('20/12/22','RR/MM/DD'));
REM INSERTING into "58Y".BOARDTYPE
SET DEFINE OFF;
Insert into "58Y".BOARDTYPE (BOARDNO,BOARDNAME) values (2,'Twice');
Insert into "58Y".BOARDTYPE (BOARDNO,BOARDNAME) values (3,'BTS');
Insert into "58Y".BOARDTYPE (BOARDNO,BOARDNAME) values (0,'요청게시판');
Insert into "58Y".BOARDTYPE (BOARDNO,BOARDNAME) values (7,'오마이걸');
Insert into "58Y".BOARDTYPE (BOARDNO,BOARDNAME) values (14,'aespa');
Insert into "58Y".BOARDTYPE (BOARDNO,BOARDNAME) values (15,'여자친구');
Insert into "58Y".BOARDTYPE (BOARDNO,BOARDNAME) values (16,'우주소녀');
Insert into "58Y".BOARDTYPE (BOARDNO,BOARDNAME) values (17,'마마무');
Insert into "58Y".BOARDTYPE (BOARDNO,BOARDNAME) values (18,'에이프릴');
Insert into "58Y".BOARDTYPE (BOARDNO,BOARDNAME) values (1,'자유게시판');
Insert into "58Y".BOARDTYPE (BOARDNO,BOARDNAME) values (12,'Fromis_9');
REM INSERTING into "58Y".MEMBER
SET DEFINE OFF;
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('ebichu','123','에비츄',0,'40x40pink2.png');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('napoli','123','napoli',0,'napoli.jpg');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('duckhu','123','오타쿠',0,'40x40green1.png');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('20seok','123','이영석',0,'napoli1.jpg');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('son','123','sonheungmin',0,'40x40red.png');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('tottenham','123','토토넘',0,'40x40blue1.png');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('admin','admin','admin',1,'asdasdasdasd.png');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('qwdqwdqwdqw',null,'asdassdasdasd',0,null);
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('10duck','123','십덕',0,'asdasdas.png');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('benz','123','빈츠남',0,'123123123123.png');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('arsenal4','123','아스날우승',0,'asdasdasd.png');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('star','123','starbucks',0,'asd없음-1.png');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('a123','123','btsfan',0,'xzczxcxzc.png');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('rich','123','rich12',0,'제목 없음-12.png');
Insert into "58Y".MEMBER (ID,PW,NAME,RANK,PROFILE_IMG) values ('momo','123','모모팬',0,'aasdas.png');
REM INSERTING into "58Y".REPLY
SET DEFINE OFF;
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (221,282,'tottenham','Good Good!!',to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (330,380,'10duck','AKB48은 없냐능?',to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (241,301,'duckhu','i saw!!',to_date('20/12/22','RR/MM/DD'));
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (260,284,'duckhu','kawaiiiiiiiiiii',to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (331,380,'benz','소녀시대',to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (332,395,'star','방탄소년단 노래 진짜 잘불러요!',to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (333,395,'a123','BTS최고!!!!BTS최고!!!!BTS최고!!!!BTS최고!!!!BTS최고!!!!BTS최고!!!!BTS최고!!!!',to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (334,400,'rich','우리 트둥이들 데뷔 ㅎㅎ',to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (335,383,'momo','데뷔 축하해용',to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (336,380,'20seok','빅뱅 부탁해요 흑흑',to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (337,406,'20seok','그림은 아이돌이 될수없어요 ㅎ',to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (338,395,'20seok','라이브 레게노 ㄷ',to_date('20/12/23','RR/MM/DD'));
Insert into "58Y".REPLY (NO,BOARDNO,WRITER,CONTENT,REGDATE) values (339,279,'20seok','제 최애곡입니다 ㅋㅋ',to_date('20/12/23','RR/MM/DD'));
