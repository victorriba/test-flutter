import 'package:app/config/navigation_service.dart';
import 'package:app/constants.dart';
import 'package:app/router/router.dart';
import 'package:app/widgets/custom_menu_item.dart';
import 'package:app/widgets/text_variants.dart';
import 'package:app/widgets/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    void navigateTo(String routeName) {
      userProvider.closeMenu();
      NavigationService.replaceTo(routeName);
    }      
    return Container(
      width: 320,
      decoration: buildBoxDecoration(),
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 70,
            child: SvgPicture.asset('assets/images/logo.svg',
              color: Colors.white,
              height: 40,
              semanticsLabel: 'logo'
            ),            
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomMenuitem(
                    text: 'Dashboard',
                    icon: Icons.home_outlined,
                    onPressed: () {
                      navigateTo(Flurorouter.dashboardRoute);
                    },
                    isActive: userProvider.currentPage == Flurorouter.dashboardRoute
                  ),                             
                  CustomMenuitem(
                    text: 'Report',
                    icon: Icons.text_snippet_outlined,
                    onPressed: () {
                      navigateTo(Flurorouter.reportsRoute);
                    },
                    isActive: userProvider.currentPage == Flurorouter.reportsRoute
                  ),               
                  CustomMenuitem(
                    text: 'Post List',
                    icon: Icons.dynamic_feed_outlined,
                    onPressed: () {
                      navigateTo(Flurorouter.postsRoute);
                    },
                    isActive: userProvider.currentPage == Flurorouter.postsRoute
                  ),               
                  CustomMenuitem(
                    text: 'Banner List',
                    icon: Icons.grid_view_outlined,
                    onPressed: () {
                      navigateTo(Flurorouter.bannersRoute);
                    },
                    isActive: userProvider.currentPage == Flurorouter.bannersRoute
                  ),               
                  CustomMenuitem(
                    text: 'Dynamic Page',
                    icon: Icons.dashboard_outlined,
                    onPressed: () {
                      navigateTo(Flurorouter.dynamicRoute);
                    },
                    isActive: userProvider.currentPage == Flurorouter.dynamicRoute
                  ),               
                  CustomMenuitem(
                    text: 'Manage Categories',
                    icon: Icons.folder_open_outlined,
                    onPressed: () {
                      navigateTo(Flurorouter.categoriesRoute);
                    },
                    isActive: userProvider.currentPage == Flurorouter.categoriesRoute
                  ),               
                  CustomMenuitem(
                    text: 'Manage Emotion',
                    icon: Icons.sentiment_satisfied_outlined,
                    onPressed: () {
                      navigateTo(Flurorouter.emotionsRoute);
                    },
                    isActive: userProvider.currentPage == Flurorouter.emotionsRoute
                  ),               
                  CustomMenuitem(
                    text: 'Manage Admin',
                    icon: Icons.people_outline,
                    onPressed: () {
                      navigateTo(Flurorouter.adminsRoute);
                    },
                    isActive: userProvider.currentPage == Flurorouter.adminsRoute
                  ),               
                  CustomMenuitem(
                    text: 'Article & Podcast',
                    icon: Icons.mic_none_outlined,
                    onPressed: () {
                      navigateTo(Flurorouter.articlesRoute);
                    },
                    isActive: userProvider.currentPage == Flurorouter.articlesRoute
                  ),               
                  CustomMenuitem(
                    text: 'Announcements',
                    icon: Icons.campaign_outlined,
                    onPressed: () {
                      navigateTo(Flurorouter.announcementsRoute);
                    },
                    isActive: userProvider.currentPage == Flurorouter.announcementsRoute
                  ),               
                  CustomMenuitem(
                    text: 'Setting',
                    icon: Icons.settings_outlined,
                    onPressed: () {
                      navigateTo(Flurorouter.settingsRoute);
                    },
                    isActive: userProvider.currentPage == Flurorouter.settingsRoute
                  ),               
                                  
                ],
              ),
            ),
          ),
          Padding(
            padding: 
              const EdgeInsets.only(left: 8, right: 8, top: 24, bottom: 24),
            child: Row(
              children: [
                  const SizedBox(width: 10),
                  TextVariant.h4(
                    text: "Help Center",
                    context: context,
                    color: secondaryColor
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  BoxDecoration buildBoxDecoration() => const BoxDecoration(
      color: primaryColor,
      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 1)]
  );  
}