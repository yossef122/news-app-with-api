import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Shared/components/components.dart';
import 'package:news_app/Shared/components/constants.dart';
import 'package:news_app/Shared/cubit/cubit.dart';
import 'package:news_app/Shared/cubit/states.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';

class search_screen extends StatelessWidget {
  search_screen({Key? key}) : super(key: key);
  var TEXTcONTROLLER = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, appstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextformfirldBuilder(
                  labelText: 'search ',
                  keyboard: TextInputType.text,
                  controller: TEXTcONTROLLER,
                  ValidateFunction: (value) {
                    if (value.isEmpty || value == null) {
                      return "search shouldn't be empty";
                    } else
                      IsSearch = true;
                    return null;
                  },
                  prefixIcon: Icons.search,
                  ValidateFunction2: (value) {
                    AppCubit.get(context).getsearch(value);
                  },

                ),
              ),
              Expanded(
                  child: list.length > 0
                      ? ListView.separated(
                          itemBuilder: (BuildContext context, int index) =>
                              InkWell(
                                  onTap: (){
                                    // Navigator.push(context, WebViewScreen(url: list[index]['url']));

                                    Navigatorbuilder(context,WebViewScreen(url: list[index]['url']));
                                  },
                                  child: BuildArticleItem(list[index], context),
                              ),
                          itemCount: AppCubit.get(context).search.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              mydivider())
                      : Center(
                          child: IsSearch == false
                              ? Container()
                              : CircularProgressIndicator()
                  )
              )
            ],
          ),
        );
      },
    );
  }
}
