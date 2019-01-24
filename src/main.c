#include <stdio.h>
#include <stdbool.h>

#include "dig.h"

static char choice;

bool prompt_until_yes(char *question)
{
  while (choice != 'y') {
    printf("%s (y/n) :", question);
    scanf("%s", &choice);
    printf("\n");

    if (choice == 'y') {
      printf("This guy digs it!\n");
      return true;
    } else
      printf("Wrong!\n");
  }
}

int main(int argc, char **argv)
{
  // The `(void)param` notation is used to ignore the unused variable warning
  (void)argc;
  (void)argv;

  prompt_until_yes("Life is a garden - do you dig it?");
}
