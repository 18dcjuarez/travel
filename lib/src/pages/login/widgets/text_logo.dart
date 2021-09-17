import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;

class TextLogo extends StatelessWidget {
  const TextLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 40.w),
          child: Text(
            'Find',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 70.w),
          child: Text(
            'Out',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ],
    );
  }
}
