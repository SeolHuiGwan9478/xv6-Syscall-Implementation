
_snice:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[]){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	83 ec 0c             	sub    $0xc,%esp
  13:	8b 51 04             	mov    0x4(%ecx),%edx
	char *argv1 = argv[1];
  16:	8b 42 04             	mov    0x4(%edx),%eax
	char *argv2 = argv[2];
  19:	8b 5a 08             	mov    0x8(%edx),%ebx
	int pid;
	int value;

	if(argv1[0] == '-'){
  1c:	80 38 2d             	cmpb   $0x2d,(%eax)
  1f:	74 52                	je     73 <main+0x73>
		argv1 = &argv1[1];
		pid = atoi(argv1);
		pid *= -1;
	}
	else{
		pid = atoi(argv1);
  21:	83 ec 0c             	sub    $0xc,%esp
  24:	50                   	push   %eax
  25:	e8 86 02 00 00       	call   2b0 <atoi>
  2a:	83 c4 10             	add    $0x10,%esp
  2d:	89 c6                	mov    %eax,%esi
	}
	
	if(argv2[0] == '-'){
  2f:	80 3b 2d             	cmpb   $0x2d,(%ebx)
  32:	74 2c                	je     60 <main+0x60>
		argv2 = &argv2[1];
		value = atoi(argv2);
		value *= -1;
	}
	else{
		value = atoi(argv2);
  34:	83 ec 0c             	sub    $0xc,%esp
  37:	53                   	push   %ebx
  38:	e8 73 02 00 00       	call   2b0 <atoi>
  3d:	83 c4 10             	add    $0x10,%esp
	}
	
	int result;
	result = setnice(pid,value);
  40:	83 ec 08             	sub    $0x8,%esp
  43:	50                   	push   %eax
  44:	56                   	push   %esi
  45:	e8 90 03 00 00       	call   3da <setnice>

	if(result == 0){ // Success set
  4a:	83 c4 10             	add    $0x10,%esp
  4d:	85 c0                	test   %eax,%eax
  4f:	74 37                	je     88 <main+0x88>
		printf(1,"Successfully Set a Nice-Value.\n");
	}
	else if(result == -1){ //doesn't exist pid
  51:	83 f8 ff             	cmp    $0xffffffff,%eax
  54:	74 58                	je     ae <main+0xae>
		printf(1,"Does not exist PID.\n");
	}
	else if(result == -2){ //out of range nice val
  56:	83 f8 fe             	cmp    $0xfffffffe,%eax
  59:	74 40                	je     9b <main+0x9b>
		printf(1,"Out of Range(Nice Value)\n");
	}
	exit();
  5b:	e8 c2 02 00 00       	call   322 <exit>
		value = atoi(argv2);
  60:	83 ec 0c             	sub    $0xc,%esp
		argv2 = &argv2[1];
  63:	83 c3 01             	add    $0x1,%ebx
		value = atoi(argv2);
  66:	53                   	push   %ebx
  67:	e8 44 02 00 00       	call   2b0 <atoi>
  6c:	83 c4 10             	add    $0x10,%esp
		value *= -1;
  6f:	f7 d8                	neg    %eax
  71:	eb cd                	jmp    40 <main+0x40>
		pid = atoi(argv1);
  73:	83 ec 0c             	sub    $0xc,%esp
		argv1 = &argv1[1];
  76:	83 c0 01             	add    $0x1,%eax
		pid = atoi(argv1);
  79:	50                   	push   %eax
  7a:	e8 31 02 00 00       	call   2b0 <atoi>
		pid *= -1;
  7f:	f7 d8                	neg    %eax
  81:	83 c4 10             	add    $0x10,%esp
  84:	89 c6                	mov    %eax,%esi
  86:	eb a7                	jmp    2f <main+0x2f>
		printf(1,"Successfully Set a Nice-Value.\n");
  88:	51                   	push   %ecx
  89:	51                   	push   %ecx
  8a:	68 e8 07 00 00       	push   $0x7e8
  8f:	6a 01                	push   $0x1
  91:	e8 fa 03 00 00       	call   490 <printf>
  96:	83 c4 10             	add    $0x10,%esp
  99:	eb c0                	jmp    5b <main+0x5b>
		printf(1,"Out of Range(Nice Value)\n");
  9b:	50                   	push   %eax
  9c:	50                   	push   %eax
  9d:	68 1d 08 00 00       	push   $0x81d
  a2:	6a 01                	push   $0x1
  a4:	e8 e7 03 00 00       	call   490 <printf>
  a9:	83 c4 10             	add    $0x10,%esp
  ac:	eb ad                	jmp    5b <main+0x5b>
		printf(1,"Does not exist PID.\n");
  ae:	52                   	push   %edx
  af:	52                   	push   %edx
  b0:	68 08 08 00 00       	push   $0x808
  b5:	6a 01                	push   $0x1
  b7:	e8 d4 03 00 00       	call   490 <printf>
  bc:	83 c4 10             	add    $0x10,%esp
  bf:	eb 9a                	jmp    5b <main+0x5b>
  c1:	66 90                	xchg   %ax,%ax
  c3:	66 90                	xchg   %ax,%ax
  c5:	66 90                	xchg   %ax,%ax
  c7:	66 90                	xchg   %ax,%ax
  c9:	66 90                	xchg   %ax,%ax
  cb:	66 90                	xchg   %ax,%ax
  cd:	66 90                	xchg   %ax,%ax
  cf:	90                   	nop

000000d0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	53                   	push   %ebx
  d4:	8b 45 08             	mov    0x8(%ebp),%eax
  d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  da:	89 c2                	mov    %eax,%edx
  dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  e0:	83 c1 01             	add    $0x1,%ecx
  e3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  e7:	83 c2 01             	add    $0x1,%edx
  ea:	84 db                	test   %bl,%bl
  ec:	88 5a ff             	mov    %bl,-0x1(%edx)
  ef:	75 ef                	jne    e0 <strcpy+0x10>
    ;
  return os;
}
  f1:	5b                   	pop    %ebx
  f2:	5d                   	pop    %ebp
  f3:	c3                   	ret    
  f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000100 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	53                   	push   %ebx
 104:	8b 55 08             	mov    0x8(%ebp),%edx
 107:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 10a:	0f b6 02             	movzbl (%edx),%eax
 10d:	0f b6 19             	movzbl (%ecx),%ebx
 110:	84 c0                	test   %al,%al
 112:	75 1c                	jne    130 <strcmp+0x30>
 114:	eb 2a                	jmp    140 <strcmp+0x40>
 116:	8d 76 00             	lea    0x0(%esi),%esi
 119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 120:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 123:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 126:	83 c1 01             	add    $0x1,%ecx
 129:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 12c:	84 c0                	test   %al,%al
 12e:	74 10                	je     140 <strcmp+0x40>
 130:	38 d8                	cmp    %bl,%al
 132:	74 ec                	je     120 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 134:	29 d8                	sub    %ebx,%eax
}
 136:	5b                   	pop    %ebx
 137:	5d                   	pop    %ebp
 138:	c3                   	ret    
 139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 140:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 142:	29 d8                	sub    %ebx,%eax
}
 144:	5b                   	pop    %ebx
 145:	5d                   	pop    %ebp
 146:	c3                   	ret    
 147:	89 f6                	mov    %esi,%esi
 149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000150 <strlen>:

uint
strlen(const char *s)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 156:	80 39 00             	cmpb   $0x0,(%ecx)
 159:	74 15                	je     170 <strlen+0x20>
 15b:	31 d2                	xor    %edx,%edx
 15d:	8d 76 00             	lea    0x0(%esi),%esi
 160:	83 c2 01             	add    $0x1,%edx
 163:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 167:	89 d0                	mov    %edx,%eax
 169:	75 f5                	jne    160 <strlen+0x10>
    ;
  return n;
}
 16b:	5d                   	pop    %ebp
 16c:	c3                   	ret    
 16d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 170:	31 c0                	xor    %eax,%eax
}
 172:	5d                   	pop    %ebp
 173:	c3                   	ret    
 174:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 17a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000180 <memset>:

void*
memset(void *dst, int c, uint n)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 187:	8b 4d 10             	mov    0x10(%ebp),%ecx
 18a:	8b 45 0c             	mov    0xc(%ebp),%eax
 18d:	89 d7                	mov    %edx,%edi
 18f:	fc                   	cld    
 190:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 192:	89 d0                	mov    %edx,%eax
 194:	5f                   	pop    %edi
 195:	5d                   	pop    %ebp
 196:	c3                   	ret    
 197:	89 f6                	mov    %esi,%esi
 199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001a0 <strchr>:

char*
strchr(const char *s, char c)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	53                   	push   %ebx
 1a4:	8b 45 08             	mov    0x8(%ebp),%eax
 1a7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 1aa:	0f b6 10             	movzbl (%eax),%edx
 1ad:	84 d2                	test   %dl,%dl
 1af:	74 1d                	je     1ce <strchr+0x2e>
    if(*s == c)
 1b1:	38 d3                	cmp    %dl,%bl
 1b3:	89 d9                	mov    %ebx,%ecx
 1b5:	75 0d                	jne    1c4 <strchr+0x24>
 1b7:	eb 17                	jmp    1d0 <strchr+0x30>
 1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1c0:	38 ca                	cmp    %cl,%dl
 1c2:	74 0c                	je     1d0 <strchr+0x30>
  for(; *s; s++)
 1c4:	83 c0 01             	add    $0x1,%eax
 1c7:	0f b6 10             	movzbl (%eax),%edx
 1ca:	84 d2                	test   %dl,%dl
 1cc:	75 f2                	jne    1c0 <strchr+0x20>
      return (char*)s;
  return 0;
 1ce:	31 c0                	xor    %eax,%eax
}
 1d0:	5b                   	pop    %ebx
 1d1:	5d                   	pop    %ebp
 1d2:	c3                   	ret    
 1d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001e0 <gets>:

char*
gets(char *buf, int max)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	57                   	push   %edi
 1e4:	56                   	push   %esi
 1e5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e6:	31 f6                	xor    %esi,%esi
 1e8:	89 f3                	mov    %esi,%ebx
{
 1ea:	83 ec 1c             	sub    $0x1c,%esp
 1ed:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 1f0:	eb 2f                	jmp    221 <gets+0x41>
 1f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 1f8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1fb:	83 ec 04             	sub    $0x4,%esp
 1fe:	6a 01                	push   $0x1
 200:	50                   	push   %eax
 201:	6a 00                	push   $0x0
 203:	e8 32 01 00 00       	call   33a <read>
    if(cc < 1)
 208:	83 c4 10             	add    $0x10,%esp
 20b:	85 c0                	test   %eax,%eax
 20d:	7e 1c                	jle    22b <gets+0x4b>
      break;
    buf[i++] = c;
 20f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 213:	83 c7 01             	add    $0x1,%edi
 216:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 219:	3c 0a                	cmp    $0xa,%al
 21b:	74 23                	je     240 <gets+0x60>
 21d:	3c 0d                	cmp    $0xd,%al
 21f:	74 1f                	je     240 <gets+0x60>
  for(i=0; i+1 < max; ){
 221:	83 c3 01             	add    $0x1,%ebx
 224:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 227:	89 fe                	mov    %edi,%esi
 229:	7c cd                	jl     1f8 <gets+0x18>
 22b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 22d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 230:	c6 03 00             	movb   $0x0,(%ebx)
}
 233:	8d 65 f4             	lea    -0xc(%ebp),%esp
 236:	5b                   	pop    %ebx
 237:	5e                   	pop    %esi
 238:	5f                   	pop    %edi
 239:	5d                   	pop    %ebp
 23a:	c3                   	ret    
 23b:	90                   	nop
 23c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 240:	8b 75 08             	mov    0x8(%ebp),%esi
 243:	8b 45 08             	mov    0x8(%ebp),%eax
 246:	01 de                	add    %ebx,%esi
 248:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 24a:	c6 03 00             	movb   $0x0,(%ebx)
}
 24d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 250:	5b                   	pop    %ebx
 251:	5e                   	pop    %esi
 252:	5f                   	pop    %edi
 253:	5d                   	pop    %ebp
 254:	c3                   	ret    
 255:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000260 <stat>:

int
stat(const char *n, struct stat *st)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	56                   	push   %esi
 264:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 265:	83 ec 08             	sub    $0x8,%esp
 268:	6a 00                	push   $0x0
 26a:	ff 75 08             	pushl  0x8(%ebp)
 26d:	e8 18 01 00 00       	call   38a <open>
  if(fd < 0)
 272:	83 c4 10             	add    $0x10,%esp
 275:	85 c0                	test   %eax,%eax
 277:	78 27                	js     2a0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 279:	83 ec 08             	sub    $0x8,%esp
 27c:	ff 75 0c             	pushl  0xc(%ebp)
 27f:	89 c3                	mov    %eax,%ebx
 281:	50                   	push   %eax
 282:	e8 cb 00 00 00       	call   352 <fstat>
  close(fd);
 287:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 28a:	89 c6                	mov    %eax,%esi
  close(fd);
 28c:	e8 29 01 00 00       	call   3ba <close>
  return r;
 291:	83 c4 10             	add    $0x10,%esp
}
 294:	8d 65 f8             	lea    -0x8(%ebp),%esp
 297:	89 f0                	mov    %esi,%eax
 299:	5b                   	pop    %ebx
 29a:	5e                   	pop    %esi
 29b:	5d                   	pop    %ebp
 29c:	c3                   	ret    
 29d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2a0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2a5:	eb ed                	jmp    294 <stat+0x34>
 2a7:	89 f6                	mov    %esi,%esi
 2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002b0 <atoi>:

int
atoi(const char *s)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	53                   	push   %ebx
 2b4:	8b 4d 08             	mov    0x8(%ebp),%ecx
	
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2b7:	0f be 11             	movsbl (%ecx),%edx
 2ba:	8d 42 d0             	lea    -0x30(%edx),%eax
 2bd:	3c 09                	cmp    $0x9,%al
  n = 0;
 2bf:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 2c4:	77 1f                	ja     2e5 <atoi+0x35>
 2c6:	8d 76 00             	lea    0x0(%esi),%esi
 2c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 2d0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2d3:	83 c1 01             	add    $0x1,%ecx
 2d6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 2da:	0f be 11             	movsbl (%ecx),%edx
 2dd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2e0:	80 fb 09             	cmp    $0x9,%bl
 2e3:	76 eb                	jbe    2d0 <atoi+0x20>
  return n;
}
 2e5:	5b                   	pop    %ebx
 2e6:	5d                   	pop    %ebp
 2e7:	c3                   	ret    
 2e8:	90                   	nop
 2e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	56                   	push   %esi
 2f4:	53                   	push   %ebx
 2f5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2f8:	8b 45 08             	mov    0x8(%ebp),%eax
 2fb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2fe:	85 db                	test   %ebx,%ebx
 300:	7e 14                	jle    316 <memmove+0x26>
 302:	31 d2                	xor    %edx,%edx
 304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 308:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 30c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 30f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 312:	39 d3                	cmp    %edx,%ebx
 314:	75 f2                	jne    308 <memmove+0x18>
  return vdst;
}
 316:	5b                   	pop    %ebx
 317:	5e                   	pop    %esi
 318:	5d                   	pop    %ebp
 319:	c3                   	ret    

0000031a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 31a:	b8 01 00 00 00       	mov    $0x1,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <exit>:
SYSCALL(exit)
 322:	b8 02 00 00 00       	mov    $0x2,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <wait>:
SYSCALL(wait)
 32a:	b8 03 00 00 00       	mov    $0x3,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <pipe>:
SYSCALL(pipe)
 332:	b8 04 00 00 00       	mov    $0x4,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <read>:
SYSCALL(read)
 33a:	b8 05 00 00 00       	mov    $0x5,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <kill>:
SYSCALL(kill)
 342:	b8 06 00 00 00       	mov    $0x6,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <exec>:
SYSCALL(exec)
 34a:	b8 07 00 00 00       	mov    $0x7,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <fstat>:
SYSCALL(fstat)
 352:	b8 08 00 00 00       	mov    $0x8,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <chdir>:
SYSCALL(chdir)
 35a:	b8 09 00 00 00       	mov    $0x9,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <dup>:
SYSCALL(dup)
 362:	b8 0a 00 00 00       	mov    $0xa,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <getpid>:
SYSCALL(getpid)
 36a:	b8 0b 00 00 00       	mov    $0xb,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <sbrk>:
SYSCALL(sbrk)
 372:	b8 0c 00 00 00       	mov    $0xc,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <sleep>:
SYSCALL(sleep)
 37a:	b8 0d 00 00 00       	mov    $0xd,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <uptime>:
SYSCALL(uptime)
 382:	b8 0e 00 00 00       	mov    $0xe,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <open>:
SYSCALL(open)
 38a:	b8 0f 00 00 00       	mov    $0xf,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <write>:
SYSCALL(write)
 392:	b8 10 00 00 00       	mov    $0x10,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <mknod>:
SYSCALL(mknod)
 39a:	b8 11 00 00 00       	mov    $0x11,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <unlink>:
SYSCALL(unlink)
 3a2:	b8 12 00 00 00       	mov    $0x12,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <link>:
SYSCALL(link)
 3aa:	b8 13 00 00 00       	mov    $0x13,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <mkdir>:
SYSCALL(mkdir)
 3b2:	b8 14 00 00 00       	mov    $0x14,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <close>:
SYSCALL(close)
 3ba:	b8 15 00 00 00       	mov    $0x15,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <halt>:
SYSCALL(halt)
 3c2:	b8 16 00 00 00       	mov    $0x16,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <getnp>:
SYSCALL(getnp)
 3ca:	b8 17 00 00 00       	mov    $0x17,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <getnice>:
SYSCALL(getnice)
 3d2:	b8 18 00 00 00       	mov    $0x18,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <setnice>:
SYSCALL(setnice)
 3da:	b8 19 00 00 00       	mov    $0x19,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    
 3e2:	66 90                	xchg   %ax,%ax
 3e4:	66 90                	xchg   %ax,%ax
 3e6:	66 90                	xchg   %ax,%ax
 3e8:	66 90                	xchg   %ax,%ax
 3ea:	66 90                	xchg   %ax,%ax
 3ec:	66 90                	xchg   %ax,%ax
 3ee:	66 90                	xchg   %ax,%ax

000003f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	56                   	push   %esi
 3f5:	53                   	push   %ebx
 3f6:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3f9:	85 d2                	test   %edx,%edx
{
 3fb:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 3fe:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 400:	79 76                	jns    478 <printint+0x88>
 402:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 406:	74 70                	je     478 <printint+0x88>
    x = -xx;
 408:	f7 d8                	neg    %eax
    neg = 1;
 40a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 411:	31 f6                	xor    %esi,%esi
 413:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 416:	eb 0a                	jmp    422 <printint+0x32>
 418:	90                   	nop
 419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 420:	89 fe                	mov    %edi,%esi
 422:	31 d2                	xor    %edx,%edx
 424:	8d 7e 01             	lea    0x1(%esi),%edi
 427:	f7 f1                	div    %ecx
 429:	0f b6 92 40 08 00 00 	movzbl 0x840(%edx),%edx
  }while((x /= base) != 0);
 430:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 432:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 435:	75 e9                	jne    420 <printint+0x30>
  if(neg)
 437:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 43a:	85 c0                	test   %eax,%eax
 43c:	74 08                	je     446 <printint+0x56>
    buf[i++] = '-';
 43e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 443:	8d 7e 02             	lea    0x2(%esi),%edi
 446:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 44a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 44d:	8d 76 00             	lea    0x0(%esi),%esi
 450:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 453:	83 ec 04             	sub    $0x4,%esp
 456:	83 ee 01             	sub    $0x1,%esi
 459:	6a 01                	push   $0x1
 45b:	53                   	push   %ebx
 45c:	57                   	push   %edi
 45d:	88 45 d7             	mov    %al,-0x29(%ebp)
 460:	e8 2d ff ff ff       	call   392 <write>

  while(--i >= 0)
 465:	83 c4 10             	add    $0x10,%esp
 468:	39 de                	cmp    %ebx,%esi
 46a:	75 e4                	jne    450 <printint+0x60>
    putc(fd, buf[i]);
}
 46c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 46f:	5b                   	pop    %ebx
 470:	5e                   	pop    %esi
 471:	5f                   	pop    %edi
 472:	5d                   	pop    %ebp
 473:	c3                   	ret    
 474:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 478:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 47f:	eb 90                	jmp    411 <printint+0x21>
 481:	eb 0d                	jmp    490 <printf>
 483:	90                   	nop
 484:	90                   	nop
 485:	90                   	nop
 486:	90                   	nop
 487:	90                   	nop
 488:	90                   	nop
 489:	90                   	nop
 48a:	90                   	nop
 48b:	90                   	nop
 48c:	90                   	nop
 48d:	90                   	nop
 48e:	90                   	nop
 48f:	90                   	nop

00000490 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	57                   	push   %edi
 494:	56                   	push   %esi
 495:	53                   	push   %ebx
 496:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 499:	8b 75 0c             	mov    0xc(%ebp),%esi
 49c:	0f b6 1e             	movzbl (%esi),%ebx
 49f:	84 db                	test   %bl,%bl
 4a1:	0f 84 b3 00 00 00    	je     55a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 4a7:	8d 45 10             	lea    0x10(%ebp),%eax
 4aa:	83 c6 01             	add    $0x1,%esi
  state = 0;
 4ad:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 4af:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4b2:	eb 2f                	jmp    4e3 <printf+0x53>
 4b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4b8:	83 f8 25             	cmp    $0x25,%eax
 4bb:	0f 84 a7 00 00 00    	je     568 <printf+0xd8>
  write(fd, &c, 1);
 4c1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 4c4:	83 ec 04             	sub    $0x4,%esp
 4c7:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 4ca:	6a 01                	push   $0x1
 4cc:	50                   	push   %eax
 4cd:	ff 75 08             	pushl  0x8(%ebp)
 4d0:	e8 bd fe ff ff       	call   392 <write>
 4d5:	83 c4 10             	add    $0x10,%esp
 4d8:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 4db:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 4df:	84 db                	test   %bl,%bl
 4e1:	74 77                	je     55a <printf+0xca>
    if(state == 0){
 4e3:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 4e5:	0f be cb             	movsbl %bl,%ecx
 4e8:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 4eb:	74 cb                	je     4b8 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 4ed:	83 ff 25             	cmp    $0x25,%edi
 4f0:	75 e6                	jne    4d8 <printf+0x48>
      if(c == 'd'){
 4f2:	83 f8 64             	cmp    $0x64,%eax
 4f5:	0f 84 05 01 00 00    	je     600 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4fb:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 501:	83 f9 70             	cmp    $0x70,%ecx
 504:	74 72                	je     578 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 506:	83 f8 73             	cmp    $0x73,%eax
 509:	0f 84 99 00 00 00    	je     5a8 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 50f:	83 f8 63             	cmp    $0x63,%eax
 512:	0f 84 08 01 00 00    	je     620 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 518:	83 f8 25             	cmp    $0x25,%eax
 51b:	0f 84 ef 00 00 00    	je     610 <printf+0x180>
  write(fd, &c, 1);
 521:	8d 45 e7             	lea    -0x19(%ebp),%eax
 524:	83 ec 04             	sub    $0x4,%esp
 527:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 52b:	6a 01                	push   $0x1
 52d:	50                   	push   %eax
 52e:	ff 75 08             	pushl  0x8(%ebp)
 531:	e8 5c fe ff ff       	call   392 <write>
 536:	83 c4 0c             	add    $0xc,%esp
 539:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 53c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 53f:	6a 01                	push   $0x1
 541:	50                   	push   %eax
 542:	ff 75 08             	pushl  0x8(%ebp)
 545:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 548:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 54a:	e8 43 fe ff ff       	call   392 <write>
  for(i = 0; fmt[i]; i++){
 54f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 553:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 556:	84 db                	test   %bl,%bl
 558:	75 89                	jne    4e3 <printf+0x53>
    }
  }
}
 55a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 55d:	5b                   	pop    %ebx
 55e:	5e                   	pop    %esi
 55f:	5f                   	pop    %edi
 560:	5d                   	pop    %ebp
 561:	c3                   	ret    
 562:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 568:	bf 25 00 00 00       	mov    $0x25,%edi
 56d:	e9 66 ff ff ff       	jmp    4d8 <printf+0x48>
 572:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 578:	83 ec 0c             	sub    $0xc,%esp
 57b:	b9 10 00 00 00       	mov    $0x10,%ecx
 580:	6a 00                	push   $0x0
 582:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 585:	8b 45 08             	mov    0x8(%ebp),%eax
 588:	8b 17                	mov    (%edi),%edx
 58a:	e8 61 fe ff ff       	call   3f0 <printint>
        ap++;
 58f:	89 f8                	mov    %edi,%eax
 591:	83 c4 10             	add    $0x10,%esp
      state = 0;
 594:	31 ff                	xor    %edi,%edi
        ap++;
 596:	83 c0 04             	add    $0x4,%eax
 599:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 59c:	e9 37 ff ff ff       	jmp    4d8 <printf+0x48>
 5a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 5a8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5ab:	8b 08                	mov    (%eax),%ecx
        ap++;
 5ad:	83 c0 04             	add    $0x4,%eax
 5b0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 5b3:	85 c9                	test   %ecx,%ecx
 5b5:	0f 84 8e 00 00 00    	je     649 <printf+0x1b9>
        while(*s != 0){
 5bb:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 5be:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 5c0:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 5c2:	84 c0                	test   %al,%al
 5c4:	0f 84 0e ff ff ff    	je     4d8 <printf+0x48>
 5ca:	89 75 d0             	mov    %esi,-0x30(%ebp)
 5cd:	89 de                	mov    %ebx,%esi
 5cf:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5d2:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 5d5:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 5d8:	83 ec 04             	sub    $0x4,%esp
          s++;
 5db:	83 c6 01             	add    $0x1,%esi
 5de:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 5e1:	6a 01                	push   $0x1
 5e3:	57                   	push   %edi
 5e4:	53                   	push   %ebx
 5e5:	e8 a8 fd ff ff       	call   392 <write>
        while(*s != 0){
 5ea:	0f b6 06             	movzbl (%esi),%eax
 5ed:	83 c4 10             	add    $0x10,%esp
 5f0:	84 c0                	test   %al,%al
 5f2:	75 e4                	jne    5d8 <printf+0x148>
 5f4:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 5f7:	31 ff                	xor    %edi,%edi
 5f9:	e9 da fe ff ff       	jmp    4d8 <printf+0x48>
 5fe:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 600:	83 ec 0c             	sub    $0xc,%esp
 603:	b9 0a 00 00 00       	mov    $0xa,%ecx
 608:	6a 01                	push   $0x1
 60a:	e9 73 ff ff ff       	jmp    582 <printf+0xf2>
 60f:	90                   	nop
  write(fd, &c, 1);
 610:	83 ec 04             	sub    $0x4,%esp
 613:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 616:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 619:	6a 01                	push   $0x1
 61b:	e9 21 ff ff ff       	jmp    541 <printf+0xb1>
        putc(fd, *ap);
 620:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 623:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 626:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 628:	6a 01                	push   $0x1
        ap++;
 62a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 62d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 630:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 633:	50                   	push   %eax
 634:	ff 75 08             	pushl  0x8(%ebp)
 637:	e8 56 fd ff ff       	call   392 <write>
        ap++;
 63c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 63f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 642:	31 ff                	xor    %edi,%edi
 644:	e9 8f fe ff ff       	jmp    4d8 <printf+0x48>
          s = "(null)";
 649:	bb 37 08 00 00       	mov    $0x837,%ebx
        while(*s != 0){
 64e:	b8 28 00 00 00       	mov    $0x28,%eax
 653:	e9 72 ff ff ff       	jmp    5ca <printf+0x13a>
 658:	66 90                	xchg   %ax,%ax
 65a:	66 90                	xchg   %ax,%ax
 65c:	66 90                	xchg   %ax,%ax
 65e:	66 90                	xchg   %ax,%ax

00000660 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 660:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 661:	a1 ec 0a 00 00       	mov    0xaec,%eax
{
 666:	89 e5                	mov    %esp,%ebp
 668:	57                   	push   %edi
 669:	56                   	push   %esi
 66a:	53                   	push   %ebx
 66b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 66e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 678:	39 c8                	cmp    %ecx,%eax
 67a:	8b 10                	mov    (%eax),%edx
 67c:	73 32                	jae    6b0 <free+0x50>
 67e:	39 d1                	cmp    %edx,%ecx
 680:	72 04                	jb     686 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 682:	39 d0                	cmp    %edx,%eax
 684:	72 32                	jb     6b8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 686:	8b 73 fc             	mov    -0x4(%ebx),%esi
 689:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 68c:	39 fa                	cmp    %edi,%edx
 68e:	74 30                	je     6c0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 690:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 693:	8b 50 04             	mov    0x4(%eax),%edx
 696:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 699:	39 f1                	cmp    %esi,%ecx
 69b:	74 3a                	je     6d7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 69d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 69f:	a3 ec 0a 00 00       	mov    %eax,0xaec
}
 6a4:	5b                   	pop    %ebx
 6a5:	5e                   	pop    %esi
 6a6:	5f                   	pop    %edi
 6a7:	5d                   	pop    %ebp
 6a8:	c3                   	ret    
 6a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6b0:	39 d0                	cmp    %edx,%eax
 6b2:	72 04                	jb     6b8 <free+0x58>
 6b4:	39 d1                	cmp    %edx,%ecx
 6b6:	72 ce                	jb     686 <free+0x26>
{
 6b8:	89 d0                	mov    %edx,%eax
 6ba:	eb bc                	jmp    678 <free+0x18>
 6bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 6c0:	03 72 04             	add    0x4(%edx),%esi
 6c3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6c6:	8b 10                	mov    (%eax),%edx
 6c8:	8b 12                	mov    (%edx),%edx
 6ca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6cd:	8b 50 04             	mov    0x4(%eax),%edx
 6d0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6d3:	39 f1                	cmp    %esi,%ecx
 6d5:	75 c6                	jne    69d <free+0x3d>
    p->s.size += bp->s.size;
 6d7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 6da:	a3 ec 0a 00 00       	mov    %eax,0xaec
    p->s.size += bp->s.size;
 6df:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6e2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6e5:	89 10                	mov    %edx,(%eax)
}
 6e7:	5b                   	pop    %ebx
 6e8:	5e                   	pop    %esi
 6e9:	5f                   	pop    %edi
 6ea:	5d                   	pop    %ebp
 6eb:	c3                   	ret    
 6ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	57                   	push   %edi
 6f4:	56                   	push   %esi
 6f5:	53                   	push   %ebx
 6f6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6fc:	8b 15 ec 0a 00 00    	mov    0xaec,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 702:	8d 78 07             	lea    0x7(%eax),%edi
 705:	c1 ef 03             	shr    $0x3,%edi
 708:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 70b:	85 d2                	test   %edx,%edx
 70d:	0f 84 9d 00 00 00    	je     7b0 <malloc+0xc0>
 713:	8b 02                	mov    (%edx),%eax
 715:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 718:	39 cf                	cmp    %ecx,%edi
 71a:	76 6c                	jbe    788 <malloc+0x98>
 71c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 722:	bb 00 10 00 00       	mov    $0x1000,%ebx
 727:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 72a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 731:	eb 0e                	jmp    741 <malloc+0x51>
 733:	90                   	nop
 734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 738:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 73a:	8b 48 04             	mov    0x4(%eax),%ecx
 73d:	39 f9                	cmp    %edi,%ecx
 73f:	73 47                	jae    788 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 741:	39 05 ec 0a 00 00    	cmp    %eax,0xaec
 747:	89 c2                	mov    %eax,%edx
 749:	75 ed                	jne    738 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 74b:	83 ec 0c             	sub    $0xc,%esp
 74e:	56                   	push   %esi
 74f:	e8 1e fc ff ff       	call   372 <sbrk>
  if(p == (char*)-1)
 754:	83 c4 10             	add    $0x10,%esp
 757:	83 f8 ff             	cmp    $0xffffffff,%eax
 75a:	74 1c                	je     778 <malloc+0x88>
  hp->s.size = nu;
 75c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 75f:	83 ec 0c             	sub    $0xc,%esp
 762:	83 c0 08             	add    $0x8,%eax
 765:	50                   	push   %eax
 766:	e8 f5 fe ff ff       	call   660 <free>
  return freep;
 76b:	8b 15 ec 0a 00 00    	mov    0xaec,%edx
      if((p = morecore(nunits)) == 0)
 771:	83 c4 10             	add    $0x10,%esp
 774:	85 d2                	test   %edx,%edx
 776:	75 c0                	jne    738 <malloc+0x48>
        return 0;
  }
}
 778:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 77b:	31 c0                	xor    %eax,%eax
}
 77d:	5b                   	pop    %ebx
 77e:	5e                   	pop    %esi
 77f:	5f                   	pop    %edi
 780:	5d                   	pop    %ebp
 781:	c3                   	ret    
 782:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 788:	39 cf                	cmp    %ecx,%edi
 78a:	74 54                	je     7e0 <malloc+0xf0>
        p->s.size -= nunits;
 78c:	29 f9                	sub    %edi,%ecx
 78e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 791:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 794:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 797:	89 15 ec 0a 00 00    	mov    %edx,0xaec
}
 79d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 7a0:	83 c0 08             	add    $0x8,%eax
}
 7a3:	5b                   	pop    %ebx
 7a4:	5e                   	pop    %esi
 7a5:	5f                   	pop    %edi
 7a6:	5d                   	pop    %ebp
 7a7:	c3                   	ret    
 7a8:	90                   	nop
 7a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 7b0:	c7 05 ec 0a 00 00 f0 	movl   $0xaf0,0xaec
 7b7:	0a 00 00 
 7ba:	c7 05 f0 0a 00 00 f0 	movl   $0xaf0,0xaf0
 7c1:	0a 00 00 
    base.s.size = 0;
 7c4:	b8 f0 0a 00 00       	mov    $0xaf0,%eax
 7c9:	c7 05 f4 0a 00 00 00 	movl   $0x0,0xaf4
 7d0:	00 00 00 
 7d3:	e9 44 ff ff ff       	jmp    71c <malloc+0x2c>
 7d8:	90                   	nop
 7d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 7e0:	8b 08                	mov    (%eax),%ecx
 7e2:	89 0a                	mov    %ecx,(%edx)
 7e4:	eb b1                	jmp    797 <malloc+0xa7>
