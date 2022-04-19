import 'presentation/saved_page.dart';
import 'presentation/saved_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SavedModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => SavedStore(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SavedPage()),
  ];
}
