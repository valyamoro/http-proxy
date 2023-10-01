#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <sys/socket.h>
#include <sys/types.h>

#include <netinet/in.h>

#define PORT 8888

int main()
{
    char message[256] = "Hello World";

    struct sockaddr_in server_address;
    server_address.sin_addr.s_addr = INADDR_ANY;
    server_address.sin_port = htons(PORT);
    server_address.sin_family = AF_INET;

    int sockfd = socket(AF_INET, SOCK_STREAM, 0);

    if (sockfd == -1) {
        printf("Error while creating the socket");
        exit(1);
    }

    if (bind(sockfd, (struct sockaddr*)&server_address, sizeof(server_address)) < 0) {
        printf("Error in binding");
        exit(1);
    }

    if (listen(sockfd, 5) < 0) {
        printf("Error in listening");
        exit(1);
    }

    int newsocket = accept(sockfd, (struct sockaddr*)&server_address, (socklen_t*)sizeof(server_address));
    if (newsocket < 0) {
        printf("Error in accepting");
        exit(1);
    }

    if (send(newsocket, message, sizeof(message), 0) < 0) {
        printf("Error in sending data");
        exit(1);
    }

    close(sockfd);
    close(newsocket);
}
