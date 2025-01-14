import 'package:get_started_boilerplate/features/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

class {{name.pascalCase()}}RespositoriesImpl extends {{name.pascalCase()}}Respository {
  final {{name.pascalCase()}}Datasource {{name.camelCase()}}Datasource;
  const {{name.pascalCase()}}RespositoriesImpl(this.{{name.camelCase()}}Datasource);
}