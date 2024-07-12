import 'package:dartz/dartz.dart';
import 'package:task/core/failure/failure.dart';
import 'package:task/data/model/ProductsModel.dart';

abstract class Repo{

  Future<Either<Failure , List<ProductsModel>>>productsRepo();
}