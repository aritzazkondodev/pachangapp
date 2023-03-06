import 'package:flutter/material.dart';
import 'package:pachangapp/providers/providers.dart';
import 'package:pachangapp/theme/app_colors.dart';
import 'package:pachangapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../ui/ui.dart';

class LoginScreen extends StatelessWidget {
   
  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Container(
            margin: const EdgeInsets.only(bottom: 10, top: 10),
            child: Center(
              child: Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Center(child: Icon(Icons.sports_soccer_outlined, size: 100, color: AppColors.accentColor,)),
                  //       const Text('Log In', style: TextStyle(fontSize: 40),),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(height: 40,),
                  const Text('Log In', style: TextStyle(fontSize: 40),),

                  Expanded(
                    child: Column(
                      children: [
                        const Spacer(),
                        
                        const _LoginForm(),
                        const SizedBox(height: 40,),
                        const _CustomButton(),
                        
                        const SocialButtons(),
                        TextButton(
                          onPressed: (() => Navigator.pushReplacementNamed(context, 'register')),
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(AppColors.mainColor.withOpacity(0.1)),
                            shape: MaterialStateProperty.all(const StadiumBorder()),
                            alignment: Alignment.centerRight,
                          ),
                          child: SizedBox(
                            width: 230,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('''Don't have an Account? '''),
                                Text('Sing Up', style: TextStyle(fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final navigationProvider = Provider.of<LoginRegisterProvider>(context);
    final rememberLogin = navigationProvider.rememberLogin;

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      
            const Text('Email'),
            const SizedBox(height: 5,),
            TextFormField(
              // autofocus: true,
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
              decoration: InputDecorations.authInputDecoration('Enter your Email', Icons.email),
            ),
            const SizedBox(height: 15,),

            const Text('Password'),
            const SizedBox(height: 5,),
            Container(
              decoration: InputDecorations.authBoxInputDecoration,
              child: TextFormField(
                // autofocus: true,
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
                decoration: InputDecorations.authInputDecoration('Enter your Password', Icons.lock),
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: (() => Navigator.pushReplacementNamed(context, 'register')),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(AppColors.mainColor.withOpacity(0.1)),
                  shape: MaterialStateProperty.all(const StadiumBorder()),
                  alignment: Alignment.centerRight,
                ),
                child: const Text('Forgot Password', style: TextStyle(fontSize: 12, color: Colors.white),)
              ),
            ),
      
            CheckboxListTile(
              value: rememberLogin, 
              title: const Text('Recuérdame', style: TextStyle(color: Colors.white),),
              checkColor: AppColors.mainColor,
              onChanged: (value) {
                navigationProvider.updateRemember(value ?? true);
              }
            ),
      
            SwitchListTile.adaptive(
              value: rememberLogin,
              title: const Text('Recuérdame', style: TextStyle(color: Colors.white),),
              onChanged: (value) {
                navigationProvider.updateRemember(value);
              }
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {

  const _CustomButton({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          backgroundColor: AppColors.buttonLoginRegisterColor
        ),
        onPressed:() { 
          Navigator.restorablePushNamed(context, 'main');
        }, 
        child: const SizedBox(
          width: 250,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text('Login', style: TextStyle( fontSize: 16, color: Colors.black), textAlign: TextAlign.center,),
          ),
        ),
      ),
    );
  }
}