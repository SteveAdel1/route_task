//
// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:task/core/constants/constants.dart';
// import 'package:task/presentation/view_model/cubit.dart';
// import 'package:task/presentation/view_model/states.dart';
//
// import '../widgets/product_item.dart';
//
// class ProductList extends StatefulWidget {
//   ProductList({super.key});
//
//   @override
//   State<ProductList> createState() => _ProductListState();
// }
//
// class _ProductListState extends State<ProductList> {
//   @override
//     var vm = ProductsCubit();
//
//   void initState() {
//     vm.getData();
//     super.initState();
//   }
//   var formKey = GlobalKey<FormState>();
//
//   // List<ProductItems> products = [
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body:  BlocProvider(
//         create: (context) =>ProductsCubit() ,
//
//         child: BlocBuilder(
//           bloc:vm ,
//           builder: (context, state) {
//             switch(state){
//               case LoadingState():{
//                 return CircularProgressIndicator();
//               }
//               case ErrorStates():{
//                 return Text("Error");
//               }
//               case SuccessState():{
//                 var data = state.data;
//                 return Padding(
//                   padding: EdgeInsets.symmetric(vertical: 0, horizontal: 14),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Expanded(
//                             child: TextFormField(
//                               decoration: const InputDecoration(
//                                 prefixIcon: Icon(Icons.search,  color:  Color(0xFF004182),),
//                                 hintText: "what do you search for?",
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                       color: Color(0xFF004182), width: 1.5),
//                                   borderRadius: BorderRadius.all(Radius.circular(35)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                       color:  Color(0xFF004182), width: 1.5),
//                                   borderRadius: BorderRadius.all(Radius.circular(35)),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 15,
//                           ),
//                           ImageIcon(
//                             AssetImage("assets/icons/cart.png"),
//                             color: Color(0xFF004182),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 10,),
//                       Expanded(
//                         child: GridView.builder(
//                           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2,
//                               mainAxisSpacing: 2,
//                               crossAxisSpacing: 2,
//                               childAspectRatio: 4 / 5),
//                           // itemCount:ProductItems. ,
//                           itemBuilder: (context, index) => ProductItems(image: data[index].images.toString(),
//                               name: data[index].title.toString(),
//                               description: data[index].description.toString(),
//                               price: data[index].price.toString(),
//                               sale: data[index].discountPercentage.toString(),
//                               reviews: 22,),
//                       )
//                       )
//                     ],
//                   ),
//                 );
//               }
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
