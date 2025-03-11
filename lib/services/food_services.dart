part of 'services.dart';

class FoodServices {
  static Future<ApiReturnValue<List<Food>>> getFoods() async {
    // ignore: prefer_const_constructors
    await Future.delayed(Duration(milliseconds: 500));

    return ApiReturnValue(value: mockFoods);
  }
}
