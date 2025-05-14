abstract class ICommonAreaRepository {
  Future<List<CommonLocationModel>> getCommonLocations(
    String endpoint,
    int perPage,
    int pageNumber,
    int areaId,
  );
  Future<List<AreaModel>> getCommonAreas();
}

class CommonAreaRepository implements ICommonAreaRepository {
  final Dio _dio;

  CommonAreaRepository(this._dio);

  @override
  Future<List<CommonLocationModel>> getCommonLocations(
    String endpoint,
    int perPage,
    int pageNumber,
    int areaId,
  ) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: {
          'per_page': perPage,
          'page': pageNumber,
          // if (!endpoint.contains("qurbanis")) 'area_id': areaId
        },
      );
      List<dynamic> data = response.data;
      return commonLocationListFromJson(data);
    } catch (e, st) {
      AppLogger.e(e.toString());
      AppLogger.e(st.toString());
      throw Exception('Failed to load common locations');
    }
  }

  @override
  Future<List<AreaModel>> getCommonAreas() async {
    try {
      final response = await _dio.get("/pilgrim/locations");
      return (response.data as List)
          .map((json) => AreaModel.fromJson(json))
          .toList();

      /* return ([
        {
          "id": 1,
          "title_en": "Makkah",
          "title_bn": "মক্কা",
          "lat": 21.3891,
          "long": 39.8579
        },
        {
          "id": 2,
          "title_en": "Madina",
          "title_bn": "মদিনা",
          "lat": 24.5247,
          "long": 39.5692
        },
        {
          "id": 3,
          "title_en": "Mina",
          "title_bn": "মিনা",
          "lat": 21.4117,
          "long": 39.8949
        }
      ]).map((json) => AreaModel.fromJson(json)).toList(); */
    } catch (e, st) {
      AppLogger.e(e.toString());
      AppLogger.e(st.toString());
      return [
        {
          "id": 1,
          "title_en": "Makkah",
          "title_bn": "মক্কা",
          "lat": 21.3891,
          "long": 39.8579,
        },
        {
          "id": 2,
          "title_en": "Madina",
          "title_bn": "মদিনা",
          "lat": 24.5247,
          "long": 39.5692,
        },
        {
          "id": 3,
          "title_en": "Mina",
          "title_bn": "মিনা",
          "lat": 21.4117,
          "long": 39.8949,
        },
      ].map((area) => AreaModel.fromJson(area)).toList();
      // throw Exception('Failed to load common areas');
    }
  }
}
