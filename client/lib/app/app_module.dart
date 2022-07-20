import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/items/items_module.dart';
import 'splash_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    // ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ChildRoute('/', child: ((context, args) => const SplashPage())),
    // ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/items', module: ItemsModule()),
    WildcardRoute(
        child: (_, __) => const Scaffold(
              body: Center(child: Text("A página não existe!")),
            )),
  ];
}
