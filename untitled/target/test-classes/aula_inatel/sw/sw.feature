Feature: Testando API Star Wars

  Scenario: testando retorno people /2/
    Given url "https://swapi.dev/api/people/2/"
    When method get
    Then status 200

  Scenario: testando retorno people /2/1234
    Given url "https://swapi.dev/api/people/2/1234"
    When method get
    Then status 404