Feature: Testando API GoRest
        Background: Executa antes de cada teste
                * def url_base = 'https://gorest.co.in/public/v2/'
                * def token = '223fb9fdd58029e44ca200e8ad671d1be0f119463f931897ca9403474baeff2c'
                * header Authorization = 'Bearer ' + token

        Scenario: Testando retorno
                Given url 'https://gorest.co.in/public/v2/posts/87749'
                When method get
                Then status 200

        Scenario: Testando retorno com informações inválidas. (Negativo)
                Given url 'https://gorest.co.in/public/v2/users/0'
                When method get
                Then status 404

        Scenario: Pegando elementos do array de response e testando seu tipo
                Given url url_base
                And path '/comments'
                When method get
                Then status 200
                And match $ == '#[]'
                And match $ == '#[10]'
                And match each $ contains {post_id: '#number', name: '#string', email: '#string'}

        Scenario: Criando um novo elemento usando o método POST
                Given url url_base
                And path '/posts'
                And request {title: 'teste de titulo', body: 'teste de body', user_id: 5808961}
                When method post
                Then status 201
                And match $.id == 87806
                And match $.title == '#string'
                And match $.body == '#string'
                And match $.user_id == '#number'
                #org.opentest4j.AssertionFailedError: match failed: EQUALS
                #$ | not equal (NUMBER:NUMBER)
                #87810 <-- |Troque o valor de $.id por esse valor e some com 1 ou 2 quando o código rodar, uma vez que|
                #87806     |esse post já foi feito, então é necessário trocar o valor do id do post para ser o último|

        Scenario: Testando retorno e verificando o JSON.
                Given url url_base
                And path '/posts/87749'
                When method get
                Then status 200
                And match response.title == "Complectus eius vesco acceptus vinculum."
                And match response.body == "Veritas sunt aperiam. Cicuta eligendi conduco. Aperio antepono sufficio. Acidus alter eum. Alii voveo fugiat. Ager et qui. Adficio spero earum. Acies maxime suscipio. Nobis solus vero. Arceo venio quasi. Ceno contra vulpes. Decimus vomica verumtamen. Civis nobis concido."