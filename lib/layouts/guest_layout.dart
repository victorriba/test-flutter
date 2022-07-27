import 'package:app/auth/auth_provider.dart';
import 'package:app/layouts/splash_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class GuestLayout extends StatelessWidget {
  final Widget child;
  const GuestLayout({ 
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) { 

    final authProvider = Provider.of<AuthProvider>(context);

    if(authProvider.authLoading == true){
      return const SplashLayout();
    }       
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: child,
          ),        
        ],
      ),
    );
  }
}