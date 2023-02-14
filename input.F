      subroutine input
      use stff
      implicit none

      integer :: i, j, k, stat
      integer argcount, lines
      real tm
      character (len=50) wq_char


      argcount = IARGC()

      do i=1,argcount
         call getarg(i,wq_char)
         if(INDEX(wq_char,'--help').ne.0) then
           write(6,*) '-type [num, mass, ele]'
           write(6,*) '-dir [X, Y, Z]'
           write(6,*) '-sl no. of slice'
           write(6,*) '-m mass of the selcted particle'
           write(6,*) '-ei electron of the selected particle'
           write(6,*) '-sel particle to select i.e.: W'
           write(6,*) '-sym symmetrize profile [yes]'
           write(6,*) '-in input traj'
           write(6,*) '-format [gro, occam]'
           write(6,*) '-o ouput'
           write(6,*) ''
           write(6,*) '--help print this help'
           write(6,*) '--ver print the version'
           write(6,*) 'Usage:'
           write(6,*) './densprof.x -in trj.gro -format gro -o out.dat 
     +-dir X -sl 20 -type mass -m 18.016 -sel W'
           write(6,*) 'NO MATTER ABOUT THE ORDER OF THE KEYS'
           stop
         end if
         if(INDEX(wq_char,'--ver').ne.0) then
           write(6,*)
           write(6,*) 'Ver.: 1.3                          '
           write(6,*) '+---------------------------------+'
           write(6,*) 'Author: Antonio De Nicola          '
           write(6,*) 'contacts: adenicola.chem@gmail.com '
           write(6,*) '+---------------------------------+'
           stop
         end if
         if(INDEX(wq_char,'-type').ne.0) then
           call getarg(i+1,wq_char)
           read(wq_char,*) ityp
         end if
         if(INDEX(wq_char,'-dir').ne.0) then
           call getarg(i+1,wq_char)
           read(wq_char,*) dir
         end if
       if(INDEX(wq_char,'-sl').ne.0) then
           call getarg(i+1,wq_char)
           read(wq_char,*) sl
         end if
         if(INDEX(wq_char,'-m').ne.0) then
           call getarg(i+1,wq_char)
           read(wq_char,*) mass
         endif
         if(INDEX(wq_char,'-ei').ne.0) then
           call getarg(i+1,wq_char)
           read(wq_char,*) ei
         endif
         if(INDEX(wq_char,'-in').ne.0) then
           call getarg(i+1,wq_char)
           read(wq_char,*) fin
         endif
         if(INDEX(wq_char,'-format').ne.0) then
           call getarg(i+1,wq_char)
           read(wq_char,*) frmt
         endif
         if(INDEX(wq_char,'-o').ne.0) then
           call getarg(i+1,wq_char)
           read(wq_char,*) fout
         endif
         if(INDEX(wq_char,'-sel').ne.0) then
           call getarg(i+1,wq_char)
           read(wq_char,*) isel
         endif
         if(INDEX(wq_char,'-sym').ne.0) then
           call getarg(i+1,wq_char)
           read(wq_char,*) sym 
         endif
      enddo

      open(unit = 7, file = fin, status = 'OLD')
      open(unit = 12, file= fout, status = 'UNKNOWN')

      lines=0

!------------!
! GRO FORMAT !
!------------!
      if(frmt.eq.'gro')then
       do
         read(7,*,iostat=stat)
         if (stat/=0) exit
         lines=lines + 1
       enddo
       rewind(7)

       do i = 1, lines - 1
         read(7,*)
       enddo
       read(7,*) bx, by, bz
       rewind(7)

       read(7,*)
       read(7,*) nat

       frms = lines/(nat+3)
       rewind(7)

       allocate(cnt_sl(sl))
       do i = 1, sl
         cnt_sl(i) = 0
       enddo
      endif

!--------------!
! OCCAM FORMAT !
!--------------!
      if(frmt.eq.'occam')then
       do
         read(7,*,iostat=stat)
         if (stat/=0) exit
         lines=lines + 1
       enddo
       rewind(7)

       read(7,*) nat
       read(7,*) tm, bx, by, bz
       bx = bx * 0.1d00
       by = by * 0.1d00
       bz = bz * 0.1d00

       frms = lines/(nat+2)
       rewind(7)

       allocate(cnt_sl(sl))
       do i = 1, sl
         cnt_sl(i) = 0
       enddo
      endif
!#### END #############

       print *, '----------------------------------------------------'
       print *, '-       Intial Settings                            -'
       print *, 'format file: ', frmt
       print *, 'no. frms: ', frms
       print *, 'no. part.:', nat
       if(ityp == "mass")then
         print *, 'Type profile.:', ityp
         print *, 'Mass (aum): ', mass
       elseif(ityp == "ele")then
         print *, 'Type profile.:', ityp
         print *, 'electrons/particle:', ei
       elseif(ityp == "num")then
         print *, 'Type profile.:', ityp
       endif
      
      return

      end subroutine
