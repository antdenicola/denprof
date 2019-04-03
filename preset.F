      subroutine preset
      use stff
      implicit none
 

      if(dir == "X" .or. dir == "x") then
         bin = bx/sl
         b_vol = bin*by*bz
      endif
      if(dir == "Y" .or. dir == "y") then
         bin = by/sl
         b_vol = bin*bx*bz
      endif
      if(dir == "Z" .or. dir == "z") then
         bin = bz/sl
         b_vol = bin*bx*by
      endif

       print *, 'no. slices:', sl  
       print *, 'bin [nm]:', bin  
       print *, 'bin volume [nm^3]:', b_vol  


      return
      end subroutine


