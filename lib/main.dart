import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travel/src/pages/city/cities_page.dart';
import 'package:travel/src/pages/login/login_page.dart';
import 'package:travel/src/providers/auth_provider.dart';
import 'package:travel/src/providers/city_provider.dart';
import 'package:travel/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => CityProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        title: 'Travel App',
        debugShowCheckedModeBanner: false,
        theme: TraveTheme.theme,
        home: LoginPage(),
        routes: <String, WidgetBuilder>{
          LoginPage.id: (_) => LoginPage(),
          CitiesPage.id: (_) => CitiesPage(),
        },
      ),
    );
  }
}
