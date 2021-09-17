import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:travel/theme.dart';

class SigninButton extends StatelessWidget {
  SigninButton({Key? key, required this.loginPageController}) : super(key: key);

  final PageController loginPageController;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => loginPageController.jumpToPage(1),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.white, width: 2),
        shape: RoundedRectangleBorder(),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        child: Container(
          padding: EdgeInsets.only(bottom: 3),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: pink, width: 2.0))),
          child: Text('Sign in',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.w600,
                  )),
        ),
      ),
    );
  }
}
