import 'package:get_started_boilerplate/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

///use case is a feature or scenario
///let's suppose you have to login then the use case will be LoginUseCase
///each use case perform only relevant functionality
class {{name.pascalCase()}}UseCase {
  {{name.pascalCase()}}Repository _{{name.camelCase()}}Repository;
  {{name.pascalCase()}}UseCase(this._{{name.camelCase()}}Repository);

  ///uncomment this when implementing call
  // Future<return type> call() {
  //  return _{{name.camelCase()}}Repository.someFunctionality();
  // }
}