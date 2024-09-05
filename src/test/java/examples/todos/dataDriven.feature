@debug
Feature: Data driven testing example

  Background:
    * url apiUrl
    * def sleep = function(pause) {java.lang.Thread.sleep(pause * 1000)}

  Scenario Outline:
    * request {title: '#(title)', complete: false}
    * method POST
    * match response == { id: '#string', title: '#(title)', complete: false}
    * status 200
    * print "Finished iteration: " + iteration
    * sleep(5)
    Examples:
      |title| iteration|
      |one    | 1     |
      |two    | 2     |
      |three  | 3     |