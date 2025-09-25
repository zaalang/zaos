PROCEDURE fractions
  (* by T.F. Ritter
  (* finds increasinglyclose rational approximations
  (* to the desired real value
  DIM m:INTEGER

  let desired := PI
  let last := 0.0

  FOR m := 1 TO 30000
    let n := INT(0.5+m*desired)
    let trial := n/m
    IF ABS(trial - desired) < ABS(last - desired) THEN
      PRINT n; "/"; m; " = "; trial,
      PRINT "difference = "; trial - desired;
      PRINT
      last := trial
    ENDIF
  NEXT m
