import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/stores/login_store.dart';

import 'presentation/pages/login_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginPage()),
  ];
}
