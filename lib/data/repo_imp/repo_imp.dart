import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task/core/failure/failure.dart';
import 'package:task/core/failure/server_failure.dart';
import 'package:task/data/data_source/data_source.dart';
import 'package:task/data/model/ProductsModel.dart';
import 'package:task/domain/repo/repo.dart';

class RepoImp implements Repo{
  DataSource dataSource;
  RepoImp(this.dataSource);

  @override
  Future<Either<Failure, List<ProductsModel>>> productsRepo() async{
    try{
      var response =await dataSource.getData();
      if(response.statusCode == 200){
      List<ProductsModel>list = [];
      var data = response.data["products"] as List ;
      for(var e in data){
        list.add(ProductsModel.fromjson(e));
      }
      print(response.data);
      return right(list);
      }
      else {
        return left(ServerFailure(statusCode: response.statusCode.toString()));
      }
    }on DioException catch(e){
      return left(ServerFailure(statusCode: e.response!.statusCode.toString()));
    }

  }

}