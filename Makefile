#FCOMPFLAGS    =	-O0 -g -C -D nb_num  
FCOMPFLAGS    =	-O0 -g -C   
#FCOMPFLAGS    =	 -O2   
#FCOMPFLAGS    =	 -pg -tpp7 -O3  -align  -axN -tpp7 
#FCOMPFLAGS    =	 -pg  -O2  
CCOMPFLAGS    =	-O

FFLAGS        =	$(FCOMPFLAGS)
CFLAGS        = $(CCOMPFLAGS)
LDFLAGS       =	$(FCOMPFLAGS)

LD            =	gfortran    
FC            =	gfortran   

MAKEFILE      =	Makefile
PROGRAM       =	densprof.x  

OBJS	      =	stff.o \
		input.o\
		main.o\
		preset.o\
		reading_gro.o\
		reading_occ.o\
		denscal.o

all:		$(PROGRAM)

$(PROGRAM)::	$(INCS)
		@/bin/rm -f $(OBJS) 

$(PROGRAM)::	$(OBJS) $(MAKEFILE)
		@$(LD) $(LDFLAGS) $(OBJS) -o $(PROGRAM)

clean::		@rm -f $(OBJS)
