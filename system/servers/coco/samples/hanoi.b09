PROCEDURE hanoi
  (* by T.F. Ritter
  (* move n discs in Tower of Hanoi game
  (* See BYTE Magazine, Oct 1980, pg. 279
  PARAM n:INTEGER; from,to_,other:STRING[8]

  IF n=1 THEN
    PRINT "move #"; n; " from "; from; " to "; to_
  ELSE
    RUN hanoi(n-1,from,other,to_)
    PRINT "move #"; n; " from "; from; " to "; to_
    RUN hanoi(n-1,other,to_,from)
  ENDIF
  END

procedure main
  run hanoi(4, "l", "r", "c")
