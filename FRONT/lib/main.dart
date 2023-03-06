import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:pachangapp/screens/screens.dart';
import 'package:pachangapp/providers/providers.dart';
import 'package:pachangapp/user_preferences/preferences.dart';

import 'theme/theme.dart';

void main() async {
  //Carga de las preferencias de usuario
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();

  // Quitar overlay bottom
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  // Status bar transparente
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.darkBlack,
      systemNavigationBarColor: AppColors.darkBlack,
      systemNavigationBarContrastEnforced: false  ,
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => LoginRegisterProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(
            create: (_) => ThemeProvider(isDarkMode: Preferences.isDarkMode)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pachangapp',
      initialRoute: 'main',
      routes: {
        'welcome': (_) => const WelcomeScreen(),
        'login': (_) => const LoginScreen(),
        'register': (_) => const RegisterScreen(),

        'main': (_) => const MainScreen(),
        
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
