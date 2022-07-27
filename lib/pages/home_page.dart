import 'package:app/auth/auth_provider.dart';
import 'package:app/config/responsive.dart';
import 'package:app/constants.dart';
import 'package:app/widgets/custom_elevated_button.dart';
import 'package:app/widgets/input_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final isMobile = Responsive.isMobile(context);
    final isDesktop = Responsive.isDesktop(context);
    final isTablet = Responsive.isTablet(context);
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final _email = TextEditingController();
    final _password = TextEditingController();
    return Center(
      child: Form(
        key: _formKey,
        child: Row(
          mainAxisSize : MainAxisSize.min,
          children: [
            if(isDesktop || isTablet)
              Flexible(
                flex: 1,
                child: Container()
              ),
            Flexible(
              flex: 3,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(
                    isMobile ? paddingSmall : paddingLarge
                   ),
                  child: Column(
                    mainAxisSize : MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/images/logo.svg',
                        height: 40,
                        semanticsLabel: 'logo'
                      ),
                      const SizedBox(height: defaultSized),
                      inputEmail(_email),
                      const SizedBox(height: defaultSized),
                      inputPassword(_password),
                      const SizedBox(height: defaultSized),
                      customElevatedButton(
                        text: "LOG IN",
                        color: secondaryColor,
                        onPressed: () async {
                          if (_formKey.currentState?.validate() == true) {
                            authProvider.login(
                              email: _email.text, 
                              password: _password.text
                            );
                          }
                        },                  
                      ),
                      const SizedBox(height: defaultSized),
                    ],
                  ),
                ),
              ),
            ),
            if(isDesktop || isTablet)
              Flexible(
                flex: isTablet ? 3 : 5,
                child: Container()
              ),            
          ],
        ),
      ),
    );
  }

  Column inputEmail(TextEditingController _controller) {
    return Column(
      children: [
        InputText(
          label: "Email",
          placeholder: "Your email",
          controller: _controller,
          onValidate: (value) {
            if (!EmailValidator.validate(value ?? '')) {
              return 'Email wrong';
            }
            return null;
          }
        ),
      ],
    );
  }

  InputText inputPassword(TextEditingController _controller) {
    return InputText(
      label: "Password",
      password: true,
      placeholder: "Your password",
      controller: _controller,
      onValidate: (value) {
        if (value.length == 0) {
          return 'Please enter password';
        }
        return null;
      }
    );
  }
}
