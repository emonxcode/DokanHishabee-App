import 'package:flutter_riverpod/flutter_riverpod.dart';

var categoryProvider = StateNotifierProvider<CategoryController, CategoryState>(
    (ref) => CategoryController(ref: ref));

class CategoryState {}

class CategoryController extends StateNotifier<CategoryState> {
  CategoryController({required this.ref}) : super(CategoryState());

  Ref ref; 
  
  
}
