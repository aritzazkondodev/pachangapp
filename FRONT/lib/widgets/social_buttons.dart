import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _CustomDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            _SocialButton(icon: FaIcon(FontAwesomeIcons.google, size: 40)),
            _SocialButton(icon: FaIcon(FontAwesomeIcons.facebook, size: 40)),
            _SocialButton(icon: FaIcon(FontAwesomeIcons.apple, size: 40,)),
          ],
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {

  final FaIcon icon; 
  
  const _SocialButton({
    super.key, 
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          shape: const CircleBorder(), 
          padding: const EdgeInsets.all(10)),
        child: Center(child: icon),
        onPressed: () {},
      ),
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 42, vertical: 25),
      child: Divider(height: 10, color: Colors.white,),
    );
  }
}