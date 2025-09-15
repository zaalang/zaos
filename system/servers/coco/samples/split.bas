PROCEDURE Split
  (*************************************
  (* Split - Text File Splitter Program
  (* by: Wayne Campbell - April 1992

  DIM path1,path2,c1s,char1,char2:BYTE
  DIM lnum,count:INTEGER
  DIM ext1,ext2:STRING[1]
  DIM lnnum:STRING[3]
  DIM file1,file2:STRING[40]
  DIM line(100):STRING[80]

  ext1:="a"
  ext2:="a"
  (* Clear the screen
  PRINT "\x1b[2J\x1b[H"
  PRINT

  (* Input filename
  INPUT " File to Split: ",file1
  OPEN #path1,file1:READ

  (* Output filename
  INPUT " Sub-File Name: ",file2
  IF file2="" THEN
    (* Default output filename
    (* w/ extension
    file2:="x.aa"
  ELSE
    (* User specified output
    (* filename w/extension
    file2:=file2+".aa"
  ENDIF

  (* # of lines to write per output file
  INPUT " Lines per Sub-File: ",lnnum

  IF lnnum="" THEN
    (* Default # of lines if no input
    lnum:=100
  ENDIF
  lnum:=VAL(lnnum)
  IF lnum=0 THEN
    (* Default # of lines if input is 0
    lnum:=100
  ENDIF
  PRINT
  ON ERROR GOTO 2

1 (* Read lmum lines from input file
  FOR count:=0 TO lnum-1
    READ #path1,line(count)
  NEXT count
  PRINT file2,
  (* Create output file
  CREATE #path2,file2:WRITE
  (* Write lines to output file and
  (* close file
  FOR count:=0 TO lnum-1
    WRITE #path2,line(count)
  NEXT count
  CLOSE #path2

  (* Update output filename and repeat
  (* process
  GOSUB 3
  GOTO 1

2 (* When EOF is reached, create output
  (* file, write lines, and close file
  CLOSE #path1

  lnum:=count
  PRINT file2,
  CREATE #path2,file2:WRITE
  FOR count:=0 TO lnum-1
    WRITE #path2,line(count)
  NEXT count
  CLOSE #path2
  PRINT
  END

3 (* Change extension identifier on
  (* output file
  char2:=ASC(ext2)
  char2:=char2+1
  ext2:=CHR$(char2)
  IF ext2="{" THEN
    ext2:="a"
    char1:=ASC(ext1)
    char1:=char1+1
    ext1:=CHR$(char1)
  ENDIF
  file2:=LEFT$(file2,LEN(file2)-2)
  file2:=file2+ext1+ext2
  RETURN
