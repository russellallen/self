/* Sun-$Revision: 10.1 $ */

# include <stdlib.h>
# include <unistd.h>
# include <sys/types.h>
# include <sys/socket.h>
# include <netinet/in.h>
# include <netdb.h>
# include <stdio.h>
# include <string.h>

# ifdef SOLARIS
# include <sys/systeminfo.h>
extern "C" {
  int gethostname(const char* n, int len) { 
    return sysinfo(SI_HOSTNAME, (char*) n, len); }
}
# endif

/* For some reason this one is not declared in any header file. */
extern "C" int shutdown(int socketFD, int how); 

const short port_number    =  1275;
const int   debug          =     0;
const int   hostNameLength =   100;
const int   selfExpLength  =  1000;


void usage() {
  fprintf(stderr, "usage: toself [-h host] selfExp\n");
  exit(-1);
}


inline void safeDo(int dofail, const char *s) {
  if (dofail) {
    fprintf(stderr, "toself: %s\n", s);
    exit(-1);
  }
}


inline void trace(const char *s) {
  if (debug)
    fprintf(stderr, "%s\n", s);
}

 
inline void safeWrite(int fd, void *buf, int len) {
  safeDo(write(fd, buf, len) < len, "write failed");
}


void parseCmd(int argc, char **argv, char *hostName, char *selfExp) {
  if (argc <= 1)
    usage();
  safeDo(gethostname(hostName, hostNameLength) == -1, "gethostname failed");
  int i = 1;
  if (!strcmp(argv[i],"-h")) {
    if (argc <= 3)
      usage();
    i++;
    if (i >= argc)
      usage();
    strcpy(hostName, argv[i]);
    i++;
  }
  selfExp[0] = '\0';     /* Now just concatenate the rest of the arguments. */
  while(i < argc) {
    strcat(selfExp, argv[i]);
    strcat(selfExp, " ");
    i++;
  }
  strcat(selfExp, "\n");
}


void relay(int sock) {
  /* Read from socket, echo to stdout. Read form input, echo to sock. 
     When eof(input) shutdown that direction of sock. If read on sock
     fails, assume it is because self process did a shutdown; then stop
     waiting for output from him and also stop relaying input to him. */
  trace("Starting to relay.\n");
  if (fork()) {
    char ch;
    while(read(sock, &ch, sizeof(char)) == sizeof(char))   /* read - ok? */
      putchar(ch);
    trace("read failed - assuming shutdown");
    /* Now exit, thereby terminating parent (and child). */
  } else {
    int ich;  /* int to be able to distinguish EOF. */
    while((ich = getchar()) != EOF) {
      char ch = ich;
      safeWrite(sock, &ch, sizeof(ch));
    }
    shutdown(sock, 1);
  }
}


int createConnection(char *hostName, short port) {
  trace("createConnection start");
  struct hostent *hp = gethostbyname(hostName);   
  struct sockaddr_in receiver;
  memset((char *)&receiver, '\0', sizeof(receiver));
  memcpy((char *)&receiver.sin_addr, hp->h_addr, hp->h_length);

  receiver.sin_family= hp->h_addrtype;
  receiver.sin_port= htons(port);
  int sock = socket(PF_INET, SOCK_STREAM, 0);
  safeDo(sock == -1, "socket create failed");
  safeDo(connect(sock, (struct sockaddr *)&receiver, sizeof(receiver)) == -1,
         "connect failed");         /* Something rotten about that cast?! */
  trace("Got a connection");
  return sock;
}


main(int argc, char **argv) {
  trace("main start");
  char hostName[hostNameLength];
  char selfExp[selfExpLength];
  parseCmd(argc, argv, hostName, selfExp);
  int sock = createConnection(hostName, port_number);
  safeWrite(sock, selfExp, strlen(selfExp));  /* Send Self expression. */
  relay(sock);
  close(sock);
}
