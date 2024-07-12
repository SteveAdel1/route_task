import '../../data/model/ProductsModel.dart';

sealed class States{}

class LoadingState extends States{}

class SuccessState extends States{
  List<ProductsModel> data ;

  SuccessState(this.data);
}

class ErrorStates extends States{}