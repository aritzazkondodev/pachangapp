import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pachangapp/theme/app_colors.dart';

import '../../widgets/widgets.dart';

class WelcomeScreen extends StatelessWidget {
   
  const WelcomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
       top: true,
        child: Container(
          margin: const EdgeInsets.only(top: 10, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Icon(Icons.sports_soccer_outlined, size: 300, color: AppColors.accentColor,)),
              
              const _WelcomeText(),

              Expanded(
                child: Column(
                  children: const [
                    Spacer(),
                    Center(child: _CustomButton(text: 'Registrate', page: 'register',)),
                    SizedBox(height: 25,),
                          
                    Center(child: _CustomButton(text: 'Login', page: 'login',)),

                    SocialButtons()
                  ],
                ),
              ),
        
        
           ],
          ),
        ),
      ),
    );
  }
}

class _WelcomeText extends StatelessWidget {
  const _WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Welcome', style: TextStyle(fontSize: 30), textAlign: TextAlign.start),
          // SizedBox(height: 5,),
          // Text('Ponte a hacer deporte', style: TextStyle(fontSize: 18),),
          // Text('No apto para personas sedentarias (vagos)', style: TextStyle(fontSize: 18,)),
          SizedBox(height: 10,),
          Text('Get started by looging into your account or creating a new one', style: TextStyle(fontSize: 15,)),
        ],
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {

  final String text;
  final String page;

  const _CustomButton({
    super.key, 
    required this.text, required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        shape: const StadiumBorder(),
      ),
      onPressed:() { 
        Navigator.restorablePushNamed(context, page);
      }, 
      child: SizedBox(
        width: 300,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Text(text, style: const TextStyle( fontSize: 16), textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}