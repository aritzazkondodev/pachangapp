import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:pachangapp/providers/location_provider.dart';
import 'package:pachangapp/theme/app_colors.dart';
import 'package:provider/provider.dart';

import '../ui/ui.dart';

class UserLocation extends StatelessWidget {
  const UserLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        width: 350,
        decoration: boxDecoration(),
        child: Column(
          children: [
            Container(
              width: 400,
              height: 45,
              decoration: BoxDecoration(
                color: AppColors.accentColor,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)) 
              ),
              child: const Center(
                child: Text('Necesitamos tu ubicación', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
              )
            ),
    
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: const [
                  _Tabs(),
                  _ManualLocationForm(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    backgroundColor: AppColors.buttonLoginRegisterColor
                  ),
                  onPressed:() { 
                    Navigator.restorablePushNamed(context, 'main');
                  }, 
                  child: const SizedBox(
                    width: 400,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Text('Confirmar Información', style: TextStyle( fontSize: 20, color: Colors.black), textAlign: TextAlign.center,),
                    ),
                  ),
                ),
              )
            )
          ]
        ),
      ),
    );
  }

  BoxDecoration boxDecoration() => const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    // gradient: LinearGradient(
    //   begin: Alignment.topCenter,
    //   end: Alignment.bottomCenter,
    //   colors: [
    //     Color.fromRGBO(225, 225, 235, 1),
    //     Color.fromRGBO(188, 186, 192, 1),
    //   ]
    // ),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 15,
        offset: Offset(0,5)
      )
    ]
  );
}

class _ManualLocationForm extends StatelessWidget {
  const _ManualLocationForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    final List<String> items = [
      'Álava',
      'Albacete',
      'Alicante',
      'Almería',
      'Almería',
      'Almería',
      'Almería',
      'Almería',
    ];
    String? selectedValue;
    
    return Form(
      child: Column(
        children: [
          Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: Row(
                  children: const [
                    Icon(
                      Icons.list,
                      size: 16,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        'Provincia',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                },
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                  ),
                  elevation: 2,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                  iconSize: 14,
                  iconEnabledColor: Colors.black,
                  iconDisabledColor: Colors.grey,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                  ),
                  elevation: 8,
                  offset: const Offset(-10, -2),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all<double>(6),
                    thumbVisibility: MaterialStateProperty.all<bool>(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 14, right: 14,),
                ),
              ),
            ),
          ),
          TextFormField(
            initialValue: '',
            textCapitalization: TextCapitalization.words,
            obscureText: true,
            onChanged: (value) {
              // formValues[formProperty] = value;
            } ,
            validator: (value) {
              if (value == null) return 'Este campo es requerido';
              return value.length < 3 ? 'Minimo de 3 letras' : null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.black),
              label: Text('Codigo Postal', style: TextStyle(color: Colors.black),)
            ),
          ),

          TextFormField(
            initialValue: '',
            textCapitalization: TextCapitalization.words,
            obscureText: true,
            onChanged: (value) {
              // formValues[formProperty] = value;
            } ,
            validator: (value) {
              if (value == null) return 'Este campo es requerido';
              return value.length < 5 || value.length > 5 ? '5 letras' : null;
            },
            style: const TextStyle(color: Colors.black),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.black),
              label: Text('Ciudad/Pueblo', style: TextStyle(color: Colors.black),),
            ),
          )
        ],
      )
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final locationProvider = Provider.of<LocationProvider>(context);

    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      currentIndex: locationProvider.paginaActual,
      unselectedItemColor: Colors.black,
      onTap: (i) => locationProvider.paginaActual = i,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Ubicación manual'),
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Detectar mi ubicación'),
      ],
    );
  }
}