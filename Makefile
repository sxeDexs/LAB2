C = gcc

all: linking clean

linking: menu.o index_first_negative.o index_last_negative.o multi_before_and_after_negative.o multi_between_negative.o
	$(C) menu.o index_first_negative.o index_last_negative.o multi_before_and_after_negative.o multi_between_negative.o -o menu

menu.o: menu.c index_first_negative.h index_last_negative.h multi_before_and_after_negative.h multi_between_negative.h
	$(C) -c menu.c

index_first_negative.o: index_last_negative.c index_first_negative.h
	$(C) -c index_first_negative.c

index_last_negative.o: index_last_negative.c index_last_negative.h
	$(C) -c index_last_negative.c

multi_between_negative.o: multi_between_negative.c multi_between_negative.h index_first_negative.h index_last_negative.h
	$(C) -c multi_between_negative.c

multi_before_and_after_negative.o: multi_before_and_after_negative.c multi_before_and_after_negative.h index_first_negative.h index_last_negative.h
	$(C) -c multi_before_and_after_negative.c

clean:
	rm ./*.o
