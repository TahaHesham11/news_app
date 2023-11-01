import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business_screen.dart';
import 'package:news_app/modules/science_screen.dart';
import 'package:news_app/modules/sports_screen.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/news_app/cubit/states.dart';


class NewsCubit extends Cubit<NewsStates> {

  NewsCubit () : super (NewsInitialStates());

  static NewsCubit get(context)=>BlocProvider.of(context);


int current = 0;

List<Widget> screens = [
  BusinessScreen(),
  SportsScreen(),
  ScienceScreen(),
];

List<String> titles = [

  'Business ',
  'Sports',
  'Science'
];

void changeNavBar(index){

  current = index;
  emit(NewsChangeNavBarStates());
}


List<dynamic> business =[];

void getBusiness(){
  emit(NewsGetBusinessLoadingStates());
  DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'us',
        'category':'business',
        'apiKey':'b98a842bfe1f44f4a80fd99c2aa1392f',
      }).then((value) {

        business = value.data['articles'];
        print(business[0]['title']);
        emit(NewsGetBusinessSuccessStates());

  }).catchError((error){
    print(error.toString());
    emit(NewsGetBusinessErrorStates(error.toString()));
  });
}


List<dynamic> sports =[];

void getSports(){

  emit(NewsGetScienceLoadingStates());
  DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'us',
        'category':'sports',
        'apiKey':'b98a842bfe1f44f4a80fd99c2aa1392f'
      }).then((value) {

        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessStates());
  }).catchError((error){

    print(error.toString());
    emit(NewsGetSportsErrorStates(error.toString()));

  });
}

  List<dynamic> science =[];

  void getScience(){

    emit(NewsGetScienceLoadingStates());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'science',
          'apiKey':'b98a842bfe1f44f4a80fd99c2aa1392f'
        }).then((value) {

      science = value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSuccessStates());
    }).catchError((error){

      print(error.toString());
      emit(NewsGetScienceErrorStates(error.toString()));

    });
  }

  List<dynamic> search = [];

  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingStates());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'q': '$value',
          'apiKey':'b98a842bfe1f44f4a80fd99c2aa1392f'
        }).then((value) {
       search = value.data['articles'];
       emit(NewsGetSearchSuccessStates());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorStates(error.toString()));
    });
  }

  bool isDark = false;

  void changeAppMode({
  bool? fromShred
})
  {
    if(fromShred != null)
      isDark = fromShred;
      else
    isDark = !isDark;
    CacheHelper.putData(
        key: 'isDark',
        value: isDark).then((value) {

      emit(NewsChangeAppModeStates());

    });
  }

}