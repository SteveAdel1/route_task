import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/services/web_service.dart';
import 'package:task/data/data_source/data_source.dart';
import 'package:task/data/data_source/data_source_imp.dart';
import 'package:task/data/repo_imp/repo_imp.dart';
import 'package:task/domain/repo/repo.dart';
import 'package:task/domain/use_case/products_use_case.dart';
import 'package:task/presentation/view_model/states.dart';

class ProductsCubit extends Cubit<States>{
  ProductsCubit():super(LoadingState());

  final WebServices _services = WebServices();
  late DataSource dataSource;
  late Repo repo;
  late ProductsUseCase productsUseCase;
  Future<bool> getData() async{

    emit(LoadingState());
    dataSource = DataSourceImp(_services.freeDio);
    repo = RepoImp(dataSource);
    productsUseCase = ProductsUseCase(repo);
    var result = await productsUseCase.execute();


    return result.fold(
            (fail){
          emit(ErrorStates());
          return Future.value(false);
        }
         ,
        (data){
          emit(SuccessState(data));
          return Future.value(true);
        });
  }


}