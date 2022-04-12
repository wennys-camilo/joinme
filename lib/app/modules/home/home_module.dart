import 'presentation/home_page.dart';
import 'submodules/event_page/presentation/event_page.dart';
import 'submodules/profile/presentation/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/home_store.dart';
import 'presentation/tab_page.dart';

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
        ChildRoute('/eventPage', child: (context, args) => const EventPage()),
      ],
    ),
  ];
}
