import 'package:codebase_assignment/core/constants/urls.dart';
import 'package:codebase_assignment/core/utils/logger.dart';
import 'package:codebase_assignment/features/landing/domain/user_model.dart';
import 'package:dio/dio.dart';

abstract class ILandingRepository {
  Future<List<UserModel>> getUsers(int perPage, int pageNumber);
}

class LandingRepository implements ILandingRepository {
  final Dio _dio;

  LandingRepository(this._dio);

  @override
  Future<List<UserModel>> getUsers(int perPage, int pageNumber) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.users,
        queryParameters: {'per_page': perPage, 'page': pageNumber},
      );
      List<dynamic> data = response.data;
      return getUserListFromJson(data);
    } catch (e, st) {
      AppLogger.e(e.toString());
      AppLogger.e(st.toString());
      throw Exception('Failed to get users.');
    }
  }
}
