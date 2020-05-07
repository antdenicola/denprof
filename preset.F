      subroutine preset
      use stff
      implicit none
 
      bin = 0.0d00
      if(dir == "X" .or. dir == "x") then
         bin = bx/sl*1.0d00
         b_vol = bin*by*bz
      endif
      if(dir == "Y" .or. dir == "y") then
         bin = by/sl*1.0d00
         b_vol = bin*bx*bz
      endif
      if(dir == "Z" .or. dir == "z") then
         bin = bz/sl*1.0d00
         b_vol = bin*bx*by
      endif

       print *, 'no. slices:', sl  
       print *, 'bin size [nm]:', bin  
       print *, 'bin volume [nm^3]:', b_vol  


      return
      end subroutine



