Feature: Second Feature File for Todos

Background:
    * url apiUrl

Scenario: Update an Delete todos

    * def taskName = 'FirsTask'
    # Create a single todo
    Given request { title: '#(taskName)', complete: false}
    When method POST
    Then status 200
    And match response == { id:'#string', title: '#(taskName)', complete: false}
    * def id = response.id
    * def title = response.title
    * def status = response.complete
    * print "Value of ID: " + id 

     # Update a todo
     Given path id
     And request { title: 'First', complete: true}
     When method PUT
     Then status 200
     And match response.complete == true
 
     #Delete a todo
     Given path id
     When method DELETE
     Then status 200
 
