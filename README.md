## CNAB Blu 🔵
![Ruby](https://github.com/mouradev/desafio-back-end/workflows/Ruby/badge.svg?branch=master)

Eu utilizei Ruby com [Sinatra](http://sinatrarb.com) e [Corneal](https://github.com/thebrianemory/corneal) para fazer este desafio, a aplicação está pronta para rodar com Docker, mas caso não tenha docker instalado, [Leia as instruções para rodar sem Docker](https://github.com/mouradev/desafio-back-end/blob/master/no-docker-readme.md).

### Rodando a aplicação com Docker :rocket::whale2:

- Para rodar as migrations antes de subir a aplicação:
    > Este comando só precisa ser executado na primeira inicialização

    ```
    docker-compose run --rm ruby rake db:migrate
    ```

- Após isso, basta rodar a aplicação com docker-compose:

    ```
    docker-compose up
    ```

- Agora é só acessar http://localhost:3000.

### Rodar os testes 🧪

- Rodar as migrations no ambiente de teste:

    > Este comando só precisa ser executado uma vez também

    ```
    docker-compose run --rm ruby rake db:migrate SINATRA_ENV=test
    ```

- Executar os testes:

    ```
    docker-compose run --rm ruby rspec -fd
    ```
