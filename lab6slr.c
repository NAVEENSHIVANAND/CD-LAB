# include <stdio.h>
# include <stdlib.h>
# define Qsize 5

int count = 0;

int enqueue(int q[], int *rear, int item) {
    if(count == Qsize){
        printf("Queue Overflow\n");
        return 0;
    }
    *rear = ((*rear) + 1) % Qsize;
    q[*rear] = item;
    count++;
}

int deque(int q[], int *front) {
    int del_item;
    if(count==0) {
        printf("Queue Underflow\n");
        return -1;
    }
    del_item = q[*front];
    *front = ((*front) + 1) % Qsize;
    count--;
    return del_item;
}

void display(int q[], int *front, int *rear) {
    int i;
    if (*front > *rear)
        printf("Queue is empty\n");
    printf("The contents of Queue are: \n");
    int f = *front;
    for(i = 0; i < count; i++){
        printf("%d ", q[f]);
        f = (f + 1) % Qsize;
    }
    printf("\n\n");
}

int main() {
    int q[Qsize], front = 0, rear = -1, options, value;
    while(1) {
        printf("\n1.enqueue()\n2.dqueue()\n3.display()\n4.Exit\n");
        printf("Option:");
        scanf("%d", &options);
        switch (options)
        {
        case 1:
            printf("Enter the value:");
            scanf("%d", &value);
            enqueue(q, &rear, value);
            break;

        case 2:
            deque(q, &front);
            break;

        case 3:
            display(q, &front, &rear);
            break;

        case 4:
            exit(0);
        default:
            printf("Invalid option. Please try again.\n");
            break;
        }
    }
    return 0;
}
