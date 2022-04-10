import 'package:camp_final/app/modules/home/submodules/events/pages/add_events/teste.dart';
import 'package:camp_final/app/shared/presentation/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../../shared/presentation/themes/app_theme.dart';
import '../../../../../../shared/presentation/widgets/input_text_widget.dart';
import 'add_event_store.dart';
import 'widgets/drop_down_widget.dart';
import 'widgets/input_time_widget.dart';
import 'widgets/intput_date_widget.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({Key? key}) : super(key: key);

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  late final AddEventStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<AddEventStore>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Criar novo evento',
            style: TextStyle(color: AppTheme.colors.primary),
          ),
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: AppTheme.colors.primary),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const InputTextWidget(
                ontopHint: 'Nome do evento',
              ),
              const InputTextWidget(
                ontopHint: 'CPF do organizador',
              ),
              DropDownWidget(
                onTopHint: "Categoria do evento:",
                labelText: 'Selecionar a categoria',
                labelStyle: TextStyle(color: AppTheme.colors.primary),
              ),
              DropDownWidget(
                onTopHint: "Modalidade:",
                labelText: 'Seleciona a a modalidade',
                labelStyle: TextStyle(color: AppTheme.colors.primary),
              ),
              InputDateWidget(
                onTopHint: 'Data:',
                onChanged: (value) {},
              ),
              InputTimeWidget(
                onTopHint: 'Horário Inicio',
                onChanged: (value) {},
              ),
              InputTimeWidget(
                onTopHint: 'Horário Término',
                onChanged: (value) {},
              ),
              DropDownWidget(
                onTopHint: "Pet Friendly:",
                labelText: 'É pet Friendly ?',
                labelStyle: TextStyle(color: AppTheme.colors.primary),
                items: const [
                  DropdownMenuItem(
                    child: Text('Não'),
                    value: 0,
                  ),
                  DropdownMenuItem(
                    child: Text('Sim'),
                    value: 1,
                  ),
                ],
                onChanged: (value) => store.onChangeisPetFriendly(value),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                child: Column(
                  children: [
                    const Text(
                      'Evento acessível a pessoas com deficiência?',
                      style: TextStyle(fontSize: 18),
                    ),
                    FormBuilderFilterChip(
                      padding: const EdgeInsets.all(10),
                      spacing: 3,
                      selectedColor: AppTheme.colors.primary.withOpacity(0.9),
                      checkmarkColor: AppTheme.colors.white,
                      backgroundColor: AppTheme.colors.black.withOpacity(0.5),
                      name: 'choice_chip',
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      options: store.state.teste
                          .map<FormBuilderFieldOption<Teste>>((value) {
                        return FormBuilderFieldOption<Teste>(
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
                        //TODO: TERMINAR
                      },
                    ),
                  ],
                ),
              ),
              const InputTextWidget(
                ontopHint: 'Descrição do evento',
                height: 5 * 24.0,
                maxLines: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: RoundedButtonWidget(
                  onPressed: () {},
                  textButton: 'Criar evento e Publicar',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//  