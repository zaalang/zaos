PROCEDURE clock
  (* Simple Clock Simulator *)
  DIM time(4),last(4),xx(3),yy(3):INTEGER
  DIM x0,y0,radius,bkg:INTEGER
  DIM i,j,x1,y1,x2,y2:INTEGER
  DIM time$:STRING

  bkg = 0
  x0 = 640
  y0 = 150
  radius = 95
  RUN Gfx.Circle(x0, y0, radius)

  FOR i = 0 to 89 STEP 6
    x2 = SIN(i/180.0*pi) * radius
    y2 = COS(i/180.0*pi) * radius
    x1 = x2 * 0.9
    y1 = y2 * 0.9
    RUN Gfx.Color($ff444444)
    RUN Gfx.Line(x0+x1, y0+y1, x0+x2, y0+y2)
    RUN Gfx.Line(x0-x1, y0-y1, x0-x2, y0-y2)
    RUN Gfx.Line(x0+y1, y0-x1, x0+y2, y0-x2)
    RUN Gfx.Line(x0-y1, y0+x1, x0-y2, y0+x2)
  NEXT i

  FOR i = 0 TO 2
    time(i) = 0
    xx(i) = x0
    yy(i) = y0
  NEXT i

  LOOP
    time$ = DATE$
    last = time
    time(2) = VAL(MID$(time$,18,2))*6
    time(1) = VAL(MID$(time$,15,2))*6
    time(0) = MOD(VAL(MID$(time$,12,2))*30+time(1)/12,360)
    j = last(2)

    FOR i = 2 TO 0 STEP -1
      RUN Gfx.Pen(3)
      RUN Gfx.Line(x0, y0, xx(i), yy(i), $ff009000)
      xx(i) = x0 + SIN(time(i)/180.0*PI) * radius * (0.3 + i * 0.2)
      yy(i) = y0 - COS(time(i)/180.0*PI) * radius * (0.3 + i * 0.2)
      RUN Gfx.Pen(2)
      RUN Gfx.Line(x0, y0, xx(i), yy(i), $ff000000 + i*$222222)
    NEXT i

    WHILE time$ = DATE$ DO
    ENDWHILE
  ENDLOOP
