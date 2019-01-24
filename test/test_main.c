#include <stddef.h>
#include "Unity/src/unity.h"
#include "../src/dig.h"

void setUp(void)
{
}

void tearDown(void)
{
}

void test_dig(void)
{
   TEST_ASSERT_EQUAL_STRING("Life's a garden, dig it.", dig());
}

int main(void)
{
   UnityBegin("test/test_main.c");

   RUN_TEST(test_dig);

   UnityEnd();

   return 0;
}
