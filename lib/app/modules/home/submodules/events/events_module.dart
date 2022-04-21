import 'pages/add_events/add_event_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pages/add_events/add_event_store.dart';

class EventsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AddEventStore(i.get(), i.get(), i.get(), i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AddEventPage()),
  ];
}
