import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pachangapp/widgets/user_location.dart';
import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:pachangapp/providers/providers.dart';
import 'package:pachangapp/screens/screens.dart';
import 'package:pachangapp/theme/theme.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final currentIndex = navigationProvider.selectedMenuOpt;

    return SafeArea(
      bottom: true,
      child: Scaffold(
        body: Stack(
          children: const [
            _HomePageBody(),
            Center(child: UserLocation()),
          ]
        ),
        bottomNavigationBar: Container(
          color: AppColors.darkBlack,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: GNav(
              backgroundColor: AppColors.darkBlack,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: AppColors.mainColor,
              padding: const EdgeInsets.all(15),
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
              onTabChange: (index) => navigationProvider.selectedMenuOpt = index
            ),
          ),
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
        return const UserProfileScreen();

      default:
        return const HomeScreen();
    }
  }
}
