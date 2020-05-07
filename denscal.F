      subroutine denscal
      use stff
      implicit none    

      integer :: i
      real :: amu, sym_d
      real,allocatable :: i_dns(:)
      
      amu=1.6605655d-27
      sym_d = 0.0d00
      allocate(i_dns(sl))
   
      do i =1, sl
         i_dns(i) = 0.0d00
      enddo

     
      if(sym=='no'.or.sym=="NO".or.sym=='n'.or.sym=='N')then 
       if(ityp == "num") then
         do i = 1, sl
            i_dns(i) = cnt_sl(i-1)/frms/b_vol
            write(12,*) bin*(i-1)+bin, i_dns(i)
         enddo
       elseif(ityp == "mass") then
         do i = 1, sl
            i_dns(i) = (((cnt_sl(i-1)*mass)/frms)/b_vol) * (amu/1.0d-27)
            write(12,*) bin*(i-1)+bin, i_dns(i) 
         enddo
       elseif(ityp == "ele") then
         do i = 1, sl
            i_dns(i) = ((cnt_sl(i-1)/frms)*ei)/b_vol
            write(12,*) bin*(i-1)+bin, i_dns(i) 
         enddo
       endif
      elseif(sym=='yes'.or.sym=="YES".or.sym=='y'.or.sym=='Y')then
       if(ityp == "num") then
         do i = 1, sl
            i_dns(i) = cnt_sl(i-1)/frms/b_vol
         enddo
       elseif(ityp == "mass") then
         do i = 1, sl
            i_dns(i) = (((cnt_sl(i-1)*mass)/frms)/b_vol) * (amu/1.0d-27)
         enddo
       elseif(ityp == "ele") then
         do i = 1, sl
            i_dns(i) = ((cnt_sl(i-1)/frms)*ei)/b_vol
         enddo
       endif
       do i = 1, sl
         sym_d = (i_dns(i) + i_dns((sl-(i-1))))*0.5d00
         write(12,*) bin*(i-1)+bin, sym_d 
       enddo
      endif

      return
      end subroutine 
