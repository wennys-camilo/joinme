import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../../../shared/presentation/themes/app_theme.dart';
import '../../../../shared/presentation/widgets/rounded_button_widget.dart';
import '../widgets/interests_widget.dart';
import 'signup_store.dart';

class SignupInterestPage extends StatefulWidget {
  const SignupInterestPage({Key? key}) : super(key: key);

  @override
  State<SignupInterestPage> createState() => _SignupInterestPageState();
}

class _SignupInterestPageState extends State<SignupInterestPage> {
  late final SignupStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<SignupStore>();
    store.fethInterests();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Scaffold(
          body: ListView(
            shrinkWrap: true,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () => Modular.to.pop(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppTheme.colors.primary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Conta pra gente...quais são seus interesses?',
                  style:
                      TextStyle(color: AppTheme.colors.primary, fontSize: 20),
                ),
              ),
              TripleBuilder(
                  store: store,
                  builder: (context, triple) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 8,
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: store.state.interestsList.length,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final interests = store.state.interestsList[index];
                        return GestureDetector(
                          onTap: () => store.addInterest(interests.id),
                          child: InterestWidget(
                            selected: store.state.selectedInterests
                                .contains(interests.id),
                            name: interests.name,
                          ),
                        );
                      },
                    );
                  }),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  //TODO IMPLEMENT
                },
                child: Text(
                  'pular',
                  style: TextStyle(color: AppTheme.colors.primary),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 8, 30, 20),
                child: RoundedButtonWidget(
                  onPressed: () => store.insertInterest(),
                  textButton: 'Próximo',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
