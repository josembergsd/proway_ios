
# 📱 Desafio: Aplicativo de Cadastro de Endereços

## 🎯 Objetivo

Desenvolver um aplicativo utilizando **SwiftUI**, com o objetivo de realizar o cadastro e o gerenciamento de endereços a partir de uma consulta de CEP.

A aplicação deverá permitir cadastrar, listar e remover registros, utilizando o padrão arquitetural **MVVM (Model-View-ViewModel)**.

## 📋 Requisitos funcionais

### 1. Cadastro de endereço

O aplicativo deverá disponibilizar uma tela para cadastro de um novo endereço, contendo os seguintes campos:

- **Nome:** informado manualmente pelo usuário.
- **CEP:** informado manualmente pelo usuário.
- **Estado:** preenchido automaticamente após a consulta do CEP.
- **Cidade:** preenchida automaticamente após a consulta do CEP.
- **Bairro:** preenchido automaticamente após a consulta do CEP.
- **Logradouro:** preenchido automaticamente após a consulta do CEP.
- **Número:** informado manualmente pelo usuário.

**Comportamento esperado:**

1. O usuário deverá informar seu nome.
2. O usuário deverá informar um CEP válido.
3. Após informar o CEP, o aplicativo deverá consultar um serviço de busca de CEP.
4. Os campos de estado, cidade, bairro e logradouro deverão ser preenchidos automaticamente.
5. O usuário deverá informar manualmente o número do endereço.
6. O aplicativo deverá permitir salvar o registro.

### 2. Listagem de endereços

O aplicativo deverá possuir uma tela para visualizar os endereços cadastrados.

A listagem deverá apresentar, no mínimo:

- Nome.
- CEP.
- Logradouro.
- Número.
- Bairro.
- Cidade.
- Estado.

### 3. Remoção de registros

O usuário deverá conseguir remover um endereço previamente cadastrado.

A remoção deverá atualizar a listagem, refletindo imediatamente a exclusão do registro.

## 🏗️ Requisitos técnicos

O desenvolvimento deverá seguir os seguintes requisitos:

- **Linguagem:** Swift.
- **Interface:** SwiftUI.
- **Arquitetura:** MVVM (Model-View-ViewModel).
- **Consulta de CEP:** integração com uma API de consulta de CEP, como a [ViaCEP](https://viacep.com.br/).
- **Organização:** separar as responsabilidades entre Model, View e ViewModel.

## ⭐ Desafio extra: Persistência de dados

Como desafio adicional, implemente uma camada de persistência utilizando **SwiftData**.

O objetivo é permitir que os endereços cadastrados permaneçam armazenados no dispositivo, mesmo após o encerramento do aplicativo.

Com a implementação da persistência, espera-se que:

- Os registros sejam armazenados localmente.
- Os registros permaneçam disponíveis ao reabrir o aplicativo.
- A listagem apresente os dados persistidos.
- A remoção de um registro também seja refletida na base de dados local.

## 📦 Entrega

O projeto deverá ser entregue em um repositório Git (GitHub), contendo:

- Código-fonte completo do aplicativo.
- Arquivo README.md com as informações do projeto.
- Instruções básicas para executar a aplicação.

## 🚀 Boa sorte!

O objetivo desta atividade é colocar em prática os conhecimentos de desenvolvimento iOS com SwiftUI, consumo de APIs, organização arquitetural com MVVM e, como diferencial, persistência de dados com SwiftData.

Capriche na organização do código e na experiência do usuário!


<img src="https://raw.githubusercontent.com/ralfslima/ios_capgemini/main/Aula%2035/img1.png" width="600">
<img src="https://raw.githubusercontent.com/ralfslima/ios_capgemini/main/Aula%2035/img2.png" width="600">
<img src="https://raw.githubusercontent.com/ralfslima/ios_capgemini/main/Aula%2035/img3.png" width="600">
