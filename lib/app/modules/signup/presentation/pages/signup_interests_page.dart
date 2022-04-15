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
    return ScopedBuilder(
      store: store,
      onState: (context, state) {
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
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Conta pra gente...quais são seus interesses?',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
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
                                interests: interests,
                              ),
                            );
                          },
                        );
                      }),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 8, 30, 20),
                    child: RoundedButtonWidget(
                      onPressed: () => store.insertInterest(),
                      textButton: 'CONFIRMAR',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: () {
                        //TODO IMPLEMENT
                      },
                      child: const Text(
                        'PULAR',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
                const Text('Falha ao carregar interesses'),
                const SizedBox(
                  height: 20,
                ),
                RoundedButtonWidget(
                  onPressed: () => store.fethInterests(),
                  textButton: 'TENTAR NOVAMENTE',
                )
              ],
            ),
          ),
        );
      },
      onLoading: (context) => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
