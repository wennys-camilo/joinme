import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';
import '../../../../shared/domain/entites/city_entity.dart';
import '../../../../shared/presentation/themes/app_theme.dart';
import '../../../../shared/presentation/widgets/rounded_button_widget.dart';
import 'signup_store.dart';

class SignupAddressPage extends StatefulWidget {
  const SignupAddressPage({Key? key}) : super(key: key);

  @override
  State<SignupAddressPage> createState() => _SignupAddressPageState();
}

class _SignupAddressPageState
    extends ModularState<SignupAddressPage, SignupStore> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    store.cities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Seleccione sua localização',
                style: TextStyle(
                  color: AppTheme.colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Autocomplete<CityEntity>(
                displayStringForOption: (CityEntity option) => option.name,
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<CityEntity>.empty();
                  }
                  return store.state.citysList.where((CityEntity option) {
                    return option.name
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (CityEntity selection) {
                  store.onChangeCity(selection.name);
                },
                fieldViewBuilder:
                    (context, controller, focusNode, onEditingComplete) {
                  return TextFormField(
                    controller: controller,
                    focusNode: focusNode,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15),
                      suffixIcon: const Icon(Icons.search),
                      iconColor: AppTheme.colors.primary,
                      fillColor: AppTheme.colors.white,
                      filled: true,
                      hintText: 'Pesquisar',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.colors.primary),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.colors.black),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.colors.red),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        store.onChangeCity(value);
                      }
                    },
                    validator: Validatorless.required('Digite a sua cidade'),
                  );
                },
              ),
            ),
            const Expanded(
              child: SizedBox(
                height: 5,
              ),
            ),
            Center(
              child: RoundedButtonWidget(
                width: MediaQuery.of(context).size.width * 0.9,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await store.insertCity();
                  }
                },
                textButton: 'CONFIRMAR',
                styleText: TextStyle(
                    fontWeight: FontWeight.bold, color: AppTheme.colors.white),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 20),
                child: GestureDetector(
                  onTap: () => Modular.to.navigate('/home/homePage'),
                  child: const Text(
                    'PULAR',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
