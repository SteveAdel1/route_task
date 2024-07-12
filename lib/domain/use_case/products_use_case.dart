import 'package:dartz/dartz.dart';
import '../../core/failure/failure.dart';
import '../../data/model/ProductsModel.dart';
import '../repo/repo.dart';

class ProductsUseCase{

  Repo repo;

  ProductsUseCase(this.repo);

  Future<Either<Failure, List<ProductsModel>>>execute() async{
    return await repo.productsRepo();
  }
}