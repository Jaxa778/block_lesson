import 'package:block_lesson/data/models/product_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  late Dio _dio;

  ApiService() {
    _dio = Dio();

    //Base URL o'rnatish
    _dio.options.baseUrl = "https://fakestoreapi.com";

    //Timeout o'rnatish
    _dio.options.connectTimeout = Duration(
      seconds: 10,
    ); // 10 seconds in milliseconds
    _dio.options.receiveTimeout = Duration(
      seconds: 10,
    ); // 10 seconds in milliseconds
  }

  Future<List<ProductModel>> getProducts() async {
    try {
      Response response = await _dio.get("/products");
      final data = response.data;
      if (data is List) {
        return data.map((item) => ProductModel.fromMap(item)).toList();
      } else {
        throw Exception("Unexpected response format");
      }
    } on DioException catch (e) {
      throw Exception("Failed to load products: ${e.message}");
    }
  }
}
