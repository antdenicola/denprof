      subroutine reading_gro
      use stff
      implicit none

!-----UNITS --------------------------!
!GRO format use nm coordinates        !
!-------------------------------------!

      integer i, j, cnt, b 
      integer dm1, dm4
      real*8 x, y, z 
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
       b=0
       do j = 1, frms
         read(7,*) ! empty lines for title and no. particles
         read(7,*)
         do i = 1, nat
           read(7,90) dm1, dm2, dm3, dm4, x, y, z 
           if(dm3 == isel)then
              if(dir == 'x' .or. dir == 'X')then
                b = anint(x/bin) 
              elseif(dir == 'y' .or. dir == 'Y')then
                b = anint(y/bin)    
              elseif(dir == 'z' .or. dir == 'Z')then
                b = anint(z/bin)   
              endif
              if(b.gt.sl)then
                print *, "**ERROR** particle is out of no. slice"
                print *, b, sl, x, y, z
                stop
                go to 10
              endif
!             print *, "b is: ", b
             cnt_sl(b) = cnt_sl(b) + 1
           endif
         enddo
         read(7,*) ! blank line for the box
       enddo
          
90     format(1a5, 2a5, 1a5, 3f8.4, 3f8.5)
       return
10     end subroutine
