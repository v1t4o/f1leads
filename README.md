# Task - F1Sales

As integrações podem falhar o que resulta em leads fora do sistema, por isso criamos scripts para colocar esses leads perdidos de volta.

# Instalação

```
    bin/setup
```

# Configuração

## API

- Na pasta 'config' há o arquivo 'apis.yml' que pode ser alterado, caso o endereço da API REST se altere

## Importação de CSV

- Copie o arquivo .csv com os leads na pasta 'tmp'
- Altere em 'config/path.yml' para o nome do arquivo correspondente

# Execução

```
    bin/run
```

# Testes

```
    rspec
```