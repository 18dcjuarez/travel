import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:travel/theme.dart';

class CitiesSelector extends StatelessWidget {
  const CitiesSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: null,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.black26,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Search category',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.w600,
                  )),
          SizedBox(
            width: 10.w,
          ),
          Icon(Icons.keyboard_arrow_down_rounded, color: white)
        ],
      ),
    );
  }
}
