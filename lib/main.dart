// @dart=2.9
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app5/components/cache_helper.dart';
import 'package:flutter_app5/components/dio_helper.dart';
import 'package:flutter_app5/cubit/cubit.dart';
import 'package:flutter_app5/cubit/state.dart';
import 'package:flutter_app5/modules/home_layout.dart';
import 'package:flutter_app5/modules/settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
        () {
      // Use blocs...
    },
    blocObserver: MyBlocObserver(),
  );
  DioHelper.init();
  await CacheHelper.init();
  bool theme = CacheHelper.getShared(key: 'key');

  runApp(MyApp(theme));
}

class MyApp extends StatelessWidget {
  final bool theme;
  MyApp(this.theme);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appCubit()..changeThemeMode(theme : theme),
      child: BlocConsumer<appCubit, appState>(
          listener: (context, state) {},
          builder: (context, state) {
            appCubit cubit = appCubit.get(context);

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                brightness: Brightness.light,
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.white,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                ),
              ),
              darkTheme: ThemeData(
                primarySwatch: Colors.deepOrange,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(

                  selectedItemColor: Colors.deepOrange,
                ),
                brightness: Brightness.dark,
              ),
              themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
              home: HomeLayout(),
            );
          }
      ),
    );
  }
}
