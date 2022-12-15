import 'package:flutter/material.dart';

import 'package:getwidget/getwidget.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pachangapp/theme/theme.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List list = [
      "Campo 1",
      "Campo 2",
      "Campo 3",
      "Campo 4",
      "Campo 5",
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Buscar', style: Theme.of(context).textTheme.headline1),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    //TODO: Añadir sugerecias con Autocomplete()
                    child: TextField(
                      style: TextStyle(color: AppColors.darkBlack),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 15),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        hintText: 'Buscar',
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 17),
                        prefixIcon: Icon(
                          LineIcons.search,
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(14)),
                    //TODO: Implementar busqueda
                    onPressed: () {},
                    icon: const Icon(LineIcons.search),
                    label: const Text(''),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Distancia de busqueda'),
            Slider(value: 10, max: 100, onChanged: (value) {})
          ],
        ),
      ),
    );
  }
}
