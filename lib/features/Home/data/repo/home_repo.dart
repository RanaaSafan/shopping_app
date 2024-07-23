

import 'package:animal_app/features/Home/data/models/product.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failers.dart';

abstract class HomeRepo{

  Future<Either<failers,List<Product>>> FetchProductCategory(String category);
  Future<Either<failers,List<Product>>> FetchProduct();
}