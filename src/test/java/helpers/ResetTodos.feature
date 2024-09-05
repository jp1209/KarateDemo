Feature: helper to reset all todos

Scenario: Reset alll todos
    #Clear all tasks
    Given url 'http://localhost:8080/api/reset'
    When method GET
    Then status 200
    And match response == { deleted: '#number'}
    * def numberDeleted = response.deleted
    * print "Number of todos deleted: " + numberDeleted
