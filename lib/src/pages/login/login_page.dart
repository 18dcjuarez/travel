import 'package:flutter/material.dart';
import 'package:travel/src/pages/login/widgets/main_cover.dart';
import 'package:travel/src/pages/login/widgets/partial_login_cover.dart';

class LoginPage extends StatelessWidget {
  static const String id = "/login";
  LoginPage({Key? key}) : super(key: key);

  final PageController loginPageController = PageController(keepPage: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: loginPageController,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        children: [
          MainCover(
            loginPageController: loginPageController,
          ),
          PartialLoginCover()
        ],
      ),
    );
    // return Scaffold(
    //   body: CustomScrollView(
    //     physics: BouncingScrollPhysics(),
    //     slivers: <Widget>[
    //       MainCover(),
    //       SliverList(
    //         delegate: SliverChildListDelegate([
    //           Center(
    //             child: Text(
    //               'HEEEEY',
    //               style: TextStyle(color: Colors.red),
    //             ),
    //           ),
    //           Center(
    //             child: Text(
    //               'HEEEEY',
    //               style: TextStyle(color: Colors.red),
    //             ),
    //           ),
    //           Center(
    //             child: Text(
    //               'HEEEEY',
    //               style: TextStyle(color: Colors.red),
    //             ),
    //           ),
    //           Center(
    //             child: Text(
    //               'HEEEEY',
    //               style: TextStyle(color: Colors.red),
    //             ),
    //           ),
    //           Center(
    //             child: Text(
    //               'HEEEEY',
    //               style: TextStyle(color: Colors.red),
    //             ),
    //           ),
    //           Center(
    //             child: Text(
    //               'HEEEEY',
    //               style: TextStyle(color: Colors.red),
    //             ),
    //           ),
    //           Center(
    //             child: Text(
    //               'HEEEEY',
    //               style: TextStyle(color: Colors.red),
    //             ),
    //           ),
    //           Center(
    //             child: Text(
    //               'HEEEEY',
    //               style: TextStyle(color: Colors.red),
    //             ),
    //           ),
    //           Center(
    //             child: Text(
    //               'HEEEEY',
    //               style: TextStyle(color: Colors.red),
    //             ),
    //           ),
    //           Center(
    //             child: Text(
    //               'HEEEEY',
    //               style: TextStyle(color: Colors.red),
    //             ),
    //           ),
    //           Center(
    //             child: Text(
    //               'HEEEEY',
    //               style: TextStyle(color: Colors.red),
    //             ),
    //           ),
    //           Center(
    //             child: Text(
    //               'HEEEEY',
    //               style: TextStyle(color: Colors.red),
    //             ),
    //           ),
    //           Center(
    //             child: Text(
    //               'HEEEEY',
    //               style: TextStyle(color: Colors.red),
    //             ),
    //           ),
    //         ]),
    //       )
    //     ],
    //   ),
    // );
  }

  dynamic pageChange(PageController loginPageController) {
    loginPageController.jumpToPage(1);
  }
}
