// ignore_for_file: depend_on_referenced_packages, duplicate_import, unused_local_variable, unused_import, prefer_interpolation_to_compose_strings

import 'dart:io';

import 'package:food_market_app/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_market_app/models/models.dart';
import 'package:food_market_app/services/services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String email, String password) async {
    ApiReturnValue<User> result = await UserServices.signIn(email, password);

    if (result.value != null) {
      emit(UserLoaded(result.value!));
    } else {
      emit(UserLoadingFailed(result.message!));
    }
  }

  Future<void> signUp(User user, String password,
      {required File pictureFile}) async {
    ApiReturnValue<User> result =
        await UserServices.signUp(user, password, pictureFile: pictureFile);

    if (result.value != null) {
      emit(UserLoaded(result.value!));
    } else {
      emit(UserLoadingFailed(result.message!));
    }
  }

  Future<void> uploadProfilePicture({required File pictureFile}) async {
    ApiReturnValue<String> result =
        await UserServices.uploadProfilePictureWeb(pictureFile);

    if (result.value != null) {
      emit(UserLoaded((state as UserLoaded).user.copyWith(
          picturePath:
              "http://foodmarket-backend-video/storage" + result.value!)));
    }
  }
}
