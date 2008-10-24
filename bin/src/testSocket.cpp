#include <iostream>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/wait.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/ptrace.h>
#include <machine/ptrace.h>
#include <string.h>
#include <signal.h>

# include <inttypes.h>
# include <netinet/in.h>
# include <CoreServices/CoreServices.h>
# include <mach/mach_init.h>
# include <mach/mach_traps.h>
# include <mach/mach_error.h>

typedef int nAddressBytes_t;


int port = 9191;
bool verbose = false;
bool isServer = false;


class Socket {
private:
  int fd;

public:
  Socket(int f) { fd = f; }
  Socket(const Socket& s) { fd = s.fd; }


  void write_buffer(char* buf, int len, char* why) {
    int nb = 0;
    for (int total = 0;  total < len;  total += nb) {
      nb = write(fd, buf, len);
      if (nb <= 0) {
        perror(why);
        exit(1);
      }
    }
    if (verbose) printf("write_buffer success: %s\n", why);
  }

  void read_buffer(char* buf, int len, char* why) {
    int nb = 0;
    for (int total = 0;  total < len;  total += nb) {
      nb = read(fd, buf, len);
      if (nb < 0) {
        perror(why);
        exit(1);
      }
      if (nb == 0) {
        fprintf(stderr, "%s: EOF", why);
        exit(1);
      }
    }
    if (verbose) printf("read_buffer success: %s\n", why);
  }

  void write_string(const char* the_string, char* why) {
    int len = strlen(the_string);
    write_int(len, why);
    write_buffer((char*)the_string, len, why);
    if (verbose) printf("write_string success: %s\n", why);
  }

  char* read_string(char* why) {
    int len = read_int(why);
    char* buf = new char[len + 1];
    read_buffer(buf, len, why);
    buf[len] = '\0';
    if (verbose) printf("read_string success: %s\n", why);
    return buf;
  }

  char* read_bytes(int& len, char* why) {
    len = read_int(why);
    char* buf = new char[len];
    read_buffer(buf, len, why);
    if (verbose) printf("read_bytes success: %s\n", why);
    return buf;
  }

  void write_bytes(char* the_bytes, int len, char* why) {
    write_int(len, why);
    write_buffer(the_bytes, len, why);
    if (verbose) printf("write_bytes success: %s\n", why);
  }

  void write_int(int i, char* why) {
    char buf[4];
    buf[0] = char(i >> 24);
    buf[1] = char(i >> 16);
    buf[2] = char(i >>  8);
    buf[3] = char(i);
    write_buffer(buf, sizeof(buf), why);
    if (verbose) printf("write_int success: %s\n", why);
  }

  int read_int(char* why) {
    char buf[4];
    read_buffer(buf, sizeof(buf), why);
    if (verbose) printf("success: %s\n", why);
    return (buf[0] << 24) | ((buf[1] & 0xff) << 16) | ((buf[2] & 0xff) << 8) | (buf[3] & 0xff);
  }

  void write_byte(char  b, char* why) { write_buffer(&b, 1, why); }
  char  read_byte(         char* why) { char b;  read_buffer(&b, 1, why);  return b; }

  void read_int_array(int*& int_array, int& length, char* why) {
    int_array = NULL;  length = 0;
    length = read_int(why);
    int_array = new int[length];
    read_buffer((char*)int_array, length * sizeof(int_array[0]), why);
  }

  void write_int_array(int* int_array, int length, char* why) {
    write_int(length, "writing thread count");
    for (int i = 0;  i < length;  ++i)
      write_int(int_array[i], "writing thread");
  }
};



class SocketUser {
protected:
  Socket s;
public:
  SocketUser(const Socket& ss) : s(ss) {}
};



class ServerSocketOpener {
public:
  void open_on_port(int p) {
    port = p;
    open_socket();
    bind_socket();
    listen_for_connection();
  }
    int serverSocketFd() { return fd; }
   private:
  struct sockaddr_in serverAddress;
  int fd;
  int port;
    void open_socket() {
      fd = socket(AF_INET, SOCK_STREAM, 0);
      if (fd < 0)  { perror("socket() failed"); exit(1); }
      if (verbose) printf("opened server socket\n");
    }
      void bind_socket() {
        bzero(&serverAddress, sizeof(serverAddress));
        serverAddress.sin_family = AF_INET;
        serverAddress.sin_port = htons(port);
        serverAddress.sin_addr.s_addr = htonl(INADDR_ANY);
             if (bind(fd, (struct sockaddr *) &serverAddress, sizeof(serverAddress)) < 0) {
               char buf[1024];
               sprintf(buf, "SERVER ERROR: Could not bind server socket.\n"
                       "Is port %d already in use?\n", port);
               perror(buf);
               exit(1);
                       if (verbose) printf("bound socket\n");
             }
      }
    void listen_for_connection() {
      if (listen(fd, /*backlog*/ 100) < 0) {
        perror("SERVER ERROR: listen() failed");
        exit(2);
      }
      if (verbose) printf("listening on port %d\n", port);
    }
};



class ConnectionAcceptor {
public:
  ConnectionAcceptor(int fd) {
    serverSocketFd = fd;
    clientSocketFd = -1;
  }
    // initiate connection; fork, return -1 if parent, clientSocketFd if child
    int accept_and_fork() {
      for (;;) {
        collect_zombies();
        accept_a_connection();
        if (clientSocketFd < 0)
          continue;
              int childPid = fork();
              if (childPid == 0) // is child
                break;
              if (childPid < 0)
                perror("SERVER WARNING: service creation (fork) failed");
              close(clientSocketFd);
      }
      /*child*/
      close(serverSocketFd);
      if (verbose) printf("child returning %d\n", clientSocketFd);
      return clientSocketFd;
    }
   private:
  int serverSocketFd;
  int clientSocketFd;
    void collect_zombies() {
      int status;
      if (verbose) printf("collecting zomebies\n");
      for (int i = 0;  i < 10;  ++i)
        waitpid(-1, &status, WNOHANG);
      if (verbose) perror("waitpid");
    }
      void accept_a_connection() {
        struct sockaddr clientAddress;
        nAddressBytes_t nAddressBytes = sizeof(clientAddress);
        if (verbose)   printf("accepting\n");
        clientSocketFd = accept(serverSocketFd,  &clientAddress, &nAddressBytes);
        if (clientSocketFd < 0)  perror("SERVER WARNING: client connect failed");
        else if (verbose)             printf("accepted connection\n");
      }
};


class Initiator: public SocketUser {
public:
  Initiator(Socket& ss) : SocketUser(ss) {}
  /*
  How initiation works:
         Client sends INITIATION_REQUEST as ('\0'-terminated) string.
   Server responds with INITIATION_RESPONSE plus architecture string and my pid.
   */
      void initiate() {
        if (verbose) printf("initiating\n");
        char req = s.read_byte("request");
        validate_request(req);
        send_response();
      }

private:
      char* read_request() { return s.read_string("receiving initiation request"); }
      void validate_request(char req) {
        if (req != 17) {
          fprintf(stderr, "Client Error: invalid initiation request\n");
          exit(1);
        }
        if (verbose) printf("accepted initiation request\n");
      }
  void send_response() { s.write_byte(18, "sending initiation response"); }
};

void doServer() {
  ServerSocketOpener so;
  so.open_on_port(port);

  ConnectionAcceptor ca(so.serverSocketFd());
  int clientSocketFd = ca.accept_and_fork();
  // At this point, I am the child process
  Socket s(clientSocketFd);
  Initiator in(s);
  in.initiate();
  RequestServer rs(s);
  while (rs.serve_requests()) {}
}

void process_arguments(int argc, const char *argv[]) {
  const char* commandName = argv[0];
  if (argc > 1   &&  strcmp(argv[1], "-v") == 0) {
    verbose = true;
    --argc, ++argv;
  }
  if (argc > 2  &&  strcmp(argv[1], "-p") == 0) {
    port = atoi(argv[2]);
    argc -= 2;  argv += 2;
    if (verbose) printf("setting port to %d\n", port);
  }
  if (argc > 2  &&  strcmp(argv[1], "-s") == 0) {
    isServer = true;
    argc -= 1;  argv += 1;
    if (verbose) printf("being the server\n");
  }
  if (argc > 1) {
    printf("usage: %s [-v] [-p portNum]\n", commandName);
    exit(1);
  }
}


int main (int argc, const char * argv[]) {
  process_arguments(argc, argv);
  if (isServer) doServer();
  else          doClient();
  return 0;
}
