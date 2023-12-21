import 'package:flutter_riverpod/flutter_riverpod.dart';

var productsProvider = StateNotifierProvider<ProductsController, ProductsState>(
    (ref) => ProductsController(ref: ref));

class ProductsState {}

class ProductsController extends StateNotifier<ProductsState> {
  ProductsController({required this.ref}) : super(ProductsState());

  Ref ref;
}
