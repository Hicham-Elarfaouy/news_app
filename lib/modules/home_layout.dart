import 'package:flutter/material.dart';
import 'package:flutter_app5/components/elements.dart';
import 'package:flutter_app5/cubit/cubit.dart';
import 'package:flutter_app5/cubit/state.dart';
import 'package:flutter_app5/modules/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app5/modules/business.dart';
import 'package:flutter_app5/modules/science.dart';
import 'package:flutter_app5/modules/settings.dart';
import 'package:flutter_app5/modules/sports.dart';

class HomeLayout extends StatelessWidget {

  List<Widget> screens = [
    BusinessLayout(),
    SportsLayout(),
    ScienceLayout(),
    SettingdLayout(),
  ];

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<appCubit, appState>(
      listener: (context, state) {},
      builder: (context, state) {
        appCubit cubit = appCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                onPressed: (){
                  navigateTo(context, SearchScreen());
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
          body: screens[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 20,
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentindex,
            onTap: (index){
              cubit.changeBottomSheet(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.business_center),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports_soccer),
                label: 'Sports',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.science),
                label: 'Science',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        );
      }
    );
  }
}
