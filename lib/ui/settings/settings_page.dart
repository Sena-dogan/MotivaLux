import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/router/app_router.dart';
import '../../config/theme/theme_logic.dart';
import '../../constants/assets.dart';
import '../../utils/context_extensions.dart';
import '../auth/login_logic.dart';
import '../home/widgets/app_bar_gone.dart';
import '../home/widgets/flutter_nav_bar.dart';
import '../wallpaper/gradient_bg.dart';
import 'theme_widget.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const EmptyAppBar(),
      backgroundColor: Colors.transparent,
      bottomNavigationBar: const NavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Gap(20),
              ListTile(
                trailing: Container(
                  width: 60,
                  height: 60,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: FirebaseAuth.instance.currentUser?.photoURL != null
                          ? NetworkImage(
                              FirebaseAuth.instance.currentUser!.photoURL!)
                          : Image.asset(Assets.AppIcon).image,
                      fit: BoxFit.fill,
                    ),
                    shape: const OvalBorder(),
                  ),
                ),
                title: Text(
                  FirebaseAuth.instance.currentUser?.displayName ?? 'Kullanici',
                  style: context.textTheme.labelMedium,
                ),
                subtitle: Text(FirebaseAuth.instance.currentUser?.email ?? '',
                    style: context.textTheme.labelSmall),
              ),
              // Invite friends button outlined with a border transtiion and with a leading icon
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton.icon(
                  onPressed: () {
                    context.showErrorSnackBar(
                        title: 'Hata', message: 'Bir hata oluştu. Bildirildi.');
                    throw Exception('Share Not implemented');
                  },
                  icon: const Icon(Icons.share),
                  label: Text(
                    'Davet Et',
                    style: context.textTheme.bodyMedium,
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              const Gap(20),
              // Security section with full widht  and with a leading icon
              // Help and support section with full widht  and with a leading icon
              // Instead of share button, it is like a section that takes all the width
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Cihaz',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(
                    indent: 8,
                  ),
                  const Gap(10),
                  ListTile(
                    leading: const Icon(Icons.lightbulb_outline),
                    title: const Text('Tema'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () async {
                      await showAdaptiveDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: context.colorScheme.surface,
                              title: const Text(
                                'Tema',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: const Icon(Icons.light_mode),
                                    title: const Text('Açık Tema'),
                                    onTap: () {
                                      ref
                                          .read(themeLogicProvider.notifier)
                                          .setThemeMode(ThemeMode.light);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.dark_mode),
                                    title: const Text('Koyu Tema'),
                                    onTap: () {
                                      ref
                                          .read(themeLogicProvider.notifier)
                                          .setThemeMode(ThemeMode.dark);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.lightbulb),
                                    title: const Text('Sistem Teması'),
                                    onTap: () {
                                      ref
                                          .read(themeLogicProvider.notifier)
                                          .setThemeMode(ThemeMode.system);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                  ),
                  const Gap(10),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Yardım ve Destek',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(
                    indent: 8,
                  ),
                  const Gap(10),
                  // ListTile(
                  //   leading: Icon(Icons.help),
                  //   title: Text('Sıkça Sorulan Sorular'),
                  //   trailing: Icon(Icons.arrow_forward_ios),
                  // ),
                  ListTile(
                    leading: const Icon(Ionicons.call),
                    title: const Text('İletişim'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () async {
                      const String url = 'mailto:zeynepsena2002.d@gmail.com';
                      final Uri uri = Uri.parse(url);
                      await launchUrl(uri).catchError((Object? err) =>
                          // ignore: invalid_return_type_for_catch_error
                          debugPrint(err.toString()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Ionicons.reader_outline),
                    title: const Text('Gizlilik Politikası'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () async {
                      const String url = 'https://senadogan.dev';
                      final Uri uri = Uri.parse(url);
                      await launchUrl(uri).catchError((Object? err) =>
                          // ignore: invalid_return_type_for_catch_error
                          debugPrint(err.toString()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Ionicons.ticket_outline),
                    title: const Text('Kullanım Koşulları'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () async {
                      const String url = 'https://senadogan.dev';
                      final Uri uri = Uri.parse(url);
                      await launchUrl(uri).catchError((Object? err) =>
                          // ignore: invalid_return_type_for_catch_error
                          debugPrint(err.toString()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Ionicons.remove_circle_outline),
                    title: const Text('Hesabımı Sil'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () async {
                      await showAdaptiveDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: context.colorScheme.surface,
                              title: const Text(
                                'Hesabınızı silmek istediğinize emin misiniz?',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('İptal',
                                      style: context.textTheme.bodyMedium),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await ref
                                        .read(loginLogicProvider.notifier)
                                        .removeUser()
                                        .then((bool value) => value
                                            ? context.go(SGRoute.login.route)
                                            : null)
                                        .catchError((Object? err) =>
                                            // ignore: invalid_return_type_for_catch_error
                                            debugPrint(err.toString()));
                                  },
                                  child: Text(
                                    'Sil',
                                    style: context.textTheme.bodyMedium!
                                        .copyWith(
                                            color: context.colorScheme.error),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Çıkış Yap'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () async {
                      await ref
                          .read(loginLogicProvider.notifier)
                          .signOut()
                          .then((bool value) =>
                              value ? context.go(SGRoute.login.route) : null)
                          .catchError((Object? err) =>
                              // ignore: invalid_return_type_for_catch_error
                              debugPrint(err.toString()));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: context.theme.primaryColorDark,
        ),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(title, style: context.theme.primaryTextTheme.bodyLarge),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
