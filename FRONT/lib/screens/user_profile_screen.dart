import 'package:flutter/material.dart';

import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import 'package:pachangapp/theme/theme.dart';
import 'package:pachangapp/user_preferences/preferences.dart';
import 'package:pachangapp/providers/providers.dart';

enum CurrentPage {
  dataPage,
  configurationPage,
}

CurrentPage currentPage = CurrentPage.dataPage;

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.blueAccent,
        body: SidebarPage(),
      ),
    );
  }
}

class SidebarPage extends StatefulWidget {
  const SidebarPage({super.key});

  @override
  _SidebarPageState createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  late List<CollapsibleItem> _items;
  late String _headline;
  Widget _content = Container();

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    // _headline = _items.firstWhere((item) => item.isSelected).text;
    currentPage = CurrentPage.dataPage;
    switchPages();
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Datos',
        icon: LineIcons.userCircle,
        onPressed: () => setState(() {
          _headline = 'Datos';
          currentPage = CurrentPage.dataPage;
          switchPages();
        }),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Configuración',
        icon: LineIcons.cog,
        onPressed: () => setState(() {
          _headline = 'Configuración';
          currentPage = CurrentPage.configurationPage;
          switchPages();
        }),
      ),
    ];
  }

  void switchPages() {
    switch (currentPage) {
      case CurrentPage.dataPage:
        _content = const _DataPage();
        break;
      case CurrentPage.configurationPage:
        _content = const _ConfigurationPage();
        break;

      default:
        _content = const _DataPage();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: CollapsibleSidebar(
          screenPadding: 0,
          maxWidth: 250,
          borderRadius: 0,
          isCollapsed: MediaQuery.of(context).size.width <= 800,
          items: _items,
          title: 'Username',
          toggleTitle: 'Cerrar',
          onTitleTap: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Bobo!')));
          },
          // body: _body(size, context),
          body: _content,
          backgroundColor: AppColors.darkBlack,
          selectedTextColor: AppColors.mainColor,
          selectedIconColor: AppColors.mainColor,
          textStyle: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
          titleStyle: const TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
          toggleTitleStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          sidebarBoxShadow: const [],
          topPadding: 10),
    );
  }
}

//TODO: Implementar formulario (provider del form) datos usuario
class _DataPage extends StatefulWidget {
  const _DataPage({super.key});

  @override
  State<_DataPage> createState() => __DataPageState();
}

class __DataPageState extends State<_DataPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text('Datos', style: Theme.of(context).textTheme.headline1),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

class _ConfigurationPage extends StatefulWidget {
  const _ConfigurationPage({super.key});

  @override
  State<_ConfigurationPage> createState() => __ConfigurationPageState();
}

class __ConfigurationPageState extends State<_ConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text('Configuracion', style: Theme.of(context).textTheme.headline1),
            const Divider(),
            SwitchListTile.adaptive(
              value: Preferences.isDarkMode,
              title: const Text('Modo oscuro'),
              onChanged: (value) {
                Preferences.isDarkMode = value;
                final themeProvider =
                    Provider.of<ThemeProvider>(context, listen: false);
                value
                    ? themeProvider.setDarkMode()
                    : themeProvider.setLightMode();
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                //TODO: Implementar logout
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.danger)),
              child: const Text('Cerrar sesion'),
            )
          ],
        ),
      ),
    );
  }
}
