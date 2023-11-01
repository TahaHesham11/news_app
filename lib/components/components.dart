import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view_screen.dart';


Widget defaultField({

  required TextEditingController  controller,

  required TextInputType type,

  required String? Function (String? value) validate,

  required String label,

  required  IconData  prefix ,

  bool isPassword = false,

  IconData? suffix,


  Function? onTap,

  bool isClickabe = true,

  Function? onChange,

  Function? suffixPressed,

  Function? onSubmit,


}) =>              TextFormField(


  controller: controller,
  keyboardType:type ,

  onFieldSubmitted: (String value) {
    onSubmit!(value);
  },

  onChanged: (String value){
    onChange?.call(value);
  },
  validator: validate,

  onTap:(){
    onTap?.call();
  } ,

  obscureText: isPassword,
  decoration: InputDecoration(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)

    ),
    labelText: label,
    enabled: isClickabe,
    prefixIcon: Icon(prefix),

    suffixIcon: IconButton(
        onPressed: (){
          suffixPressed!();
        },

        icon: Icon(suffix)),

  ),

);

void navigateTo (context,Widget) =>    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Widget)
);



Widget buildArticleItem(article,context)=> InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen('${article['url']}'));
  },
  child:   Padding(

    padding: const EdgeInsets.all(15.0),

    child: Row(

      children: [

        Container(

          width: 150.0,

          height: 150.0,

          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10.0),

              image: DecorationImage(

                  image: NetworkImage(

                    '${article['urlToImage']}',



                  ),

                  fit: BoxFit.cover

              )

          ),

        ),

        SizedBox(width: 20.0,),

        Expanded(

          child: Container(

            height: 150.0,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                Expanded(

                  child: Text(

                     '${article['title']}',

                    overflow: TextOverflow.ellipsis,

                    maxLines: 3,

                    style: Theme.of(context).textTheme.headline6

                  ),

                ),



                Text(

                  '${article['publishedAt']}',



                  style: TextStyle(

                      fontSize: 10.0,

                      color: Colors.grey

                  ),

                ),

              ],

            ),

          ),

        )

      ],

    ),

  ),
);


Widget articleBuilder(list,{isSearch = false})=>ConditionalBuilder(
    condition:list.length > 0 ,
    builder: (context) => ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context,index)=>buildArticleItem(list[index],context),
      separatorBuilder: (context,index)=> Container(
        height: 1,
        color: Colors.grey,
      ),
      itemCount: list.length,
    ),
    fallback: (context) => isSearch ? Container() : Center(child: CircularProgressIndicator()));