import 'package:beauty_treatment_app/core/router.dart';
import 'package:beauty_treatment_app/moduels/home/cubit/cubit.dart';
import 'package:beauty_treatment_app/moduels/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/shared_helper.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedHelper.getUser();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()..getInfo(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'tajwal',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home:SplashScreen(),
        onGenerateRoute: onGenerateRoute,
        navigatorKey: navigatorKey,
        builder: (context, child) => SafeArea(child: Directionality(textDirection: TextDirection.rtl, child: child)),
      ),
    );
  }
}