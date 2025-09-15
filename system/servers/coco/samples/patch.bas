PROCEDURE Patch
  (* Program to examine and patch any byte of a disk file
  (* Written by L. Crane
  DIM buffer(256):BYTE
  DIM path,offset,modloc:INTEGER; loc:INTEGER
  DIM rewrite:STRING

  INPUT "pathlist? ",rewrite
  OPEN #path,rewrite:UPDATE
  LOOP
    INPUT "sector number? ",rewrite
    EXITIF rewrite="" THEN \ENDEXIT
    loc=VAL(rewrite)*256
    SEEK #path,loc
    GET #path,buffer
    RUN DumpBuffer(loc,buffer)
    LOOP
      INPUT "change (sector offset)? ",rewrite
      EXITIF rewrite="" THEN
        RUN DumpBuffer(loc,buffer)
      ENDEXIT
      EXITIF rewrite="S" OR rewrite="s" THEN \ENDEXIT
      offset=VAL(rewrite)
      LOOP
        EXITIF offset>255 THEN \ENDEXIT
        modloc=loc+offset
        PRINT USING "H4,' ',H2",modloc,buffer(offset);
        INPUT ":",rewrite
        EXITIF rewrite="" THEN \ENDEXIT
        IF rewrite<>" " THEN
          buffer(offset)=VAL(rewrite)
        ENDIF
        offset=offset+1
      ENDLOOP
    ENDLOOP
    INPUT "rewrite sector? ",rewrite
    IF LEFT$(rewrite,1)="Y" OR LEFT$(rewrite,1)="y" THEN
      SEEK #path,loc
      PUT #path,buffer
    ENDIF
  ENDLOOP
  CLOSE #path
BYE

PROCEDURE DumpBuffer
  REM Called by PATCH
  TYPE buffer=char(16):BYTE
  PARAM loc:INTEGER; line(16):buffer
  DIM i,j:INTEGER
  WHILE loc>65535 DO
    loc=loc-65536
  ENDWHILE
  FOR j=0 TO 15
    PRINT USING "H4",FIX(INT(loc))+j*16;
    PRINT ":";
    FOR i=0 TO 15
      PRINT USING "X1,H2",line(j).char(i);
    NEXT i
    RUN PrintASCII(line(j))
    PRINT
  NEXT j

PROCEDURE PrintASCII
  TYPE buffer=char(16):BYTE
  PARAM line:buffer
  DIM ascii:STRING; nextchar:BYTE; i:INTEGER
  ascii=""
  FOR i=0 TO 15
    nextchar=line.char(i)
    IF nextchar>127 THEN
      nextchar=nextchar-128
    ENDIF
    IF nextchar<32 OR nextchar>125 THEN
      ascii=ascii+" "
    ELSE
      ascii=ascii+CHR$(nextchar)
    ENDIF
  NEXT i
  PRINT " "; ascii;
