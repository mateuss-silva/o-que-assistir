import 'package:flutter_modular/flutter_modular.dart';
import 'package:o_que_assistir/app/features/auth/auth_module.dart';
import 'package:o_que_assistir/app/features/home/home_module.dart';


class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
    ModuleRoute('/auth', module: AuthModule()),
    
  ];

}