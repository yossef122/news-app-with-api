
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Shared/components/components.dart';
import 'package:news_app/Shared/cubit/cubit.dart';
import 'package:news_app/Shared/cubit/states.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';


class sports_screen extends StatelessWidget {
  sports_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var li =AppCubit.get(context).business;
    return BlocConsumer<AppCubit, appstates>(
        builder: (context, state) =>
       /* state is! Newgetsportsloadingstate*/AppCubit.get(context).sports.length>0 ? ListView.separated(
            physics:BouncingScrollPhysics() ,
            itemBuilder:(context, index)=>
                InkWell(
                    onTap:()=>
                        Navigatorbuilder(
                            context,
                            WebViewScreen(
                              url: AppCubit.get(context).sports[index]['url'],

                            ))
                ,child: BuildArticleItem(AppCubit.get(context).sports[index],context)),
            separatorBuilder: (context,index)=> Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[400],
              ),
            ),
            itemCount: AppCubit.get(context).sports.length):Center(child: CircularProgressIndicator()) ,

        listener: (context,state){});
  }
}
