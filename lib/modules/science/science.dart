
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Shared/components/components.dart';
import 'package:news_app/Shared/cubit/cubit.dart';
import 'package:news_app/Shared/cubit/states.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';


class science_screen extends StatelessWidget {
  science_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var li =AppCubit.get(context).business;
    return BlocConsumer<AppCubit, appstates>(
        builder: (context, state) =>
/* state is! Newgetscienceloadingstate*/AppCubit.get(context).science.length>0 ? ListView.separated(

            physics:BouncingScrollPhysics() ,
            itemBuilder:(context, index)=>

                InkWell(onTap:(){
                    Navigatorbuilder(
                        context,
                        WebViewScreen(
                          url: AppCubit.get(context).science[index]['url'],

                        )
                    );
                   }
                     ,
                    child: BuildArticleItem(AppCubit.get(context).science[index],context)
                ),
            separatorBuilder: (context,index)=> Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[400],
              ),
            ),
            itemCount: AppCubit.get(context).science.length):Center(child: CircularProgressIndicator()) ,

        listener: (context,state){});
  }
}
