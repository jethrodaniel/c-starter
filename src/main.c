#include <stdio.h>

#include "dig.h"

int main(int argc, char **argv)
{
  // The `(void)param` notation is used to ignore the unused variable warning
  (void)argc;
  (void)argv;

  printf("%s\n", dig());
}
