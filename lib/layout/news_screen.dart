import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Shared/components/components.dart';
// import 'package:news_app/Shared/components/components.dart';

// import 'package:news_app/Shared/components/components.dart';
import 'package:news_app/Shared/components/constants.dart';
import 'package:news_app/Shared/cubit/cubit.dart';
import 'package:news_app/Shared/cubit/states.dart';
import 'package:news_app/modules/search_screen.dart';
// import 'package:news_app/modules/search_screen.dart';

// import 'package:news_app/modules/search_screen.dart';
// import 'package:news_app/Shared/cubit_change/cubit2.dart';
// import 'package:news_app/Shared/network/remotly/diohelper.dart';

class news_app extends StatelessWidget {
  const news_app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return /*BlocProvider(
      create: (BuildContext context) =>AppCubit()..getbusiness()..getsports()..getscience(),
      child:*/
        BlocConsumer<AppCubit, appstates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text("News App"),
            actions: [
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder:(context)=> search_screen()
                    //   ));

                    Navigatorbuilder(
                      context,
                      search_screen(),
                    );
                  }
                  ),
              IconButton(
                icon: Icon(Icons.brightness_4_rounded),
                onPressed: () {
                  AppCubit.get(context).changeMode();
                },
              )
            ],
          ),
          body: screens[current_Index],
          bottomNavigationBar: BottomNavigationBar(
            items: navbar,
            currentIndex: current_Index,
            selectedItemColor: Colors.deepOrange,
            onTap: (index) {
              AppCubit.get(context).Bottomnavbarchange(index);
            },
          )),

      // ),
    );
  }
}
