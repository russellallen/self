/* Sun-$Revision: 30.6 $ */

/* Copyright 1995-2006 Sun Microsystems, Inc.
   See the LICENSE file for license information. */

# include <stdlib.h>
# include <unistd.h>
# include <sys/types.h>
# include <sys/socket.h>
# include <netinet/in.h>
# include <netdb.h>
# include <stdio.h>
# include <string.h>

# if defined(sun) || defined(__sun)
# include <sys/systeminfo.h>
extern "C" {
  int gethostname(char* n, int len) { 
    return sysinfo(SI_HOSTNAME, (char*) n, len); }
}
/* For some reason this one is not declared in any header file. */
extern "C" int shutdown(int socketFD, int how); 
# endif


short port_number    =  1275;
const int   debug          =     0;
const int   hostNameLength =   100;
const int   selfExpLength  =  1000;


void usage(char* name) {
  fprintf(stderr, "usage: %s [host [port]] \n", name);
  exit(-1);
}


inline void safeDo(int dofail, const char *s) {
  if (dofail) {
    fprintf(stderr, "rself: %s\n", s);
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


void parseArgs(int argc, char **argv, char *hostName) {
  if (argc >= 4)
    usage(argv[0]);
  safeDo(gethostname(hostName, hostNameLength) == -1, "gethostname failed");
  if (argc > 1)
      strcpy(hostName, argv[1]);
  if (argc > 2)
      port_number = atoi(argv[2]);
}


void relay(int sock) {
  /* Read from socket, echo to stdout. Read from input, echo to sock. 
     When eof(input) shutdown that direction of sock. If read on sock
     fails, assume it is because self process did a shutdown; then stop
     waiting for output from him and also stop relaying input to him. */
  trace("Starting to relay.\n");
  if (fork()) {
    char ch;
    for (;;) {
      char buf[BUFSIZ];
      int count = read(sock, buf, sizeof(buf));
      if (count <= 0)
	break;
      if (write(1, buf, count) == -1) {
	break; // this is bad.
      }
    }
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


int main(int argc, char **argv) {
  trace("main start");
  char hostName[hostNameLength];
  parseArgs(argc, argv, hostName);
  int sock = createConnection(hostName, port_number);
  relay(sock);
  close(sock);
}
