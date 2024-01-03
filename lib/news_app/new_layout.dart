import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/components.dart';
import 'package:news_app/modules/search_screen.dart';
import 'package:news_app/news_app/cubit/cubit.dart';
import 'package:news_app/news_app/cubit/states.dart';


class NewsLayoutScreen extends StatelessWidget {
  const NewsLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
               cubit.titles[cubit.current]
            ),

            actions: [
              IconButton(
                  onPressed: (){
                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: (){
                    NewsCubit.get(context).changeAppMode();

                  },
                  icon: Icon(Icons.brightness_4_outlined)),

            ],
          ),


          body: cubit.screens[cubit.current],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              cubit.changeNavBar(index);
            },
            currentIndex: cubit.current,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.business), label: 'business'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports), label: 'Sports'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.science), label: 'Science'),

            ],
          ),


        );
      },
    );
  }
}
