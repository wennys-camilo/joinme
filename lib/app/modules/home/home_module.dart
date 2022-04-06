import '../../shared/presentation/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/home_store.dart';
import 'presentation/home_page.dart';

class ModuleTeste extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => const Scaffold(
              backgroundColor: Colors.blue,
            )),
  ];
}

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const HomePage(),
      children: [
        ChildRoute('/perfil2',
            child: (context, args) => Container(color: AppTheme.colors.white)),
        // ModuleRoute('/teste', module: ModuleTeste())
      ],
    ),
  ];
}
