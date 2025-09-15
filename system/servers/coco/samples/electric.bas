PROCEDURE electric
    (* reprogrammed from "ELECTRIC"
    (* by Dwyer and Critchfield
    (* Basic and the Personal Computer (Addison-Wesley, 1978)
    (* provides a pictorial representation of the
    (* resultant electrical field around charged points
    DIM a(10),b(10),c(10):REAL
    DIM x,y,i,j,n:INTEGER
    DIM z,v,r:REAL
    DIM b$:STRING

    let xscale:=50.0/78.0
    let yscale:=50.0/32.0

    INPUT "How many charges do you have? ",n
    PRINT "The field of view is 050,050 (x,y)"
    FOR i=1 TO n
      PRINT "type in the x and y positions of charge ";
      PRINT i;
      INPUT "? ", a(i),b(i)
    NEXT i
    PRINT "type in the size of each charge:"
    FOR i=1 TO n
      PRINT "charge "; i;
      INPUT "? ", c(i)
    NEXT i

    REM visit each screen position
    FOR y=32 TO 0 STEP -1
      FOR x=0 TO 78
        REM compute field strength into v
        GOSUB 10
        z:=v*50.0
        REM map z to valid ASCII in b$
        GOSUB 20
        REM print char (proportional to field)
        PRINT b$;
      NEXT x
      PRINT
    NEXT y
    END

10  v=1.0
    FOR i=1 TO n
      r:=SQRT(SQ(xscale*x-a(i))+SQ(yscale*y-b(i)))
      EXITIF r=0.0 THEN
        v:=99999.0
      ENDEXIT
      v:=v+c(i)/r
    NEXT i
    RETURN

20  IF z<32 THEN
      b$:=" "
    ELSE
      IF z>57 THEN
        z:=z+8
      ENDIF
      IF z>90 THEN
        b$:="*"
      ELSE
        IF z>INT(z)+0.5 THEN
          b$:=" "
        ELSE
          b$:=CHR$(z)
        ENDIF
      ENDIF
    ENDIF
    RETURN
