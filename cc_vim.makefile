CC = g++

.PHONY: target
target:$(TARGET).out run
.PHONY: target_output_only
target_output_only:$(TARGET).out run_output 
SRCS=$(basename $(TARGET))
OBJS:= $(TARGET:.o=.cpp)

%.o : %.cpp
	$(CC) -c $< -o $@

$(TARGET).out: $(OBJS)
	$(CC) $< -o $(SRCS).out
run:
	$(shell ./$(SRCS).out < input.txt > output.txt )
#.PHONY: clean

run_output:
	$(shell ./$(SRCS).out  > output.txt )
#.PHONY: clean

#clean:
	#-rm *.out input.txt output.txt
