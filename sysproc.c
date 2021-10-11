#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return myproc()->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

// Halt (shutdown) the system by sending a special
// signal to QEMU.
// Based on: http://pdos.csail.mit.edu/6.828/2012/homework/xv6-syscall.html
int
sys_halt(void)
{
	char *p = "Shutdown";


	outw( 0x604, 0x0 | 0x2000 );
	for( ; *p; p++)
		outw(0xB004, 0x2000);

	return 0;
}

int
sys_getnp(void)
{
	return getnproc();
}

int
sys_getnice(void)
{	
	int pid;
	argint(0, &pid);
	int nice = getnice_val(pid);
	
	if(nice == -1){
		return -1;
	} // 프로세스가 없는 경우
	else{
		return nice;
	} //return nice value
}

int
sys_setnice(void)
{	
	int pid, value;
	argint(0,&pid);
	argint(1,&value);

	if(value < 0 || value > 40){
		return -2;
	} //Out of Range(nice val)
	int nice = setnice_val(pid, value);

	if(nice == -1){
		return -1; //pid 없음
	} //프로세스가 없는 경우
	else{
		return 0; //성공
	}
}

