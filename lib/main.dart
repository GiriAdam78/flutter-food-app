// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_market_app/cubit/cubit.dart';
import 'package:food_market_app/models/models.dart';
import 'package:get/get.dart';
import 'ui/pages/pages.dart';

void main() {
  runApp(MainApp());
}

// ignore: use_key_in_widget_constructors
class MainApp extends StatelessWidget {
  @override
  Widget build(
    BuildContext context,
  ) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<UserCubit>(create: (_) => UserCubit()),
          BlocProvider<FoodCubit>(create: (_) => FoodCubit()),
          BlocProvider<TransactionCubit>(create: (_) => TransactionCubit()),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignInPage(),
        ));
  }
}
