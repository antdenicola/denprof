      subroutine reading_occ
      use stff
      implicit none

!-----UNITS --------------------------!
!OCCAM format use coordinates in Ang. !
!-------------------------------------!

      integer i, j, cnt, b 
      real*16 x, y, z 
      character(len=1) dm1



      cnt = 0
      read(7,*)
      read(7,*)
      do i = 1, nat 
        read(7,*) dm1, x, y, z
        if(dm1 == isel)then
            cnt = cnt + 1
        endif
      enddo
      rewind(7)
      print *, 'Particle selected: ', isel
      print *, 'no. selected part./frms: ', cnt
      print *, '----------------------------------------------------'


! MAIN CYCLE
       do j = 1, frms
         b=-1
         read(7,*) ! empty lines for box and no. particles
         read(7,*)
         do i = 1, nat
           read(7,*) dm1, x, y, z 
           if(dm1 == isel)then
              if(dir == 'x' .or. dir == 'X')then
                b = int(x*0.1d00/bin) 
              elseif(dir == 'y' .or. dir == 'Y')then
                b = int(y*0.1d00/bin)    
              elseif(dir == 'z' .or. dir == 'Z')then
                b = int(z*0.1d00/bin)   
               ! b = anint(z/bin)   
              endif
              if(b.gt.(sl-1))then
                print *, "**ERROR** particle is out of no. slice"
                print 80, b, sl, j, i, x, y, z
                stop
                go to 10
              else
                cnt_sl(b) = cnt_sl(b) + 1
              endif
!              print *, "b is: ", b
           endif
         enddo
       enddo
          
80     format(4i5,3f8.4)
       return

10     end subroutine
