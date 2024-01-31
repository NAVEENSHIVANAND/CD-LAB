#include <stdio.h>
#include <string.h>

#define SUCCESS 1
#define FAILED 0

char *cursor;
char string[64];

int A()
{
    if (*cursor == 'a')
    {
        cursor++;
        if ((*cursor) == 'b')
        {
            cursor++;
            printf("%-16s A -> ab\n", cursor);
        }
        else
        {
            printf("%-16s A -> a\n", cursor);
        }

        return SUCCESS;
    }
    else
    {
        return FAILED;
    }
}

int S()
{
    printf("%-16s S -> cAd\n", cursor);

    if (*cursor == 'c')
    {
        cursor++;
        if (A())
        {
            if (*cursor == 'd')
            {
                printf("%-16s S -> cAd\n", "EOF");
                cursor++;
                return SUCCESS;
            }
            else
            {
                return FAILED;
            }
        }
        else
        {
            return FAILED;
        }
    }
    else
    {
        return FAILED;
    }
}

int main()
{
    printf("Enter the string: ");
    scanf("%s", string);
    cursor = string;
    puts("");
    puts("Input          Action");
    puts("--------------------------------");

    if (S() && *cursor == '\0')
    {
        puts("--------------------------------");
        puts("String is successfully parsed");
        return 0;
    }
    else
    {
        puts("--------------------------------");
        puts("Error in parsing String");
        return 1;
    }
}
