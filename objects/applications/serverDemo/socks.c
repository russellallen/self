/* Sun-$Revision: 10.1 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include <sys/types.h>
# include <sys/socket.h>
# include <netinet/in.h>
# include <netdb.h>
# include <stdio.h>

# include "incls/_glueDefs.c.incl"


/* Why isn't this in a standard Unix header file? */
extern "C" int shutdown(int socketFD, int how); 


/* To test if static initializers are being called, include this.
struct fisk {
  fisk() { printf("blob-blob\n"); }
} sild;
*/


int socket_bind_listen(short port_no) {
  int sock = socket(PF_INET, SOCK_STREAM, 0);
  if (sock == -1)
    return -1;    /* Return error indication. */

  struct sockaddr_in receiver;
  receiver.sin_port        = ntohs(port_no);
  receiver.sin_family      = AF_INET;
  receiver.sin_addr.s_addr = INADDR_ANY;  /* receive from anyone */
  /* the cast on the next line is to pacify the C++ compiler */
  if(bind(sock, (struct sockaddr *)&receiver, sizeof(receiver)) == -1)
    return -1;    /* Return error indication. */

  if(listen(sock, 5) == -1)
    return -1;    /* Return error indication. */

  return sock;
}


int simple_accept(int sock) {
  struct sockaddr from;
  int len = sizeof(from);
  return accept(sock, &from, &len);
}



extern char *UnixFile_seal;         /* From unixPrims.h   -- this is a hack! */

# define WHAT_GLUE FUNCTIONS
    C_func_1(proxy_null,(int,UnixFile_seal), 
             socket_bind_listen, socket_bind_listen_glue,, short,)

    C_func_1( proxy_or_errno,(int,UnixFile_seal,-1), 
              simple_accept, simple_accept_glue,,
              proxy_null,(int,UnixFile_seal))

    C_func_2( int_or_errno,-1, shutdown, shutdown_glue,,
              proxy_null,(int,UnixFile_seal), int,)
# undef WHAT_GLUE
