import 'package:app/auth/auth_provider.dart';
import 'package:app/config/responsive.dart';
import 'package:app/constants.dart';
import 'package:app/layouts/splash_layout.dart';
import 'package:app/widgets/nav_header.dart';
import 'package:app/widgets/sidebar.dart';
import 'package:app/widgets/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserLayout extends StatefulWidget {
  final Widget child;
  const UserLayout({
    Key? key, 
    required this.child
  }) : super(key: key);

  @override
  State<UserLayout> createState() => _UserLayoutState();
}

class _UserLayoutState extends State<UserLayout> 
  with SingleTickerProviderStateMixin {

  
  @override
  void initState() { 
    super.initState();
    UserProvider.menuController = AnimationController(
      vsync: this, 
      duration: const Duration(milliseconds: 300) 
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isDesktop = Responsive.isDesktop(context);
    final isTablet = Responsive.isTablet(context);
    final userProvider = Provider.of<UserProvider>(context);
    final size = MediaQuery.of(context).size;

    final authProvider = Provider.of<AuthProvider>(context);

    if(authProvider.authLoading == true){
      return const SplashLayout();
    } 
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: bgColor,
            constraints: const BoxConstraints.expand(),
            child: Row(
              children: [
                if(isDesktop || isTablet)
                  const Sidebar(),
                Expanded(child: Column(
                  children: [
                    const NavHeader(),
                    Expanded(
                      child: Container(child: widget.child)
                    ),
                  ],
                )),                
              ],
            )
          ),
          if (isMobile)
            AnimatedBuilder(
              animation: UserProvider.menuController, 
              builder: ( context, _ ) => Stack(
                children: [
                  if( userProvider.sideOpen )
                    Opacity(
                      opacity: UserProvider.opacity.value,
                      child: GestureDetector(
                        onTap: () => userProvider.closeMenu(),
                        child: Container(
                          width: size.width,
                          height: size.height,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                  Transform.translate(
                    offset: Offset( UserProvider.movement.value, 0 ),
                    child: const Sidebar(),
                  ),
                ],
              )
            )            
        ],
      )
    );
  }
}
