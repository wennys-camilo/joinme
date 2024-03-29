import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../../../../shared/presentation/pages/reload_error_page.dart';
import '../../../../../shared/presentation/themes/app_theme.dart';
import '../../../presentation/widgets/event_item_card_tile.dart';
import 'saved_store.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends ModularState<SavedPage, SavedStore> {
  @override
  void initState() {
    super.initState();
    store.fetchSaveds();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder(
      store: store,
      onState: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Eventos Salvos',
              style: TextStyle(
                  color: AppTheme.colors.black, fontWeight: FontWeight.bold),
            ),
            backgroundColor: AppTheme.colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0,
          ),
          body: store.state.attendes.isNotEmpty
              ? TripleBuilder(
                  store: store,
                  builder: (context, triple) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: store.state.attendes.length,
                      itemBuilder: (BuildContext context, int index) {
                        var event = store.state.attendes[index].event;
                        return GestureDetector(
                          onTap: () {
                            Modular.to
                                .pushNamed('/home/eventPage', arguments: event);
                          },
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.26,
                            child: EventItemCardTile(
                              event: event!,
                              favorite: true,
                            ),
                          ),
                        );
                      },
                    );
                  })
              : const Center(
                  child: Text(
                    'Você não possui eventos salvos',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
        );
      },
      onLoading: (context) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      onError: (context, error) {
        return ReloadErrorPage(
          message: 'Falha ao carregar eventos salvos',
          action: () async => await store.fetchSaveds(),
        );
      },
    );
  }
}
