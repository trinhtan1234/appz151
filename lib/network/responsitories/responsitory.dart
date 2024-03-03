import 'package:dio/dio.dart';

import '../../login/screen_login.dart';
import '../models/info_user_model.dart';
import '../models/suachua_model.dart';

class UserProfileRepository {
  Future<UserProfile?> getUserProfile() async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(
          'http://36.50.63.16:3005/v1/user/profile',
          options: Options(
              headers: {"authorization": "Bearer ${ScreenLoginState.token}"}));
      final dataResponse = response.data;
      if (dataResponse != null) {
        return UserProfile.fromJson(dataResponse); // Use correct class name
      }
      return null;
    } catch (error) {
      rethrow; // Rethrow for further handling if needed
    }
  }
}

class TienDoRepository {
  Future<XeSuaChua?> getTienDo() async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(
          'http://36.50.63.16:3005/v1/customer/tien-do-sua-chua',
          options: Options(
              headers: {"authorization": "Bearer ${ScreenLoginState.token}"}));
      final dataResponse = response.data;
      if (dataResponse != null) {
        return XeSuaChua.fromJson(dataResponse);
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }
}
