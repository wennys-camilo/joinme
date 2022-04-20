import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../../shared/presentation/pages/reload_error_page.dart';
import '../../../../../shared/presentation/themes/app_theme.dart';
import '../../../../../shared/presentation/utils/extension/string_extension_capitalize.dart';
import '../../../presentation/widgets/custom_filter_chip_widget.dart';
import 'profile_state.dart';
import 'profile_store.dart';
import 'widgets/container_light_primary_widget.dart';
import 'widgets/subtitle_text_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ModularState<ProfilePage, ProfileStore> {
  @override
  void initState() {
    super.initState();
    store.fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<ProfileStore, Failure, ProfileState>(
      store: store,
      onState: (context, triple) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Perfil',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.colors.black),
                        ),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppTheme.colors.grey.withOpacity(0.6)),
                          child: Icon(
                            Icons.settings,
                            color: AppTheme.colors.primary,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onDoubleTap: () {},
                      child: Center(
                        child: Stack(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppTheme.colors.grey),
                              child: const CircleAvatar(
                                backgroundImage: NetworkImage(
                                  'https://i.ibb.co/d2CzTcn/Vector-8.png',
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                  child: Icon(
                                    Icons.create_rounded,
                                    color: AppTheme.colors.primary,
                                  ),
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppTheme.colors.blueLight)),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 37),
                      child: Text(
                        triple.userEntity.name.toTitleCase(),
                        style: TextStyle(
                            color: AppTheme.colors.black.withOpacity(0.5),
                            fontSize: 23,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ContainerLightPrimary(
                          topComponent: Text(
                            '2',
                            style: TextStyle(
                                color: AppTheme.colors.primary,
                                fontSize: 23,
                                fontWeight: FontWeight.w700),
                          ),
                          bottomText: 'Eventos',
                        ),
                        ContainerLightPrimary(
                          topComponent: Icon(
                            Icons.workspace_premium,
                            color: AppTheme.colors.primary,
                          ),
                          bottomText: 'Nível #',
                        ),
                        ContainerLightPrimary(
                          topComponent: Text(
                            '140',
                            style: TextStyle(
                                color: AppTheme.colors.primary,
                                fontSize: 23,
                                fontWeight: FontWeight.w700),
                          ),
                          bottomText: 'Minutos',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: [
                        const SubtitleText(
                          subtitle: 'Sobre mim',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.create_rounded,
                            color: AppTheme.colors.black.withOpacity(0.6)),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Estudante de Engenharia de Produção, gosto de fazer atividades físicas e cursos que estimulam a criatividade.',
                      style: TextStyle(
                          color: AppTheme.colors.black.withOpacity(0.6),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        const SubtitleText(subtitle: 'Interesses'),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.create_rounded,
                            color: AppTheme.colors.black.withOpacity(0.6)),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CustomFilterChipWidget(
                              chipColor: AppTheme.colors.pink);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SubtitleText(
                            subtitle: 'Possui alguma deficiência ?'),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.create_rounded,
                            color: AppTheme.colors.black.withOpacity(0.6)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        height: 50,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomFilterChipWidget(
                                chipColor: AppTheme.colors.pink);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      onLoading: (context) {
        return Container(
          color: AppTheme.colors.white,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      onError: (context, error) {
        return ReloadErrorPage(
            message: 'Falha ao carregar perfil',
            action: () async => await store.fetchProfile());
      },
    );
  }
}
