      subroutine reading_gro
      use stff
      implicit none

!-----UNITS --------------------------!
!GRO format use coordinates in nm     !
!-------------------------------------!

      integer i, j, cnt, b 
      integer dm1, dm4
      real*16 x, y, z 
      character(len=5) dm2, dm3



      cnt = 0
      read(7,*)
      read(7,*)
      do i = 1, nat 
        read(7,90) dm1, dm2, dm3, dm4, x, y, z 
        if(dm3 == isel)then
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
         read(7,*) ! empty lines for title and no. particles
         read(7,*)
         do i = 1, nat
           read(7,90) dm1, dm2, dm3, dm4, x, y, z 
           if(dm3 == isel)then
              if(dir == 'x' .or. dir == 'X')then
                b = int(x/bin) 
              elseif(dir == 'y' .or. dir == 'Y')then
                b = int(y/bin)    
              elseif(dir == 'z' .or. dir == 'Z')then
                b = int(z/bin)   
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
         read(7,*) ! blank line for the box
       enddo
          
80     format(4i5,3f8.4)
90     format(1a5, 2a5, 1a5, 3f8.4, 3f8.5)
       return

10     end subroutine
