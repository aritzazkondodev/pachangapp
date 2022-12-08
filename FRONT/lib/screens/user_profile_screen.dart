import 'package:flutter/material.dart';
import 'dart:math' as math show pi;

import 'package:sidebarx/sidebarx.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:line_icons/line_icons.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: SidebarPage(),
      ),
    );
  }
}

class SidebarPage extends StatefulWidget {
  @override
  _SidebarPageState createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  late List<CollapsibleItem> _items;
  late String _headline;

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Datos',
        icon: LineIcons.userCircle,
        onPressed: () => setState(() => _headline = 'Datos'),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Configuración',
        icon: LineIcons.cog,
        onPressed: () => setState(() => _headline = 'Configuración'),
      ),
    ];
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
          body: _body(size, context),
          backgroundColor: Colors.black,
          selectedTextColor: Colors.orange,
          selectedIconColor: Colors.orange,
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

  Widget _body(Size size, BuildContext context) {
    // return SafeArea(
    //   child: Expanded(
    //     child: Container(
    //       height: double.infinity,
    //       width: double.infinity,
    //       color: Colors.blueGrey[50],
    //       child: Center(
    //         child: Transform.rotate(
    //           angle: math.pi / 2,
    //           child: Transform.translate(
    //             offset: Offset(-size.height * 0.25, -size.width * 0.23),
    //             child: Text(
    //               _headline,
    //               style: Theme.of(context).textTheme.headline1,
    //               overflow: TextOverflow.visible,
    //               softWrap: false,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    return SafeArea(
      child: Column(
        children: [
          Text(
            _headline,
            style: const TextStyle(fontSize: 50),
          ),
        ],
      ),
    );
  }
}
