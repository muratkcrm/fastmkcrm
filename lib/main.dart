import 'package:easy_localization/easy_localization.dart';
import 'package:fastmkcrm/providers/userapi_provider.dart';
import 'package:fastmkcrm/screens/home_screen.dart';
import 'package:fastmkcrm/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('tr', 'TR')

        ],
        path: 'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('tr', 'TR'),
        child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Userapi_provider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale, //context.locale //context.deviceLocale
        title: "TitleFast".tr(),
        routes: {
          'login': (_) => LoginScreen(),
          'home': (_) => HomeScreen(),
        },
        initialRoute: 'login',
      ),
    );
  }
}
