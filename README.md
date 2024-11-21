# **Projeto CurrencyExchange**

## **Visão Geral**
O **CurrencyExchange** é um projeto simples de iOS criado para demonstrar o uso da biblioteca **Alamofire** para requisições HTTP e trabalhar com a [API de Moedas da AwesomeAPI](https://docs.awesomeapi.com.br/api-de-moedas). O principal objetivo do projeto é **aprender e praticar testes com mocks**, promovendo uma melhor compreensão de como implementar testes unitários em Swift.

---

## **Funcionalidades**
- Realiza consultas de taxas de câmbio em tempo real usando a [API de Moedas da AwesomeAPI](https://docs.awesomeapi.com.br/api-de-moedas).
- Utiliza a biblioteca **Alamofire** para requisições de rede eficientes.
- Apresenta testes unitários utilizando o framework XCTest.
- Implementa um mock para simular respostas da API durante os testes:
  - Respostas simuladas de sucesso.
  - Simulação de erros de rede.

---

## **Tecnologias Utilizadas**
- **Swift**: Linguagem de programação utilizada no desenvolvimento.
- **Alamofire**: Biblioteca poderosa para manipulação de redes em Swift.
  - Repositório oficial: [Alamofire no GitHub](https://github.com/Alamofire/Alamofire).
- **XCTest**: Framework para testes unitários em Swift.
- **AwesomeAPI**: API de câmbio utilizada.
  - Documentação da API: [AwesomeAPI Docs](https://docs.awesomeapi.com.br/api-de-moedas).

---

## **Estrutura do Projeto**
```
CurrencyExchange/
├── CurrencyService.swift          # Lida com as requisições à API usando Alamofire.
├── Currency.swift                 # Modelo que representa a resposta da API.
├── MockCurrencyService.swift      # Implementação mock do CurrencyService para testes.
├── CurrencyServiceTests.swift     # Testes unitários usando XCTest e mocks.
```

---

## **Como Funciona**
### **Funcionalidade Principal**
A classe `CurrencyService` se comunica com o endpoint da AwesomeAPI para buscar informações de câmbio de uma moeda específica. Utilizando o Alamofire, ela realiza uma requisição HTTP GET e processa a resposta no formato JSON.

### **Testando com Mocks**
Mocks são usados para simular o comportamento da API sem realizar chamadas reais. Com isso, é possível:
- Verificar como a aplicação responde a dados válidos.
- Garantir que o código trata erros adequadamente (como erros de rede ou requisições inválidas).

A classe `MockCurrencyService` sobrescreve o comportamento do serviço real:
- Pode retornar dados fictícios simulando sucesso.
- Pode simular erros para validar o tratamento de falhas.

---

## **Instruções de Configuração**
### Pré-Requisitos
- macOS com Xcode instalado.
- Swift 5 ou superior.

### Clonar o Repositório
```bash
git clone https://github.com/SeuUsuario/CurrencyExchange.git
cd CurrencyExchange
```

### Instalar Dependências
Este projeto utiliza o **Swift Package Manager (SPM)** para gerenciar dependências. Siga os passos abaixo para instalar o Alamofire:
1. Abra o projeto no Xcode.
2. Vá em **File > Add Packages**.
3. Insira o URL do repositório do Alamofire: `https://github.com/Alamofire/Alamofire`.
4. Adicione o pacote ao seu projeto.

### Rodar os Testes
1. Abra o projeto no Xcode.
2. Selecione **Product > Test** ou pressione `Cmd + U` para executar os testes.

---

## **Referência da API**
### **Exemplo de Endpoint**
Para buscar informações de câmbio na AwesomeAPI:
- **URL**: `https://economia.awesomeapi.com.br/json/USD-BRL`
- **Exemplo de Resposta**:
```json
{
  "code": "USD",
  "codein": "BRL",
  "name": "Dólar Americano",
  "bid": "5.30"
}
```

---

## **Objetivos de Aprendizado**
1. Compreender o básico de redes no iOS utilizando Alamofire.
2. Aprender a escrever testes unitários com o XCTest.
3. Experimentar o uso de mocks para simular comportamentos de APIs.
4. Explorar boas práticas para estruturação e testes de aplicativos iOS.

---
