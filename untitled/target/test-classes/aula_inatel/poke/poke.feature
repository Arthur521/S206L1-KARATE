Feature: Testando API Pokemon
        Background: Executa antes de cada teste
                * def url_base = 'https://pokeapi.co/api/v2/'

        Scenario: Testando retorno
                Given url 'https://pokeapi.co/api/v2/pokemon/charmander'
                When method get
                Then status 200

        Scenario: Testando retorno people/1/ com informações inválidas.
                Given url 'https://pokeapi.co/api/v2/pokemon/galo'
                When method get
                Then status 404

        Scenario: Testando retorno pikachu e verificando o JSON.
                Given url url_base
                And path '/pokemon/charizard'
                When method get
                Then status 200
                And match response.name == "charizard"
                And match response.id == 6

        Scenario: Testando retorno pokemon Rede entrando em um dos elementos
                Given url url_base
                And path '/version/10/'
                When method get
                Then status 200
                And def idioma = $.names[3].language.url
                And print idioma
                And url idioma
                When method get
                Then status 200
                And match response.name == "fr"
                And match response.id == 5
