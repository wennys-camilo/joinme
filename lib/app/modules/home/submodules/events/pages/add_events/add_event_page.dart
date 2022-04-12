import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:validatorless/validatorless.dart';
import '../../../../../../shared/presentation/themes/app_theme.dart';
import '../../../../../../shared/presentation/widgets/input_text_widget.dart';
import '../../../../../../shared/presentation/widgets/rounded_button_widget.dart';
import '../../domain/entities/accessibilities_entities.dart';
import '../../domain/entities/events_categories_entity.dart';
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
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    store = Modular.get<AddEventStore>();
    fetchCategoriesAndAccessibilities();
  }

  void fetchCategoriesAndAccessibilities() {
    Future.wait([
      store.accessibilities(),
      store.categories(),
    ]);
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
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                InputTextWidget(
                  labelText: 'Nome do evento',
                  validator: Validatorless.required('Campo Obrigatório'),
                  onChanged: (value) => store.onChangeName(value),
                ),
                InputTextWidget(
                  labelText: 'CPF ou CNPJ do organizador',
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfOuCnpjFormatter(),
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo Obrigatório';
                    }
                    if ((!UtilBrasilFields.isCPFValido(value)) ||
                        (!UtilBrasilFields.isCPFValido(value))) {
                      return 'CPF ou CNPJ invalido';
                    }
                    return null;
                  },
                  onChanged: (value) => store.onChangeName(value),
                ),
                TripleBuilder(
                    store: store,
                    builder: (context, trilpe) {
                      return DropDownWidget(
                        value: store.state.categories.first,
                        labelText: "Categoria do evento:",
                        labelStyle: TextStyle(color: AppTheme.colors.primary),
                        items: store.state.categories
                            .map<DropdownMenuItem<EventCategorieEntity>>(
                                (value) {
                          return DropdownMenuItem<EventCategorieEntity>(
                            value: value,
                            child: Text(
                              value.name,
                              style: TextStyle(
                                  color: value.id == "001"
                                      ? AppTheme.colors.primary
                                      : AppTheme.colors.black),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) => store.onChangeCategorie(value),
                        validator: (value) {
                          print(store.state.selectedCategorie!.id);
                          if (store.state.selectedCategorie!.id == "001") {
                            return 'Selecione uma categoria';
                          }
                          return null;
                        },
                      );
                    }),
                DropDownWidget(
                  labelText: "Modalidade:",
                  labelStyle: TextStyle(color: AppTheme.colors.primary),
                  value: store.state.isOnline,
                  items: const [
                    DropdownMenuItem(
                      value: false,
                      child: Text('Presencial'),
                    ),
                    DropdownMenuItem(
                      value: true,
                      child: Text('Online'),
                    ),
                  ],
                  onChanged: (value) => store.onChangemodalityEvent(value),
                ),
                TripleBuilder(
                  store: store,
                  builder: (context, triple) {
                    if (store.state.isOnline) {
                      return InputTextWidget(
                        labelText: 'Link',
                        hintText: 'https://linkdoevento.com.br',
                        onChanged: (value) {},
                        validator: Validatorless.required('Campo obrigatório'),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                InputTextWidget(
                  labelText: 'Máximo de participantes: ',
                  suffixText: 'Participantes',
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(6),
                  ],
                  validator: Validatorless.required('Campo Obrigatório'),
                ),
                InputTextWidget(
                  prefixText: "R\$ ",
                  labelText: 'Preço: ',
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CentavosInputFormatter()
                  ],
                ),
                InputDateWidget(
                  labelText: 'Data:',
                  onChanged: (value) {},
                ),
                InputTimeWidget(
                  labelText: 'Horário Inicio',
                  onChanged: (value) {},
                  validator: Validatorless.required('Campo Obrigatório'),
                ),
                InputTimeWidget(
                  labelText: 'Horário Término',
                  onChanged: (value) {},
                ),
                DropDownWidget(
                  labelText: "Pet Friendly:",
                  value: store.state.isPetFriendly,
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
                      TripleBuilder(
                        store: store,
                        builder: (context, triple) {
                          return FormBuilderFilterChip(
                            padding: const EdgeInsets.all(10),
                            spacing: 3,
                            selectedColor:
                                AppTheme.colors.primary.withOpacity(0.9),
                            checkmarkColor: AppTheme.colors.white,
                            backgroundColor:
                                AppTheme.colors.black.withOpacity(0.5),
                            name: 'choice_chip',
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            options: store.state.accessibilities.map<
                                FormBuilderFieldOption<
                                    AccessibilitiesEntity>>((value) {
                              return FormBuilderFieldOption<
                                  AccessibilitiesEntity>(
                                value: value,
                                child: Text(
                                  value.name.replaceAll("Deficiência", ""),
                                  style: TextStyle(
                                    color: AppTheme.colors.white,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              store.onChangeSelectedsAccessibilities(
                                  value as List<AccessibilitiesEntity>);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                InputTextWidget(
                  labelText: 'Descrição do evento',
                  height: 5 * 24.0,
                  maxLines: 5,
                  validator: Validatorless.required('Campo Obrigatório'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: RoundedButtonWidget(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    textButton: 'Criar evento e Publicar',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//  