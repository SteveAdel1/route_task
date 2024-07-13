import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task/core/services/web_service.dart';
import 'package:task/data/data_source/data_source.dart';
import 'package:task/data/data_source/data_source_imp.dart';
import 'package:task/data/model/ProductsModel.dart';
import 'package:task/data/repo_imp/repo_imp.dart';
import 'package:task/domain/repo/repo.dart';
import 'package:task/domain/use_case/products_use_case.dart';
import 'package:task/presentation/view_model/cubit.dart';

void main(){
test("getData", () async{

  //Arrange
  ProductsCubit productsCubit = ProductsCubit();
  //Act
   var  actual = await productsCubit.getData();
  //Assert
   expect(actual, true);
});
}