import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:travel/theme.dart';

class TravelMainButton extends StatefulWidget {
  TravelMainButton(
      {Key? key,
      required this.buttonTitle,
      required this.onPress,
      required this.enabled})
      : super(key: key);

  final String buttonTitle;
  final Function() onPress;
  final bool enabled;

  @override
  _TravelMainButtonState createState() => _TravelMainButtonState();
}

class _TravelMainButtonState extends State<TravelMainButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      onTap: widget.enabled ? widget.onPress : null,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: widget.enabled ? pink : grey),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: Text(
              widget.buttonTitle,
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
