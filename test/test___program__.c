#include <stddef.h>
#include "Unity/src/unity.h"

#include "../src/__program__.h"

void setUp(void)
{
}

void tearDown(void)
{
}

void test_hello(void)
{
   TEST_ASSERT_EQUAL_STRING("Hello, world!\n", hello());
}

int main(void)
{
   UnityBegin("test/test___program__.c");

   RUN_TEST(test_hello);

   UnityEnd();

   return 0;
}
