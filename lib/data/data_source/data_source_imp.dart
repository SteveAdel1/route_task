import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:task/core/constants/constants.dart';

import 'data_source.dart';

class DataSourceImp implements DataSource{

  Dio dio;
  DataSourceImp(this.dio);

  @override
  Future<Response> getData() async{
    return await dio.get(Constants.baseURL+Constants.endPoint);
  }

}