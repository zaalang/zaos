
PROCEDURE mpadd
  (* a+b=>c:five_integer_number (T.F. Ritter)
  PARAM a(5),b(5),c(5):INTEGER
  DIM i,carry:INTEGER

  carry:=0
  FOR i=4 TO 0 STEP -1
    c(i):=a(i)+b(i)+carry
    IF c(i)>=10000 THEN
      c(i):=c(i)-10000
      carry:=1
    ELSE
      carry:=0
    ENDIF
  NEXT i

PROCEDURE mpsub
  (* a-b=>c:five_integer_number (T.F. Ritter)
  PARAM a(5),b(5),c(5):INTEGER
  DIM i,borrow:INTEGER

  borrow:=0
  FOR i=4 TO 0 STEP -1
    c(i):=a(i)-b(i)-borrow
    IF c(i)<0 THEN
      c(i):=c(i)+10000
      borrow:=1
    ELSE
      borrow:=0
    ENDIF
  NEXT i

PROCEDURE mprint
  PARAM a(5):INTEGER
  DIM i:INTEGER; s:STRING

  FOR i=0 TO 4
    IF i=4 THEN
      PRINT ".";
    ENDIF
    s:=STR$(a(i))
    PRINT MID$("0000"+s,LEN(s)+1,4);
  NEXT i

PROCEDURE mpinput
  PARAM a(5):INTEGER
  DIM n,i:INTEGER
  DIM b$:STRING

  INPUT "input ultraprecision number: ",b$
  n:=SUBSTR(".",b$)
  IF n<>0 THEN
    a(4):=VAL(MID$(b$+"0000",n+1,4))
    b$:=LEFT$(b$,n-1)
  ELSE
    a(4):=0
  ENDIF
  b$:="00000000000000000000"+b$
  n:=1+LEN(b$)
  FOR i=3 TO 0 STEP -1
    n:=n-4
    a(i):=VAL(MID$(b$,n,4))
  NEXT i

PROCEDURE mptoreal
  PARAM a(5):INTEGER; b:REAL
  DIM i:INTEGER

  b:=a(0)
  FOR i=1 TO 3
    b:=b*10000
    b:=b+a(i)
  NEXT i
  b:=b+a(4)*0.0001

PROCEDURE main
  dim a(5):INTEGER
  dim b(5):INTEGER
  dim c(5):INTEGER

  run mpinput(a)
  run mpinput(b)
  run mpadd(a, b, c)

  run mprint(a) \print " + "; \run mprint(b) \print " = "; \run mprint(c) \print " ";

  dim d:real
  run mptoreal(c, d)
  print "("; d; ")"
