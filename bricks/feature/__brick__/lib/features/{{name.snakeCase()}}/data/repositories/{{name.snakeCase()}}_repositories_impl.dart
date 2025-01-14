import 'package:get_started_boilerplate/features/{{name.snakeCase()}}/data/datasources/remote/{{name.snakeCase()}}_datasource.dart';
import 'package:get_started_boilerplate/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

///implements [{{name.pascalCase()}}Repository] signature here
class {{name.pascalCase()}}RepositoriesImpl extends {{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}Datasource {{name.camelCase()}}Datasource;
  {{name.pascalCase()}}RepositoriesImpl(this.{{name.camelCase()}}Datasource);
}