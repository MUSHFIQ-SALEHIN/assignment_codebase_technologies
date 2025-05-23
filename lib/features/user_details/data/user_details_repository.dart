import 'package:codebase_assignment/core/constants/urls.dart';
import 'package:codebase_assignment/core/utils/logger.dart';
import 'package:codebase_assignment/features/user_details/domain/user_detail_model.dart';
import 'package:dio/dio.dart';

abstract class IUserDetailsRepository {
  Future<UserDetailModel?> getUserDetails(String loginName);
}

class UserDetailsRepository implements IUserDetailsRepository {
  final Dio _dio;

  UserDetailsRepository(this._dio);

  @override
  Future<UserDetailModel?> getUserDetails(String loginName) async {
    try {
      final response = await _dio.get("${ApiEndpoints.users}/$loginName");
      UserDetailModel data = UserDetailModel.fromJson(response.data);
      return data;
    } on DioException catch (dioError, st) {
      final errorMessage =
          dioError.response?.data['error'] ??
          dioError.response?.data['message'] ??
          "Failed to check update type!";
      AppLogger.e(st.toString());
      throw Exception(errorMessage);
    } catch (e, st) {
      AppLogger.e(e.toString());
      AppLogger.e(st.toString());
      return null;
    }
  }
}
