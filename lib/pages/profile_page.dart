import 'package:app/auth/auth_provider.dart';
import 'package:app/config/responsive.dart';
import 'package:app/constants.dart';
import 'package:app/widgets/shape_card.dart';
import 'package:app/widgets/text_variants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final authProvider = Provider.of<AuthProvider>(context);
    return Card(
      shape: shapeAll(),
      margin: EdgeInsets.all(isMobile ? 16.0 : 24.0),
      child: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              isScrollable: true,
              indicatorColor: primaryColor,
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextVariant.bodyMedium(
                    context: context,
                    text: "My Profile"
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextVariant.bodyMedium(
                    context: context,
                    text: "Change Password"
                  ),
                ),
              ],
            ),
            const Divider(
              height: 1,
              thickness: 1,
              indent: 1,
              endIndent: 1,              
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: TextVariant.h2(
                      text: authProvider.authRol+" "+authProvider.authNames,
                      context: context, 
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: TextVariant.h2(
                      text: "Change Password",
                      context: context, 
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      )
    );
  }
}