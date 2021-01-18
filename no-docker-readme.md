
#### Rodando a aplicação sem Docker :rocket::gem:
- Utilizar versão 2.3.3 do Ruby

- Instalar as dependências com Bundler:
    ```
    bundle install
    ```

- Para rodar as migrations antes de subir a aplicação:
    > Este comando só precisa ser executado na primeira inicialização

    ```
    rake db:migrate
    ```

- Após isso, basta rodar a aplicação com docker-compose:

    ```
    shotgun --host=0.0.0.0 --port=3000
    ```

- Agora é só acessar http://localhost:3000

    - `rspec` para rodar os testes
        - `rake db:migrate SINATRA_ENV=test` para rodar as migrations no ambiente de teste
