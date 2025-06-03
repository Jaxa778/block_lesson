import 'package:block_lesson/logic/product/product_bloc.dart';
import 'package:block_lesson/service/api_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Singleton - butun dastur davomida bir xil instance
  getIt.registerSingleton<ApiService>(ApiService());

  getIt.registerFactory(() => ProductBloc(getIt<ApiService>()));
}
