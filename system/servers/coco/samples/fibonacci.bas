PROCEDURE fibonacci
  (* computes the first ten Fibonacci numbers
  DIM x,y,i,temp:INTEGER

  x:=0 \y:=0
  FOR i = 0 TO 10
    temp := y

    IF i<>0 THEN
      y := y+x
    ELSE
      y := 1
    ENDIF

    x := temp
    PRINT i, y
  NEXT i
