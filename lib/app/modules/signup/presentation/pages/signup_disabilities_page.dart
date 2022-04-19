import 'package:camp_final/app/modules/signup/presentation/pages/signup_store.dart';
import 'package:camp_final/app/shared/domain/entites/disabilities_enity.dart';
import 'package:camp_final/app/shared/presentation/themes/app_theme.dart';
import 'package:camp_final/app/shared/presentation/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class DisabilitiesPage extends StatefulWidget {
  const DisabilitiesPage({Key? key}) : super(key: key);

  @override
  State<DisabilitiesPage> createState() => _DisabilitiesPageState();
}

class _DisabilitiesPageState extends State<DisabilitiesPage> {
  late final SignupStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<SignupStore>();
    store.fetchDisabilities();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScopedBuilder(
        store: store,
        onState: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Deseja informar se possui algum tipo de deficiência? Se sim, qual destas?',
                    style: TextStyle(
                      color: AppTheme.colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: FormBuilderFilterChip(
                    padding: const EdgeInsets.all(10),
                    spacing: 20,
                    runAlignment: WrapAlignment.center,
                    alignment: WrapAlignment.center,
                    shape: StadiumBorder(
                        side: BorderSide(color: AppTheme.colors.primary)),
                    selectedColor: AppTheme.colors.pink,
                    checkmarkColor: AppTheme.colors.white,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    backgroundColor: AppTheme.colors.pink.withOpacity(0.5),
                    name: 'choice_chip',
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    options: store.state.disabilitiesList
                        .map<FormBuilderFieldOption<DisabilitiesEntity>>(
                            (value) {
                      return FormBuilderFieldOption<DisabilitiesEntity>(
                        value: value,
                        child: Text(
                          value.name,
                          style: TextStyle(
                            color: AppTheme.colors.white,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      store.onChangeSelectedsDesabilities(
                          value as List<DisabilitiesEntity>);
                    },
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    height: 5,
                  ),
                ),
                RoundedButtonWidget(
                  width: MediaQuery.of(context).size.width * 0.9,
                  onPressed: () async {
                    await store.inserDisabilities();
                  },
                  textButton: 'CONFIRMAR',
                  styleText: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 20),
                  child: GestureDetector(
                    onTap: () => Modular.to.navigate('./phaseFive'),
                    child: const Text(
                      'PULAR',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        onLoading: (context) => const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        onError: (context, error) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: AppTheme.colors.primary,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Falha ao carregar '),
                  const SizedBox(
                    height: 20,
                  ),
                  RoundedButtonWidget(
                    onPressed: () => store.fetchDisabilities(),
                    textButton: 'TENTAR NOVAMENTE',
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
