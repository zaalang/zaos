PROCEDURE mandel
    DIM color(16),tmpint,tmpint2:INTEGER
    DIM i:INTEGER
    DIM px,py,xz,yz,x,y,xy:REAL

10  color(0)=41
    color(1)=101
    color(2)=42
    color(3)=102
    color(4)=43
    color(5)=103
    color(6)=44
    color(7)=104
    color(8)=45
    color(9)=105
    color(10)=46
    color(11)=106
    color(12)=100
    color(13)=40
    color(14)=40
    color(15)=40

100 FOR py=0 TO 21
110   FOR px=0 TO 63
120     xz=px*3.5/64-2.5
130     yz=py*2/22-1
140     x=0
150     y=0
160     FOR i=0 TO 14
170       IF x*x+y*y>4 THEN 212
180       let xt=x*x-y*y+xz
190       y=2*x*y+yz
200       x=xt
210     NEXT i
212     PRINT "\x1b[0;";color(i);"m ";
240   NEXT px
245   PRINT "\x1b[0m"
250 NEXT py
265 PRINT "\x1b[0m"
270 END
