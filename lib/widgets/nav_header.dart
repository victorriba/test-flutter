import 'package:app/auth/auth_provider.dart';
import 'package:app/config/navigation_service.dart';
import 'package:app/config/responsive.dart';
import 'package:app/constants.dart';
import 'package:app/router/router.dart';
import 'package:app/widgets/custom_menu_item.dart';
import 'package:app/widgets/shape_card.dart';
import 'package:app/widgets/text_variants.dart';
import 'package:app/widgets/user_provider.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
class NavHeader extends StatelessWidget {
  const NavHeader({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final userProvider = Provider.of<UserProvider>(context);
    return Container(
      decoration: buildBoxDecoration(),
      height: 60,
      child: Row(
        children: [
          const SizedBox(width: defaultSized),
          if (isMobile) ...[
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: (){
                userProvider.openMenu();
              }, 
              icon: const Icon(
                Icons.menu_outlined,
                size: 45, 
                color: primaryColor
              ),
            ),
            const SizedBox(width: defaultSized),
          ],
          Expanded(
            child: TextVariant.h4(
              text: userProvider.pageTitle,
              context: context,
              color: primaryColor 
            ),
          ),
          Badge(
            badgeContent: const Text('0'),
            child: const Icon(Icons.notifications_outlined),
          ),
          const SizedBox(width: defaultSized),
          const VerticalDivider(
            width: 20,
            thickness: 2,
            indent: 10,
            endIndent: 10,
          ),         
          const SizedBox(width: defaultSized),
          const AnimateMenuList(),
          const SizedBox(width: defaultSized),
        ],
      ),      
    );
  }
  BoxDecoration buildBoxDecoration() =>const BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 5
      )
    ]
  );
}


class AnimateMenuList extends StatefulWidget {
  const AnimateMenuList({
    Key? key 
  }) : super(key: key);

  @override
  _AnimateMenuListState createState() => _AnimateMenuListState();
}

class _AnimateMenuListState extends State<AnimateMenuList> 
  with SingleTickerProviderStateMixin {

  late AnimationController _controllerIcon;

  bool isMenuOpen = false;

  @override
  void initState() { 
    super.initState();
    _controllerIcon = AnimationController(
      vsync: this, 
      duration: const Duration(milliseconds: 100)
    );
  }

  @override
  Widget build(BuildContext context) {
    void openMenu(){
      setState(() {
        isMenuOpen = true;
      });
    }    

    return  PortalEntry(
      visible: isMenuOpen,
      portal: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            isMenuOpen = false;
          });
          _controllerIcon.reverse();
        },
      ),
      child: PortalEntry(
        visible: isMenuOpen,
        portalAnchor: Alignment.topRight,
        childAnchor: Alignment.bottomRight,
        portal: Material(
          shape: shapeButtom(),
          elevation: 8,
          child: listMenu(context),
        ),
        child: buttonMenu(openMenu, context),
      )
    );
  }

  Widget listMenu(context){
    final authProvider = Provider.of<AuthProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    return Container(
      decoration : BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      constraints: const BoxConstraints(maxWidth: 280),
      padding: const EdgeInsets.only(bottom: 8, top: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomMenuitem(
            onPressed: (){
              setState(() {
                isMenuOpen = false;
              });
              _controllerIcon.reverse();
              NavigationService.replaceTo(
                Flurorouter.profileRoute
              );            
            },
            isActive: userProvider.currentPage == Flurorouter.profileRoute,
            icon: Icons.account_box_outlined,
            text: "Profile"
          ),
          CustomMenuitem(
            onPressed: (){
              setState(() {
                isMenuOpen = false;
              });
              _controllerIcon.reverse();
              authProvider.logout();          
            },
            icon: Icons.logout_outlined, 
            text: "Logout"
          ),
        ],
      ),    
    );
  }

  Widget buttonMenu(Function openMenu, context){
    final isDesktop = Responsive.isDesktop(context);
    final isTablet = Responsive.isTablet(context);
    return  InkWell(
      onTap: (){
        openMenu();
        _controllerIcon.forward();
      },

      child: Row(
        children: [
          CircleAvatar(
            radius: 23.0,               
            backgroundColor: secondaryColor,
            child:  CircleAvatar(
              radius: 20.0, 
              child: ClipRRect(
              borderRadius:BorderRadius.circular(50),
              child: Image.network(
                'https://images.unsplash.com/photo-1550525811-e5869dd03032?ixlib=rb-1.2.1&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80'),
              )
            )
          ),
          const SizedBox( width: 10 ),
          if(isDesktop || isTablet)
            const Text("Zain Dokidis"),
          const Icon(Icons.expand_more_outlined),
        ]
      )
    ); 
  }


}