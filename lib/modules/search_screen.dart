import 'package:flutter/material.dart';
import 'package:flutter_app5/components/elements.dart';
import 'package:flutter_app5/cubit/cubit.dart';
import 'package:flutter_app5/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => appCubit(),
        child: BlocConsumer<appCubit, appState>(
          listener: (context, state) {},
          builder: (context, state) {
            List<dynamic> list = appCubit.get(context).search;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    onChanged: (v){
                      appCubit.get(context).getSearchData(value: v);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'search',
                    ),
                  ),
                ),
                Expanded(child: ListArticle(list: list,isSearch: true)),
              ],
            );
          },
        ),
      ),
    );
  }
}
