// ignore_for_file: depend_on_referenced_packages, unused_import

import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:food_market_app/cubit/cubit.dart';
import 'package:food_market_app/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:food_market_app/services/services.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  Future<void> getFoods() async {
    ApiReturnValue<List<Food>> result = await FoodServices.getFoods();

    if (result.value != null) {
      emit(FoodLoaded(result.value!));
    } else {
      emit(FoodLoadingFailed(result.message!));
    }
  }
}
