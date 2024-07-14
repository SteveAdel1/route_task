import 'package:flutter_test/flutter_test.dart';
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