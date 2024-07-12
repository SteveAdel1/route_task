import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/cubit.dart';
import '../view_model/states.dart';
import '../widgets/product_item.dart';

class view extends StatefulWidget {
  const view({super.key});

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
  var vm = ProductsCubit();
  @override
  void initState() {
    vm.getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => ProductsCubit(),
        child: BlocBuilder<ProductsCubit, States>(
          bloc: vm,
          builder: (context, state) {
            switch (state) {
              case LoadingState():
                {
                  return CircularProgressIndicator();
                }
              case ErrorStates():
                {
                  return Text("Error");
                }
              case SuccessState():
                {
                  return ProductItems();
                }
            }
          },
        ),
      ),
    );
  }
}
