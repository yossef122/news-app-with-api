import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Shared/components/components.dart';
import 'package:news_app/Shared/cubit/cubit.dart';
import 'package:news_app/Shared/cubit/states.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';
import 'package:responsive_builder/responsive_builder.dart';

class business_screen extends StatelessWidget {
  business_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var li = AppCubit.get(context).business;
    return BlocConsumer<AppCubit, appstates>(
        listener: (context, state) {},
        builder: (context, state) =>
            /* state is! Newgetbussinessloadingstate*/ AppCubit.get(context).business.length > 0
            ? ScreenTypeLayout(
          mobile: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
              child: BuildArticleItem(
                  AppCubit.get(context).business[index], context),
              onTap: () {
                Navigatorbuilder(
                  context,
                  WebViewScreen(
                      url: AppCubit.get(context).business[index]
                      ['url']));
              } /*;*/
              ,
            );
            },
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[400],
              ),
            ),
            itemCount: AppCubit.get(context).business.length),
          desktop:Row(
            children: [
              Expanded(
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Container(
                      color: /*AppCubit.get(context).businessIndex==index||*//*AppCubit.get(context).SelectebBussinessItem==true?*/Colors.red[250]/*:null*/,
                      child: InkWell(
                        child: BuildArticleItem(
                            AppCubit.get(context).business[index], context),
                        onTap: () {
                          AppCubit.get(context).SelectBusinessItem(index);
                          /*Navigatorbuilder(
                            context,
                            WebViewScreen(
                                url: AppCubit.get(context).business[index]
                                ['url']));*/
                        }/* ;*/ ,
                      ),
                    ),
                    separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey[400],
                      ),
                    ),
                    itemCount: AppCubit.get(context).business.length   ),
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  color: Colors.red,
                  child: Text('hello from egypt'),
                ),
              )
            ],
          ) ,
        )
            : const Center(child: CircularProgressIndicator()),

          );
        }
      }

/*class business_screen extends StatelessWidget {
  business_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var li = AppCubit.get(context).business ;
    return BlocConsumer<AppCubit, appstates>(
        listener: (context, state) {},
        builder: (context, state) => AppCubit.get(context).business.length > 0
            ? ScreenTypeLayout(
          mobile: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
              child: BuildArticleItem(
                  AppCubit.get(context).business[index], context),
              onTap: () {
                Navigatorbuilder(
                  context,
                  WebViewScreen(
                      url: AppCubit.get(context).business[index]
                      ['url']));
              } *//*;*//*
              ,
            );
            },
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[400],
              ),
            ),
            itemCount: AppCubit.get(context).business.length),
          desktop:Row(
            children: [
              Expanded(
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => BuildArticleItem2 (AppCubit.get(context).business[index],context,index),
                    separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey[400],
                      ),
                    ),
                    itemCount: AppCubit.get(context).business.length
                ),
              ),
              if(li.length >0)
              Expanded(
                child: Container(
                  height: double.infinity,
                  color: Colors.red,
                  child: Text('${li[AppCubit.get(context).businessIndex!]['description']!}'),
                ),
              )
            ],
          ) ,
        )
            : const Center(child: CircularProgressIndicator()),

          );
        }
      }*/
