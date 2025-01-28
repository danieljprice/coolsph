FC=gfortran
FFLAGS=-Wall -O3 -fdefault-real-8
SRC=output.f90 dens.f90 force.f90 step.f90 \
    setup.f90 sph.f90
OBJ=${SRC:.f90=.o}

%.o: %.f90
	$(FC) $(FFLAGS) -o $@ -c $<

.PHONY: sph

sph: $(OBJ)
	$(FC) $(FFLAGS) -o $@ $(OBJ)

clean:
	rm -f *.o *.mod

sph.o: setup.o setup.mod
