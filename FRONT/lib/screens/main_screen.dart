import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:pachangapp/providers/providers.dart';
import 'package:pachangapp/screens/screens.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final currentIndex = navigationProvider.selectedMenuOpt;

    return Scaffold(
      body: const _HomePageBody(),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.orange,
              padding: const EdgeInsets.all(16),
              gap: 8,
              tabs: const [
                GButton(
                  icon: LineIcons.search,
                  text: 'Buscar',
                ),
                GButton(
                  icon: LineIcons.newspaper,
                  text: 'Novedades',
                ),
                GButton(
                  icon: LineIcons.home,
                  text: 'Inicio',
                ),
                GButton(
                  icon: LineIcons.calendar,
                  text: 'Reservas',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Perfil',
                ),
              ],
              selectedIndex: currentIndex,
              onTabChange: (index) =>
                  navigationProvider.selectedMenuOpt = index),
        ),
      ),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final currentIndex = navigationProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return const SearchScreen();
      case 1:
        return const NewsScreen();
      case 2:
        return const HomeScreen();
      case 3:
        return const ReservasScreen();
      case 4:
        return UserProfileScreen();

      default:
        return const HomeScreen();
    }
  }
}
