# language: pt

Funcionalidade: Login

Como um usuário regular do sistema, eu quero poder fazer Login
Para que eu possa acessar minhas informações e também os recursos exclusivos do sistema.

Contexto:

    Dado que acesso a pagina de login

Cenario: Login do usuário

    Quando submeto minhas credenciais:
        | userName  | qa        |
        | password  | xperience |
    Então sou autenticado no sistema

Esquema do Cenário: Tentativa de fazer login

    Quando submeto minhas credenciais:
        | userName  | <usuario>  |
        | password  | <senha>    |
    Então devo ver a notificação "<mensagem>"

    Exemplos:
    | usuario |     senha    |            mensagem             |
    |  qa     |     1234     | Oops! Credenciais inválidas :(  |
    |  qax    |   xperience  | Oops! Credenciais inválidas :(  |
    |         |   xperience  | Informe o seu nome de usuário!  |
    |   qa    |              | Informe a sua senha secreta!    |