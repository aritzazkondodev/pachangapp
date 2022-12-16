import 'package:flutter/material.dart';

import 'package:getwidget/getwidget.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pachangapp/theme/theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  double _currentSliderValue = 5;

  @override
  Widget build(BuildContext context) {
    List citiesList = [
      "Nombre ciudad 1, Nombre Provincia",
      "Nombre ciudad 2, Nombre Provincia",
      "Nombre ciudad 3, Nombre Provincia",
      "Nombre ciudad 4, Nombre Provincia",
      "Nombre ciudad 5, Nombre Provincia",
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
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 15, right: 15),
                        filled: true,
                        fillColor: AppColors.white,
                        hintText: "Buscar...",
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            print('borrar busqueda');
                          },
                          child: const Icon(LineIcons.times),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  //TODO: Implementar busqueda
                  Ink(
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      splashRadius: 30,
                      splashColor: AppColors.accentColor,
                      onPressed: () => {
                        print('buscar'),
                      },
                      icon: const Icon(LineIcons.search),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Distancia de busqueda'),
            Slider(
              value: _currentSliderValue,
              label: '${_currentSliderValue.round().toString()} km',
              min: 5,
              max: 55,
              divisions: 5,
              onChanged: (value) {
                _currentSliderValue = value;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
