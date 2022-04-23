import 'package:flutter_modular/flutter_modular.dart';
import 'profile_page.dart';
import 'profile_store.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => ProfileStore(i.get(), i.get(), i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ProfilePage()),
  ];
}
