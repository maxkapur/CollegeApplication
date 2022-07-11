.DEFAULT_GOAL := all

all: 
	make -C ./thesis        & \
	make -C ./slides_08min  & \
	make -C ./slides_15min  & \
	make -C ./slides_25min  & \
	make -C ./paper_alma    & \
	make -C ./paper_ellis   &
