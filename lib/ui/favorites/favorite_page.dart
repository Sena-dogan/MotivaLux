import 'package:flutter/material.dart';

import '../../utils/context_extensions.dart';
import '../home/widgets/app_bar_gone.dart';
import '../home/widgets/flutter_nav_bar.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: const EmptyAppBar(),
      bottomNavigationBar: const NavBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 20,
              childAspectRatio: 0.8,
            ),
            children: const <Widget>[
              FavoriteCard(),
              FavoriteCard(),
              FavoriteCard(),
              FavoriteCard(),
              FavoriteCard(),
              FavoriteCard(),
              FavoriteCard(),
              FavoriteCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: context.theme.primaryColorDark,
      ),
    );
  }
}
