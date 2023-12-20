/* 参考: https://github.com/tetraloba/packetBuilder/blob/main/wakeonlan.c */
#define DESTINATION "192.168.0.200"
#define PORT 10000
#define MSG "stop"

#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>

int main(void) {
    int sock = socket(AF_INET, SOCK_DGRAM, 0);
    struct sockaddr_in addr;
    int yes = 1;

    addr.sin_family = AF_INET;
    addr.sin_port = htons(PORT);
    addr.sin_addr.s_addr = inet_addr(DESTINATION);

    sendto(sock, MSG, sizeof(MSG), 0, (struct sockaddr *)&addr, sizeof(addr));

    close(sock);

    return 0;
}
