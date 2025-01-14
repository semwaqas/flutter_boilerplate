import 'package:get_started_boilerplate/features/{{name.snakeCase()}}/data/datasources/remote/{{name.snakeCase()}}_datasource.dart';

///declaration of all api events here
abstract class {{name.pascalCase()}}DatasourceImpl extends {{name.pascalCase()}}Datasource {
  const {{name.pascalCase()}}DatasourceImpl();
}