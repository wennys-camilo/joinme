1. Modularização
2. Clean Dart
3. Injeção de dependência
4. Local Storage

## Principais Packages
Gerenciamento de estado - Triple Builder

Modularização e Injeção de dependências - Modular

Client - Dio

Local - Flutter Secure Storage

Dartz - 
Utilizado para o tratamento de exceções com o Either do Dartz retornamos dois tipos de objetos uma falha e um objeto de sucesso que pode ser uma lista por exemplo.

Ao utilizar um usecase utilizamos o fold para obter os retornos (Falha e Sucesso):

```dart
final response = fetchAllEventsUsecase();
   response.fold((failure){
   //TODO: FALHA 
   }, (result) {
   //TODO: SUCESSO
  });

```


<img height="480px" src="assets/screenshots/1.png"> <img height="480px" src="assets/screenshots/01board.gif"/> <img height="480px" src="assets/screenshots/2.png"> <img height="480px" src="assets/screenshots/3.png"> <img height="480px" src="assets/screenshots/4.png"><img height="480px" src="assets/screenshots/signup.gif"> <img height="480px" src="assets/screenshots/5.png"> <img height="480px" src="assets/screenshots/24.jpeg"><img height="480px" src="assets/screenshots/23.jpeg"><img height="480px" src="assets/screenshots/6.png"> <img height="480px" src="assets/screenshots/home.gif"><img height="480px" src="assets/screenshots/7.png"> <img height="480px" src="assets/screenshots/8.png"> <img height="480px" src="assets/screenshots/9.png"> <img height="480px" src="assets/screenshots/10.png"> <img height="480px" src="assets/screenshots/11.png"> <img height="480px" src="assets/screenshots/12.png"> <img height="480px" src="assets/screenshots/13.png"><img height="480px" src="assets/screenshots/14.png"><img height="480px" src="assets/screenshots/15.png"><img height="480px" src="assets/screenshots/16.png"><img height="480px" src="assets/screenshots/17.png"><img height="480px" src="assets/screenshots/18.png"><img height="480px" src="assets/screenshots/19.png"><img height="480px" src="assets/screenshots/20.png"><img height="480px" src="assets/screenshots/21.png"><img height="480px" src="assets/screenshots/22.png">
