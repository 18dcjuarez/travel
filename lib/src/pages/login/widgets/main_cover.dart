import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:travel/src/pages/login/widgets/signin_button.dart';
import 'package:travel/src/pages/login/widgets/text_logo.dart';

class MainCover extends StatelessWidget {
  const MainCover({Key? key, required this.loginPageController})
      : super(key: key);

  final PageController loginPageController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/reduced_login.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 90.h, horizontal: 50.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: TextLogo()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    'Discover more!',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
              Center(
                child: SigninButton(
                  loginPageController: loginPageController,
                ),
              )
            ],
          ),
        )
      ],
    );
    // return SliverAppBar(
    //   expandedHeight: 690.h,
    //   pinned: true,
    //   backgroundColor: Colors.white,
    //   flexibleSpace: LayoutBuilder(builder: (context, constraints) {
    //     double top = constraints.biggest.height;
    //     return top >= 690.h
    //         ? Stack(
    //             children: [
    //               Container(
    //                 width: double.infinity,
    //                 decoration: BoxDecoration(
    //                     image: DecorationImage(
    //                         image: AssetImage('assets/images/full_login.jpg'),
    //                         fit: BoxFit.cover,
    //                         alignment: Alignment.center)),
    //               ),
    //               Padding(
    //                 padding:
    //                     EdgeInsets.symmetric(vertical: 90.h, horizontal: 50.w),
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Center(child: TextLogo()),
    //                     Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           'Welcome',
    //                           style: Theme.of(context).textTheme.headline2,
    //                         ),
    //                         Text(
    //                           'Discover more!',
    //                           style: Theme.of(context).textTheme.headline4,
    //                         ),
    //                       ],
    //                     ),
    //                     Center(
    //                       child: SigninButton(),
    //                     )
    //                   ],
    //                 ),
    //               )
    //             ],
    //           )
    //         : PartialLoginCover();
    //   }),
    // );
  }
}
