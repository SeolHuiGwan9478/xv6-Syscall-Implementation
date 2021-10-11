#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[]){
	char *argv1 = argv[1];
	int pid; //String to Int
	if(argv1[0] == '-'){
		argv1 = &argv1[1];
		pid = atoi(argv1);
		pid *= -1;
	}
	else{
		pid = atoi(argv1);
	}
	int nice; //nice variable
	nice = getnice(pid); //calling system call
	if(nice == -1){ //no PID
		printf(1,"Does not exist PID.\n"); 
	}
	else{
		printf(1,"Nice Value : %d\n",nice);
	}
	exit();
}
