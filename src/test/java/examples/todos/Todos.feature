Feature:Karate Basic Todos

Background: 
    * url 'http://localhost:8080/api/todos'

Scenario: Get all todos
       #Get all todos 
       When method GET
       Then status 200
       
Scenario: Basic todo flow

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

    # Get a single Todo
    Given path id
    When method Get
    Then status 200
    And match response == {id: '#(id)', title: '#(taskName)', complete: false}

    #Create a second todo
    * def todo =
    """
         { 
            "title": 'Second',
            "complete": false
         }
    """
    Given request todo
    And header Content-Type = "application/json"
    When method POST
    Then status 200
    And match response.title == 'Second'

    #Get all todos 
    When method GET
    Then status 200
    * def firstTask = response[0]
    * match firstTask.title == taskName
    * match firstTask.complete == false    

    #check all response objects
    * match each response contains { complete : '#boolean'}

    * call read('classpath:helpers/ResetTodos.feature')


    

    
    