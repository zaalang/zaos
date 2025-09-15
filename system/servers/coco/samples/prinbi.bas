PROCEDURE prinbi
  (* by T.F. Ritter
  (* prints the integer parameter value in binary
  PARAM n:INTEGER
  DIM i:INTEGER

  FOR i=15 TO 0 STEP -1
    IF land(n, $8000) <> 0 THEN
      PRINT "1";
    ELSE
      PRINT "0";
    ENDIF
    n:=n+n
  NEXT i
  PRINT

  END
