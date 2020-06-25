       program main
       use stff
       implicit none

       integer i, j


!### DEFAULT
       mass=0.0d00
       ei=0.0d00
       ityp='num'
       dir='Z'
       sl=10
       fin='trj.gro'
       fout='out.dat'
       isel='W'
       sym="no"
!### MAIN PROGRAM START ######       
       
       call input
       print *, " Counting frames ..."
       call preset
       call reading_gro
       print *, " Computing ..."
       call denscal

       print *, " "
       print *, "* * End * * "
       print *, " "


       print *, "Output files:"
       print *, fout
       print *," "


       end program
