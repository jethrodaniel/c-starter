Feature: __program__

  Background:
    When I run `__program__` interactively

  Scenario: entering input
    When I type "y"
    Then the output should contain:
    """
    Life is a garden - do you dig it? (y/n) :
    This guy digs it!
    """
    And the exit status should be 0
