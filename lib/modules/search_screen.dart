import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/components.dart';
import 'package:news_app/news_app/cubit/cubit.dart';
import 'package:news_app/news_app/cubit/states.dart';


class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {

        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultField(
                    controller: searchController,
                    type: TextInputType.text,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Search must not be empty';
                      } else {
                        return null;
                      }
                    },
                    label: 'Search',
                    onChange: (String value){
                      NewsCubit.get(context).getSearch(value);
                    },
                    prefix: Icons.search),
              ),


              Expanded(child: articleBuilder(list,isSearch: true))
            ],
          ),
        );
      },
    );
  }
}
