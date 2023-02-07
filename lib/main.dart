import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/Shared/bloc_observe/bloc_observe.dart';
import 'package:news_app/Shared/cubit/cubit.dart';
import 'package:news_app/Shared/cubit/states.dart';

// import 'package:news_app/Shared/cubit/cubit.dart';
// import 'package:news_app/Shared/cubit/states.dart';
// import 'package:news_app/Shared/cubit_change/cubit2.dart';
// import 'package:news_app/Shared/cubit_change/states.dart';
import 'package:news_app/Shared/network/local/cachehelper.dart';
import 'package:news_app/Shared/network/remotly/diohelper.dart';
import 'package:news_app/layout/news_screen.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() async {
  // set manimize for window
  /*if (Platform.isAndroid) {
    await DesktopWindow.setMinWindowSize(Size(650.0, 500.0));
  }*/
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  diohelper.init();

  await cashehelper.init();

  // bool? isdark =cashehelper.getdata(key:"isDark");
  runApp(MyApp(cashehelper.getdata(key: "isDark")));
}

class MyApp extends StatelessWidget {
  final bool? isdark;

  MyApp(this.isdark);

  // MyApp(this.isdark, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /* BlocProvider(
      create: (BuildContext context) =>AppCubit()..getbusiness()..getsports()..getscience()),*/
        BlocProvider(
            create: (BuildContext context) => AppCubit()
              ..changeMode(fromchared: isdark)
              ..getbusiness()),
      ],
      // ..changeMode(fromchared:isdark)..getbusiness()..getscience()..getsports()
      child: BlocConsumer<AppCubit, appstates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            switchTheme: SwitchThemeData(
                thumbColor: MaterialStateProperty.all(Colors.deepOrange)),
            primarySwatch: Colors.deepOrange,
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange),
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              elevation: 0.0,
              color: Colors.white,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.dark,
                  statusBarColor: Colors.white),
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
              iconTheme: IconThemeData(color: Colors.black, size: 28),
            ),
            textTheme: const TextTheme(
              bodyText1: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 40.0),
          ),
          darkTheme: ThemeData(
            switchTheme: SwitchThemeData(
                thumbColor: MaterialStateProperty.all(HexColor('333739'))),
            primarySwatch: Colors.deepOrange,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: HexColor('333739')),
            scaffoldBackgroundColor: HexColor('333739'),
            appBarTheme: AppBarTheme(
              // backgroundColor: HexColor('333739'),
              elevation: 0.0,
              color: /*Colors.white*/ HexColor('333739'),
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light,
                  statusBarColor: HexColor('333739')),
              titleTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
              iconTheme: const IconThemeData(color: Colors.white, size: 28),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: HexColor('333739'),
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 40.0),
            textTheme: const TextTheme(
              bodyText1: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          themeMode:
              AppCubit.get(context).isdark ? ThemeMode.dark : ThemeMode.light,
          home: /*ScreenTypeLayout(
            mobile:*/ news_app(),
          /*breakpoints:ScreenBreakpoints(watch: 500, tablet: 500, desktop: 650 ) ,
            desktop: Scaffold(
              appBar: AppBar(),
              body: Container(
                color: Colors.white,
                child: Text('hello my friend'),
              ),
            ),*/
          ),
        ),
      // ),
      // ),
    );
  }
}
