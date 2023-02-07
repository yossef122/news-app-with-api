
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Shared/components/constants.dart';
import 'package:news_app/Shared/cubit/states.dart';
import 'package:news_app/Shared/network/local/cachehelper.dart';
import 'package:news_app/Shared/network/remotly/diohelper.dart';

class AppCubit extends Cubit<appstates>{
  AppCubit():super(initialState());
 static AppCubit get(context)=>BlocProvider.of(context);

 void Bottomnavbarchange(int index){
   current_Index =index;
   if(current_Index==1)
      getsports();
   else if(index ==2)
     getscience();
   emit(Bottomnavbarchangestate());
 }
  List<dynamic> business =[];
   int? businessIndex ;
   List<bool> SelectebBussinessItem=[] ;

  getbusiness(){
   emit(Newgetbussinessloadingstate());
   diohelper.get(
       path: 'v2/top-headlines',
       qurery: {
         'country':'eg',
         'category':'business',
         'apiKey':'72288b3259c1493a8dece41483b7a18e',
       }).then((value) {
         business =value.data['articles'];
         business.forEach((element) {
           SelectebBussinessItem.add(false);
         });
         print(business.length);
     emit(Newgetbussinessuccessedstate());
   }).catchError((e) {
     emit(Newgetbussineerrorstate(e.toString()));
     print(e.toString());
   });

 }

 SelectBusinessItem(int index ){
   businessIndex=index;
   // SelectebBussinessItem[index]=true;
   emit(NewChangeBusinessIndexstate());
 }

  List<dynamic> sports =[];

  getsports(){
    emit(Newgetbussinessloadingstate());
    if(sports.length==0) {
      diohelper.get(
          path: 'v2/top-headlines',
          qurery: {
            'country': 'eg',
            'category': 'sports',
            'apiKey': '72288b3259c1493a8dece41483b7a18e',
          }).then((value) {
        sports = value.data['articles'];
        print(sports.length);
        emit(Newgetsportssuccessedstate());
      }).catchError((e) {
        emit(Newgetsportserrorstate(e.toString()));
        print(e.toString());
      });
    } else{
      emit(Newgetsportssuccessedstate());
    }


  }


  List<dynamic> science =[];

  getscience(){
    emit(Newgetscienceloadingstate());
    if(science.length==0) {
      diohelper.get(
          path: 'v2/top-headlines',
          qurery: {
            'country': 'eg',
            'category': 'science',
            'apiKey': '72288b3259c1493a8dece41483b7a18e',

          }).then((value) {
        science = value.data['articles'];
        print(science.length);
        emit(Newgetsciencesuccessedstate());
      }).catchError((e) {
        emit(Newgetscienceerrorstate(e.toString()));
        print(e.toString());
      });
    }
    else{
      emit(Newgetsciencesuccessedstate());
    }

  }


List<dynamic> search =[];

  getsearch(String value){
    emit(Newgetscienceloadingstate());
    // search =[];
      diohelper.get(
          path: 'v2/everything',
          qurery: {
            'q': '$value',
            'apiKey': 'da2606829d9c47b6ad83f3b83b58a3c6',
          }).then((value) {
        search = value.data['articles'];
        // print(search.length);
        emit(Newgetsearchsuccessedstate());
      }).catchError((e) {
        emit(Newgetsearcherrorstate(e.toString()));
        print(e.toString());
      });

      emit(Newgetsearchsuccessedstate());

  }


  bool isdark =false;

 void changeMode({
    bool? fromchared}){
    if(fromchared != null) {
      isdark = fromchared;
      emit(Newthememodegstate());
    }
    else {
      isdark = !isdark;
      print("Newthememodegstate  11111");
      cashehelper.putboolean(key: "isDark", value: isdark).then((value) {
        emit(Newthememodegstate());
      });
    }
  }


}