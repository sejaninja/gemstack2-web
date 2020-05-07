#language:pt

Funcionalidade: Login
    Para que eu possa gerenciar os jogos do meu catálogo NinjaPixel
    Sendo um Administrador de catálogo
    Posso acessar o sistema com meu e-mail e senha

    Contexto:
        Dado que acesso à página principal

    @smoke
    Cenario: Acessar o portal

        Quando eu submeto minhas credenciais "papito@ninjapixel.com" e "pwd123"
        Então devo ser autenticado

    Esquema do Cenario: Tentar logar

        Quando eu submeto minhas credenciais "<email>" e "<senha>"
        Então devo ver uma mensagem de alerta "<texto>"

        Exemplos:
            | email                 | senha  | texto                        |
            | papito@ninjapixel.com | abc123 | Usuário e/ou senha inválidos |
            | 404@gmail.com         | abc123 | Usuário e/ou senha inválidos |
            |                       | abc123 | Opps. Informe o seu email!   |
            | papito@ninjapixel.com |        | Opps. Informe a sua senha!   |
