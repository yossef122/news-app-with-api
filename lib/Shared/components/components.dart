import 'package:flutter/material.dart';
import 'package:news_app/Shared/cubit/cubit.dart';
// import 'package:news_app/modules/web_view/web_view_screen.dart';

Widget BuildArticleItem (article,context)=>Container(
  height: 180.0,
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 160.0,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image:/*article['urlToImage']!=null?*/ DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover
            ) /*: DecorationImage(
                image: AssetImage('assets/images.png'),
                fit: BoxFit.cover
            )*/,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text('${article['title']}' ,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: /*TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ,color: Colors.black)*/
                  Theme.of(context).textTheme.bodyText1
                  ,

                ),
              ),
              Text('${article['publishedAt']}' ,
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ,color: Colors.grey),

              )
            ],
          ),
        )
      ],
    ),
  ),
);
Widget BuildArticleItem2 (article,context,index) {
  return Container(
  color: AppCubit.get(context).businessIndex==index/*||AppCubit.get(context).SelectebBussinessItem==true*/?Colors.red[250]:null,
  child:   InkWell(
    onTap: (){
      AppCubit.get(context).SelectBusinessItem(index);
    },
    child:   Container(
      height: 180.0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160.0,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image:article['urlToImage']!=null? DecorationImage(
                    image: NetworkImage('${article['urlToImage']}'),
                    fit: BoxFit.cover
                ) : DecorationImage(
                    image: AssetImage('assets/images.png'),
                    fit: BoxFit.cover
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text('${article['title']}' ,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: /*TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ,color: Colors.black)*/
                      Theme.of(context).textTheme.bodyText1
                      ,

                    ),
                  ),
                  Text('${article['publishedAt']}' ,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ,color: Colors.grey),

                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  ),
);
}



Widget TextformfirldBuilder({
  required String labelText,
  IconData? prefixIcon,
  IconData? suffixIcon,
  required TextEditingController controller,
  required TextInputType keyboard,
  required ValidateFunction,
  required  ValidateFunction2,
  // required ValidateFunction3,
}) =>
    TextFormField(
      decoration: InputDecoration(
        label: Text("$labelText"),
        labelStyle: const TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
        border: const OutlineInputBorder(),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
      ),
      keyboardType: keyboard,
      controller: controller,
      validator: ValidateFunction,
      onChanged: ValidateFunction2,
      // onTap: ValidateFunction3,
    );


Future Navigatorbuilder(context,Widget) => Navigator.push( context, MaterialPageRoute(builder:(context)=> Widget));


Widget mydivider()=> Container(
  width: double.infinity,
  height: 1,
  color: Colors.grey[400],
);
