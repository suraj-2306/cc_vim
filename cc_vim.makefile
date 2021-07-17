CC = g++

.PHONY: target
target:$(TARGET).out run
.PHONY: target_output
target_output:$(TARGET).out run_with_output
.PHONY: target_output_only
target_output_only:$(TARGET).out run_output 
SRCS=$(basename $(TARGET))
OBJS:= $(TARGET:.o=.cpp)

%.o : %.cpp
	$(CC) -c $< -o $@

$(TARGET).out: $(OBJS)
	$(CC) $< -o $(SRCS).out
run:
	$(shell timeout 0.5s ./$(SRCS).out < input.txt >/dev/null ; echo $$? > errormsg)

run_with_output:
	$(shell ./$(SRCS).out < input.txt > output.txt )

#.PHONY: clean

run_output:
	$(shell timeout 0.5s ./$(SRCS).out  > output.txt ; echo $?)
#.PHONY: clean

#clean:
	#-rm *.out input.txt output.txt
