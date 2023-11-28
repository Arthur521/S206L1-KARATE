Feature: Testando API Rick and Morty
        Background: Executa antes de cada teste
                * def url_base = 'https://rickandmortyapi.com/api/'

        Scenario: Testando retorno
                Given url 'https://rickandmortyapi.com/api/character/3'
                When method get
                Then status 200

        Scenario: Testando retorno com informações inválidas (negativo)
                Given url 'https://rickandmortyapi.com/api/character/1000'
                When method get
                Then status 404

        Scenario: Testando retorno e verificando o JSON
                Given url url_base
                And path '/character/1'
                When method get
                Then status 200
                And match response.name == "Rick Sanchez"
                And match response.id == 1

        Scenario: Testando retorno de dados da localização
                Given url url_base
                And path '/location/1'
                When method get
                And def residente = response.residents[1]
                And match residente == "https://rickandmortyapi.com/api/character/45"
                Then status 200

        Scenario: Testando retorno de dados da localização (negativo)
                Given url url_base
                And path '/location/300'
                When method get
                Then status 404

        Scenario: Testando retorno de dados de episódio
                Given url url_base
                And path '/episode/3'
                When method get
                And def personagem = response.characters[2]
                And match personagem == "https://rickandmortyapi.com/api/character/12"
                Then status 200