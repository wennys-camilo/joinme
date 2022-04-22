import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:validatorless/validatorless.dart';
import '../../../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../../../shared/presentation/themes/app_theme.dart';
import '../../../../../../shared/presentation/widgets/input_text_widget.dart';
import '../../../../../../shared/presentation/widgets/rounded_button_widget.dart';
import '../../domain/entities/accessibilities_entities.dart';
import '../../domain/entities/events_categories_entity.dart';
import 'add_event_state.dart';
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
    store.observer(onState: ((state) {
      if (state.eventAddedSucess) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Evento adicionado com successo!'),
          backgroundColor: AppTheme.colors.green,
        ));
      }
    }), onError: (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.message),
        backgroundColor: AppTheme.colors.red,
      ));
    });
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
    return ScopedBuilder<AddEventStore, Failure, AddEventState>(
      store: store,
      onState: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Criar novo Evento',
                  style: TextStyle(
                      color: AppTheme.colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              backgroundColor: AppTheme.colors.transparent,
              automaticallyImplyLeading: false,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: TripleBuilder<AddEventStore, Failure, AddEventState>(
                    store: store,
                    builder: (context, triple) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InputTextWidget(
                            labelText: 'Nome do evento',
                            validator:
                                Validatorless.required('Campo Obrigatório'),
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
                              if ((!UtilBrasilFields.isCPFValido(value)) &&
                                  (!UtilBrasilFields.isCNPJValido(value))) {
                                return 'CPF ou CNPJ invalido';
                              }
                              return null;
                            },
                            onChanged: (value) =>
                                store.onChangeCpforCnpj(value),
                          ),
                          DropDownWidget(
                            value: triple.state.selectedCategorie,
                            labelText: triple.state.selectedCategorie?.id ==
                                    "CATEGORIA"
                                ? ""
                                : "Categoria do evento:",
                            labelStyle:
                                TextStyle(color: AppTheme.colors.primary),
                            items: triple.state.categories
                                .map<DropdownMenuItem<EventCategorieEntity>>(
                                    (value) {
                              return DropdownMenuItem<EventCategorieEntity>(
                                value: value,
                                child: Text(
                                  value.name,
                                  style: TextStyle(
                                    color: value.id == "CATEGORIA"
                                        ? AppTheme.colors.black.withOpacity(0.6)
                                        : AppTheme.colors.black,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) =>
                                store.onChangeCategorie(value),
                            validator: (value) {
                              if (triple.state.selectedCategorie?.id ==
                                  "CATEGORIA") {
                                return 'Selecione uma categoria';
                              }
                              return null;
                            },
                          ),
                          DropDownWidget(
                            labelText: "Modalidade:",
                            labelStyle:
                                TextStyle(color: AppTheme.colors.primary),
                            value: triple.state.isOnline,
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
                            onChanged: (value) =>
                                store.onChangemodalityEvent(value),
                          ),
                          DropDownWidget(
                            labelText: "Aceita animais de estimação?",
                            value: triple.state.isPetFriendly,
                            labelStyle:
                                TextStyle(color: AppTheme.colors.primary),
                            items: const [
                              DropdownMenuItem(
                                child: Text('Não'),
                                value: false,
                              ),
                              DropdownMenuItem(
                                child: Text('Sim'),
                                value: true,
                              ),
                            ],
                            onChanged: (value) =>
                                store.onChangeisPetFriendly(value),
                          ),
                          InputDateWidget(
                            labelText: 'Data:',
                            onChanged: (value) {
                              if (value != null) {
                                store.onChangeDate(value);
                              }
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Campo Obrigatório';
                              }
                              return null;
                            },
                          ),
                          InputTimeWidget(
                            labelText: 'Horário Inicio',
                            onChanged: (value) {
                              if (value != null) {
                                store.onChangeStartTime(value);
                              }
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Campo Obrigatório';
                              }
                              return null;
                            },
                          ),
                          InputTimeWidget(
                            labelText: 'Horário Término',
                            onChanged: (value) {
                              if (value != null) {
                                store.onChangeEndTime(value);
                              }
                            },
                          ),
                          InputTextWidget(
                              labelText: 'Número máximo de participantes: ',
                              suffixText: 'Participantes',
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(6),
                              ],
                              validator:
                                  Validatorless.required('Campo Obrigatório'),
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  store.onChangemMaxParticipants(value);
                                }
                              }),
                          triple.state.isOnline
                              ? InputTextWidget(
                                  labelText: 'URL do evento (online)',
                                  hintText: 'https://linkdoevento.com.br',
                                  onChanged: (value) =>
                                      store.onChangeUrl(value),
                                  validator: Validatorless.required(
                                      'Campo obrigatório'),
                                )
                              : Container(),
                          !triple.state.isOnline
                              ? Column(
                                  children: [
                                    InputTextWidget(
                                      paddding: const EdgeInsets.only(
                                          top: 8,
                                          bottom: 8,
                                          left: 30,
                                          right: 30),
                                      labelText: 'Rua',
                                      onChanged: (value) =>
                                          store.onChangeStreet(value),
                                    ),
                                    InputTextWidget(
                                      paddding: const EdgeInsets.only(
                                          top: 8,
                                          bottom: 8,
                                          right: 30,
                                          left: 30),
                                      labelText: 'N°',
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) =>
                                          store.onChangeNumber(value),
                                    ),
                                    InputTextWidget(
                                      labelText: 'Cidade',
                                      onChanged: (value) =>
                                          store.onChangeCity(value),
                                    ),
                                    InputTextWidget(
                                      labelText: 'Estado',
                                      onChanged: (value) =>
                                          store.onChangeState(value),
                                    ),
                                    InputTextWidget(
                                      labelText: 'CEP',
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        CepInputFormatter()
                                      ],
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) =>
                                          store.onChangeZipCode(value),
                                    ),
                                    InputTextWidget(
                                      labelText: 'Ponto de referência',
                                      onChanged: (value) =>
                                          store.onChangeReferencePoint(value),
                                    ),
                                  ],
                                )
                              : Container(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text(
                                  'Evento acessível a pessoas com deficiência?',
                                  style: TextStyle(
                                      color: AppTheme.colors.neutralDark,
                                      fontSize: 16),
                                ),
                              ),
                              Theme(
                                data: ThemeData.light().copyWith(
                                  chipTheme: ChipThemeData(
                                    shape: StadiumBorder(
                                      side: BorderSide(
                                          color: AppTheme.colors.pink,
                                          width: 2),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 0, 30, 8),
                                  child: FormBuilderFilterChip(
                                    padding: const EdgeInsets.all(10),
                                    spacing: 3,
                                    selectedColor: AppTheme.colors.pink,
                                    checkmarkColor: AppTheme.colors.white,
                                    backgroundColor: AppTheme.colors.white,
                                    name: 'choice_chip',
                                    showCheckmark: false,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    options: triple.state.accessibilities.map<
                                        FormBuilderFieldOption<
                                            AccessibilitiesEntity>>((value) {
                                      return FormBuilderFieldOption<
                                          AccessibilitiesEntity>(
                                        value: value,
                                        child: Text(
                                          value.name
                                              .replaceAll("Deficiência", ""),
                                          style: TextStyle(
                                            color: triple.state
                                                    .selectedsIdsAccessibilities
                                                    .contains(value.id)
                                                ? AppTheme.colors.white
                                                : AppTheme.colors.pink,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      store.onChangeSelectedsAccessibilities(
                                          value as List<AccessibilitiesEntity>);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          InputTextWidget(
                            prefixText: "R\$ ",
                            labelText: 'Qual o valor do evento?: ',
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CentavosInputFormatter()
                            ],
                            onChanged: (value) => store.onChangePrice(value),
                            validator: (_) {
                              if (!triple.state.isFree) {
                                return 'Insira o valor do evento';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                            child: Row(
                              children: [
                                FlutterSwitch(
                                  activeColor: AppTheme.colors.primary,
                                  width: 35.0,
                                  height: 20.0,
                                  valueFontSize: 12.0,
                                  toggleSize: 18.0,
                                  value: triple.state.isFree,
                                  padding: 2,
                                  onToggle: (value) =>
                                      store.onChangeisFree(value),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Evento gratuito',
                                  style: TextStyle(
                                      color: AppTheme.colors.neutralDark,
                                      fontSize: 16),
                                ),
                                const Expanded(
                                  child: SizedBox(
                                    width: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InputTextWidget(
                            labelText: 'Descrição do evento',
                            height: 5 * 24.0,
                            maxLines: 5,
                            validator:
                                Validatorless.required('Campo Obrigatório'),
                            onChanged: (value) =>
                                store.onChangeDescription(value),
                          ),
                          triple.isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20, left: 25, right: 25),
                                  child: RoundedButtonWidget(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        await store.createEvent();
                                      }
                                    },
                                    textButton: 'CRIAR EVENTO E PUBLICAR',
                                  ),
                                )
                        ],
                      );
                    }),
              ),
            ),
          ),
        );
      },
    );
  }
}
