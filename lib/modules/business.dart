import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app5/components/elements.dart';
import 'package:flutter_app5/cubit/cubit.dart';
import 'package:flutter_app5/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessLayout extends StatelessWidget {
  const BusinessLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appCubit()..getBusinessData(appCubit.get(context).lang),
      child: BlocConsumer<appCubit, appState>(
        listener: (context, state) {},
        builder: (context, state) {
          List<dynamic> list = appCubit.get(context).listBusiness;

          return ListArticle(list: list);
        },
      ),
    );
  }
}
