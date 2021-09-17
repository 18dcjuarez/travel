import 'package:flutter/material.dart';
import 'package:travel/src/pages/city/cities_page.dart';
import 'package:travel/src/pages/login/widgets/input_field.dart';
import 'package:travel/src/pages/login/widgets/text_logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:travel/src/providers/auth_provider.dart';
import 'package:travel/src/widgets/travel_flushbar.dart';
import 'package:travel/src/widgets/travel_main_button.dart';
import 'package:provider/provider.dart';

class PartialLoginCover extends StatelessWidget {
  const PartialLoginCover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    var authProviderWatcher = context.watch<AuthProvider>();
    var authProviderReader = context.read<AuthProvider>();

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 400.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0)),
              image: DecorationImage(
                  image: AssetImage('assets/images/reduced_login.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center)),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: 90.h, left: 50.w, right: 50.w, bottom: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: TextLogo()),
                SizedBox(
                  child: Container(
                    height: 80.h,
                  ),
                ),
                Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text('Swipe to go back'),
                Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.white,
                  size: 50.h,
                ),
                SizedBox(
                  height: 50.h,
                ),
                InputField(
                  isPassField: false,
                  controller: emailController,
                  inputLabel: 'ejemplo@findout.com',
                  onChanged: authProviderReader.emailValidate,
                ),
                InputField(
                  isPassField: true,
                  controller: passwordController,
                  inputLabel: '*******',
                  onChanged: authProviderReader.passwordValidate,
                ),
                Text(
                  'Forgot password?',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 40.h,
                ),
                TravelMainButton(
                  buttonTitle: 'Sign in',
                  enabled: authProviderWatcher.emailCheck &&
                      authProviderWatcher.passwordCheck,
                  onPress: () {
                    onLogin(context, authProviderWatcher);
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  void onLogin(BuildContext context, AuthProvider authProviderWatcher) {
    final AuthProvider authProvider = new AuthProvider();
    final res = authProvider.login(
        authProviderWatcher.emailString, authProviderWatcher.passwordString);
    if (res == null) {
      TravelFlushbar.showCorpBar(
          context, 'ERROR', 'currió un error inesperado, contacta a soporte');
    }
    if (!res!.success!) {
      TravelFlushbar.showCorpBar(
          context,
          'Error',
          res.statusCode == 401
              ? 'Usuario y/o contraseña incorrectos'
              : res.message);
      return;
    }
    Navigator.pushNamedAndRemoveUntil(context, CitiesPage.id, (route) => false);
  }
}
