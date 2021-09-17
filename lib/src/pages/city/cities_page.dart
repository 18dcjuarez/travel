import 'package:flutter/material.dart';
import 'package:travel/src/pages/city/widgets/cities_selector.dart';
import 'package:travel/src/pages/city/widgets/view_item.dart';
import 'package:travel/src/providers/city_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;

class CitiesPage extends StatefulWidget {
  static const String id = "/cities";
  CitiesPage({Key? key}) : super(key: key);

  @override
  _CitiesPageState createState() => _CitiesPageState();
}

class _CitiesPageState extends State<CitiesPage> {
  @override
  void initState() {
    Future.microtask(() => context.read<CityProvider>().getCities());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cityProviderWatcher = context.watch<CityProvider>();

    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/placeholder_bg.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center)),
        ),
        cityProviderWatcher.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.only(top: 50.h, left: 30.w, right: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [CitiesSelector(), ViewItem()],
                    ),
                  ],
                )),
      ],
    );
  }
}
