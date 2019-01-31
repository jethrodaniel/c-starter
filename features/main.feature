Feature: __program__

  Background:
    When I run `build/main`

  Scenario: entering input
    Then the output should contain:
    """
    Hello, world!
    """
    And the exit status should be 0
