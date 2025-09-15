PROCEDURE roman
  (* prints integer parameter as Roman Numeral
  PARAM x:INTEGER
  DIM value,svalu,i:INTEGER
  DIM char,subs:STRING

  char:="MDCLXVI"
  subs:="CCXXII "
  DATA 1000,100,500,100,100,10,50,10,10,1,5,1,1,0

  FOR i=1 TO 7
    READ value
    READ svalu

    WHILE x>=value DO
      PRINT MID$(char,i,1);
      x:=x-value
    ENDWHILE

    IF x>=value-svalu THEN
      PRINT MID$(subs,i,1); MID$(char,i,1);
      x:=x-value+svalu
    ENDIF
  NEXT i
  PRINT
  END
