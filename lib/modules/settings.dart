import 'package:flutter/material.dart';
import 'package:flutter_app5/cubit/cubit.dart';
import 'package:flutter_app5/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingdLayout extends StatefulWidget {

  @override
  State<SettingdLayout> createState() => _SettingdLayoutState();
}

class _SettingdLayoutState extends State<SettingdLayout> {




  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appCubit, appState>(
      listener: (context, state) {},
      builder: (context, state) {
        appCubit cubit = appCubit.get(context);
        String selectValue = '${cubit.lang}';
        bool toggleTheme = cubit.isDark;

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.dark_mode),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Dark Mode',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Switch(
                    activeColor: Colors.deepOrange,
                    value: toggleTheme,
                    onChanged: (t){
                      setState(() {
                        toggleTheme = t;
                        cubit.changeThemeMode();
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.language),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Country News',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      style: Theme.of(context).textTheme.headline6,
                      value: selectValue,
                      onChanged: (String? v){
                        if(v is String){
                          setState(() {
                            selectValue = v;
                            cubit.changeLang(v);
                          });
                        }
                      },
                      items: [
                        DropdownMenuItem(child: Text('الإمارات'),value: 'ae'),
                        DropdownMenuItem(child: Text('المغرب'),value: 'ma'),
                        DropdownMenuItem(child: Text('مصر'),value: 'eg'),
                        DropdownMenuItem(child: Text('روسيا'),value: 'ru'),
                        DropdownMenuItem(child: Text('اوكرانيا'),value: 'ua'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
