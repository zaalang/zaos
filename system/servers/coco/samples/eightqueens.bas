PROCEDURE eightqueens
  (* originally by N. Wirth; here recoded from Pascal
  (* finds the arrangements by which eight queens
  (* can be placed on a chess board without conflict
  DIM n,k,x(8):INTEGER
  DIM col(8),up(15),down(15):BOOLEAN

  REM initialize empty board
  n:=0
  FOR k:=0 TO 7 \col(k):=TRUE \NEXT k
  FOR k:=0 TO 14 \up(k):=TRUE \down(k):=TRUE \NEXT k
  RUN generate(n,x,col,up,down)
  END

PROCEDURE generate
  PARAM n,x(8):INTEGER
  PARAM col(8),up(15),down(15):BOOLEAN
  DIM h,k:INTEGER \h:=0

  REPEAT
    IF col(h) AND up(n-h+7) AND down(n+h) THEN
      REM set queen on square [n,h]
      x(n):=h
      col(h):=FALSE \up(n-h+7):=FALSE \down(n+h) := FALSE
      n:=n+1
      IF n=8 THEN
        REM board full; print configuration
        FOR k=0 TO 7
          PRINT x(k); " ";
        NEXT k
        PRINT
      ELSE
        RUN generate(n,x,col,up,down)
      ENDIF

      REM remove queen from square [n,h]
      n:=n-1
      col(h):=TRUE \up(n-h+7):=TRUE \down(n+h):=TRUE
    ENDIF
    h:=h+1
  UNTIL h=8
  END
