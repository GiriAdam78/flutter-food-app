// ignore_for_file: prefer_conditional_assignment, prefer_interpolation_to_compose_strings, unused_local_variable, unnecessary_null_comparison

part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signIn(String email, String password,
      {http.Client? client}) async {
    // ignore: prefer_const_constructors
    if (client == null) {
      client ??= http.Client();
    }

    String url = baseURL + 'login';
    var uri = Uri.parse(url);

    var response = await client.post(uri,
        headers: {"Content-Type": "application/json"},
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    return ApiReturnValue(value: value);
    // return ApiReturnValue(message: "Wrong Email or Password !");
  }

  static Future<ApiReturnValue<User>> signUp(User user, String password,
      {required File pictureFile, http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }
    String url = baseURL + 'register';

    var uri = Uri.parse(url);

    var response = await client.post(uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          'name': user.name,
          'email': user.email,
          'password': password,
          'password_confirmation': password,
          'address': user.address,
          'city': user.city,
          'houseNumber': user.houseNumber,
          'phoneNumber': user.phoneNumber
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);
    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    if (pictureFile != null) {
      ApiReturnValue<String> result =
          await uploadProfilePictureWeb(pictureFile);
      if (result.value != null) {
        value = value.copyWith(
            picturePath: "http://foodmarket-backend-video.test/storage/" +
                result.value!);
      }
    }
    return ApiReturnValue(value: value);
  }

  // Upload File Gambar
  static Future<ApiReturnValue<String>> uploadProfilePictureWeb(
      File pictureFile) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      Uint8List fileBytes = result.files.first.bytes!;
      String pictureFile = result.files.first.name;

      String url = baseURL + 'user/photo';
      var uri = Uri.parse(url);

      var request = http.MultipartRequest("POST", uri)
        ..headers["Authorization"] = "Bearer ${User.token}";

      var multipartFile = http.MultipartFile.fromBytes(
        'file',
        fileBytes,
        filename: pictureFile,
      );

      request.files.add(multipartFile);

      var response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        var data = jsonDecode(responseBody);

        String imagePath = data['data'][0];

        return ApiReturnValue(value: imagePath);
      } else {
        return ApiReturnValue(message: 'Uploading Profile Picture Failed');
      }
    }

    return ApiReturnValue(message: 'No file selected');
  }
}
