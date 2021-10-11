#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[]){
	char *argv1 = argv[1];
	char *argv2 = argv[2];
	int pid;
	int value;

	if(argv1[0] == '-'){
		argv1 = &argv1[1];
		pid = atoi(argv1);
		pid *= -1;
	}
	else{
		pid = atoi(argv1);
	}
	
	if(argv2[0] == '-'){
		argv2 = &argv2[1];
		value = atoi(argv2);
		value *= -1;
	}
	else{
		value = atoi(argv2);
	}
	
	int result;
	result = setnice(pid,value);

	if(result == 0){ // Success set
		printf(1,"Successfully Set a Nice-Value.\n");
	}
	else if(result == -1){ //doesn't exist pid
		printf(1,"Does not exist PID.\n");
	}
	else if(result == -2){ //out of range nice val
		printf(1,"Out of Range(Nice Value)\n");
	}
	exit();
}

