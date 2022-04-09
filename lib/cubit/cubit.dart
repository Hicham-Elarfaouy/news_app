import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app5/components/cache_helper.dart';
import 'package:flutter_app5/components/dio_helper.dart';
import 'package:flutter_app5/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class appCubit extends Cubit<appState>{
  appCubit() : super(stateInitiale());

  static appCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;

  void changeBottomSheet(@required int index){
    currentindex = index;
    emit(stateBottomSheet());
  }

  List<dynamic> listBusiness = [];

  void getBusinessData(var lang){
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'$lang',
        'category':'technology',
        'apikey':'ac1a48af129d41d38c293541fdda3a90',
      },
    ).then((value) {
      listBusiness = value.data['articles'];
      print(listBusiness.length.toString());
      emit(stateGetBusinessData());
    }).catchError((onError){
      print(onError.toString());
    });
  }

  List<dynamic> listSports = [];

  void getSportsData(var lang){
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'$lang',
        'category':'sports',
        'apikey':'ac1a48af129d41d38c293541fdda3a90',
      },
    ).then((value) {
      listSports = value.data['articles'];
      print(listSports.length.toString());
      emit(stateGetSportsData());
    }).catchError((onError){
      print(onError.toString());
    });
  }

  List<dynamic> listScience = [];

  void getScienceData(var lang){
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'$lang',
        'category':'science',
        'apikey':'ac1a48af129d41d38c293541fdda3a90',
      },
    ).then((value) {
      listScience = value.data['articles'];
      print(listScience.length.toString());
      emit(stateGetScienceData());
    }).catchError((onError){
      print(onError.toString());
    });
  }

  List<dynamic> search = [];

  void getSearchData({required String value}){
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q':'$value',
        'apikey':'ac1a48af129d41d38c293541fdda3a90',
      },
    ).then((value) {
      search = value.data['articles'];
      print(search.length.toString());
      emit(stateGetSearchData());
    }).catchError((onError){
      print(onError.toString());
    });
  }

  bool isDark = false;

  void changeThemeMode({bool? theme}){
    if(theme != null){
      isDark = theme;
      emit(stateThemeMode());
    }else{
      isDark = !isDark;
      CacheHelper.putShared(key: 'key', value: isDark).then((value) {
        emit(stateThemeMode());
      });
    }

  }

  String lang = 'ae';

  void changeLang(String lang){
    this.lang = lang;
    emit(statechangeLang());
  }
}