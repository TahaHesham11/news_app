import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/bloc_observer.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/news_app/cubit/cubit.dart';
import 'package:news_app/news_app/cubit/states.dart';
import 'package:news_app/news_app/new_layout.dart';


void main() async{


  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  DioHelper.init();

 await CacheHelper.init();

bool? isDark = CacheHelper.getData(key: 'isDark');

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {

  final bool? isDark ;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness()..getScience()..getSports()..changeAppMode(
        fromShred: isDark
      ),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(

              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                  primarySwatch: Colors.deepOrange,
                  appBarTheme: AppBarTheme(
                    titleSpacing: 15.0,
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark,
                      ),
                      titleTextStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),
                      actionsIconTheme: IconThemeData(
                          color: Colors.black
                      ),
                    iconTheme: IconThemeData(
                      color: Colors.black
                    )

                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    unselectedItemColor: Colors.brown,
                    selectedItemColor: Colors.red,
                    elevation: 0.0,

                  ),
                  floatingActionButtonTheme: FloatingActionButtonThemeData(
                      backgroundColor: Colors.brown
                  ),
                  textTheme: TextTheme(
                      headline6: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,

                          color: Colors.black
                      )

                  )

              ),

              darkTheme: ThemeData(
                  primarySwatch: Colors.deepOrange,
                  scaffoldBackgroundColor: HexColor('333739'),
                  appBarTheme: AppBarTheme(
                      backgroundColor: HexColor('333739'),
                      elevation: 0.0,
                      titleSpacing: 15.0,
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: HexColor('333739'),
                        statusBarIconBrightness: Brightness.light,
                      ),
                      titleTextStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      ),
                      actionsIconTheme: IconThemeData(
                          color: Colors.white
                      ),
                      iconTheme: IconThemeData(
                          color: Colors.white
                      )

                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: HexColor('333739'),
                    unselectedItemColor: Colors.grey,
                    selectedItemColor: Colors.red,
                    elevation: 0.0,

                  ),
                  textTheme: TextTheme(
                      headline6: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      )

                  )

              ),
              themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,

              home: NewsLayoutScreen()
          );
        },
      ),
    );
  }
}


