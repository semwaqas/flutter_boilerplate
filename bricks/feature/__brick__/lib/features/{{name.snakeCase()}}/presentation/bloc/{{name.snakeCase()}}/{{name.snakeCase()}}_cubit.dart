import 'package:flutter_bloc/flutter_bloc.dart';
import '{{name.snakeCase()}}_cubit_state.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}CubitState> {
  ///call all use cases here and then initialize them in constructor
  {{name.pascalCase()}}Cubit() : super(InitialState()) {}
}