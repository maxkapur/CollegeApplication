.DEFAULT_GOAL := all

all: 
	make -C ./paper; make -C ./slides_08min; make -C ./slides_15min; make -C ./slides_25min;

