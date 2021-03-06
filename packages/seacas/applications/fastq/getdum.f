C    Copyright (c) 2014, Sandia Corporation.
C    Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
C    the U.S. Government retains certain rights in this software.
C    
C    Redistribution and use in source and binary forms, with or without
C    modification, are permitted provided that the following conditions are
C    met:
C    
C        * Redistributions of source code must retain the above copyright
C          notice, this list of conditions and the following disclaimer.
C    
C        * Redistributions in binary form must reproduce the above
C          copyright notice, this list of conditions and the following
C          disclaimer in the documentation and/or other materials provided
C          with the distribution.
C    
C        * Neither the name of Sandia Corporation nor the names of its
C          contributors may be used to endorse or promote products derived
C          from this software without specific prior written permission.
C    
C    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
C    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
C    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
C    A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
C    OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
C    SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
C    LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
C    DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
C    THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
C    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
C    OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
C    

C $Id: getdum.f,v 1.1 1990/11/30 11:08:00 gdsjaar Exp $
C $Log: getdum.f,v $
C Revision 1.1  1990/11/30 11:08:00  gdsjaar
C Initial revision
C
C
CC* FILE: [.MAIN]GETDUM.FOR
CC* MODIFIED BY: TED BLACKER
CC* MODIFICATION DATE: 7/6/90
CC* MODIFICATION: COMPLETED HEADER INFORMATION
C
      SUBROUTINE GETDUM (I, DUMMY, LEN)
C***********************************************************************
C
C  SUBROUTINE GETDUM = GETS AN INTEGER INTO A DUMMY CHARACTER STRING
C
C***********************************************************************
C
      CHARACTER*72 DUMMY
C
      DUMMY = ' '
      IF (I .LT. -9999) THEN
         WRITE(DUMMY(1:6),10050)I
         LEN = 6
      ELSEIF (I .LT. -999) THEN
         WRITE (DUMMY(1:5), 10040) I
         LEN = 5
      ELSEIF (I .LT. -99) THEN
         WRITE (DUMMY(1:4), 10030) I
         LEN = 4
      ELSEIF (I .LT. -9) THEN
         WRITE (DUMMY(1:3), 10020) I
         LEN = 3
      ELSEIF (I .LT. 0) THEN
         WRITE (DUMMY(1:2), 10010) I
         LEN = 6
      ELSEIF(I .LT. 10) THEN
         WRITE (DUMMY(1:1), 10000) I
         LEN = 1
      ELSEIF(I.LT.100)THEN
         WRITE (DUMMY(1:2), 10010) I
         LEN = 2
      ELSEIF (I .LT. 1000) THEN
         WRITE (DUMMY(1:3), 10020) I
         LEN = 3
      ELSEIF (I .LT. 10000) THEN
         WRITE (DUMMY(1:4), 10030) I
         LEN = 4
      ELSE
         WRITE (DUMMY(1:5), 10040) I
         LEN = 5
      ENDIF
      RETURN
C
10000 FORMAT (I1)
10010 FORMAT (I2)
10020 FORMAT (I3)
10030 FORMAT (I4)
10040 FORMAT (I5)
10050 FORMAT (I6)
C
      END
