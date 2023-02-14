       module stff
       implicit none

       integer sl, ei, nat, frms
       
       real mass, bin, b_vol

       real*8 bx, by, bz 

       integer,allocatable:: cnt_sl(:)
       character(len=50) fin, frmt, fout, fsout
       character(len=5) dir, ityp, sym
       character(len=1) isel

       end module
