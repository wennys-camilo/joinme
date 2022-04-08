import '../../../../../shared/presentation/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Perfil',
                    style: TextStyle(fontSize: 23),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 42,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    height: 118,
                    width: 118,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppTheme.colors.grey),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppTheme.colors.primary)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
