import 'package:camp_final/app/modules/home/presentation/home_page.dart';
import 'package:camp_final/app/modules/home/submodules/profile/presentation/profile_page.dart';

import '../../shared/presentation/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/home_store.dart';
import 'presentation/tab_page..dart';

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
      '/',
      child: (_, args) => const TabPage(),
      children: [
        ChildRoute('/homePage', child: (context, args) => const HomePage()),
        ChildRoute('/perfil',
            child: (context, args) => const Center(child: Text('2'))),
        ChildRoute('/profile', child: (context, args) => const ProfilePage()),
      ],
    ),
  ];
}
