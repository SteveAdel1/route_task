import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presentation/view_model/states.dart';

import '../view_model/cubit.dart';

class ProductItems extends StatefulWidget {
  const ProductItems();

  @override
  State<ProductItems> createState() => _ProductItemsState();
}

class _ProductItemsState extends State<ProductItems> {
  var vm = ProductsCubit();
  @override
  void initState() {
    vm.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
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
            var data = state.data;
              {
                return  Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 14),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Color(0xFF004182),
                                ),
                                hintText: "what do you search for?",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF004182), width: 1.5),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(35)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF004182), width: 1.5),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(35)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          ImageIcon(
                            AssetImage("assets/icons/cart.png"),
                            color: Color(0xFF004182),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: GridView.builder(
                              gridDelegate:
                               SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 2,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: size.width*0.44 / (size.height*0.35)),
                              itemCount: data.length,
                              itemBuilder: (context, index) =>
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.stretch,
                                    children: [
                                      Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          Container(
                                            width: size.width * 0.55,
                                            height: size.height * 0.154,
                                            decoration: BoxDecoration(
                                              border: Border(top: BorderSide(color: Color(0xFF004182)),
                                                  left:BorderSide(color: Color(0xFF004182)),
                                              right: BorderSide(color: Color(0xFF004182))),
                                              borderRadius: BorderRadius.only(topLeft:Radius.circular(20),
                                                  topRight:Radius.circular(20)),
                                              //color: Colors.white
                                            ),
                                            child: ClipRRect(
                                                borderRadius:
                                                const BorderRadius.only(
                                                    topRight:
                                                    Radius.circular(
                                                        15),
                                                    topLeft:
                                                    Radius.circular(
                                                        15)),
                                                child: Image.network(
                                                  data[index].thumbnail.toString(),
                                                  fit: BoxFit.fill,
                                                )),
                                          ),
                                          Padding(
                                              padding:
                                              const EdgeInsets.all(10),
                                              child: InkWell(
                                                onTap: () {},
                                                child: const CircleAvatar(
                                                  backgroundColor:
                                                  Colors.white,
                                                  radius: 15,
                                                  child: Icon(Icons
                                                      .favorite_border),
                                                ),
                                              ))
                                        ],
                                      ),
                                      Container(
                                        width: size.width * 0.44,
                                        height: size.height * 0.178,
                                        padding: const EdgeInsets.all(5),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                            border: Border(bottom: BorderSide(color: Color(0xFF004182)),
                                                left:BorderSide(color: Color(0xFF004182)),
                                                right: BorderSide(color: Color(0xFF004182))
                                            ),
                                            borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),
                                                bottomRight:Radius.circular(20)),
                                            //color: Colors.white

                                          // borderRadius: BorderRadius.only(
                                          //     bottomLeft:
                                          //     Radius.circular(15),
                                          //     bottomRight:
                                          //     Radius.circular(15)),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Text(
                                              data[index].title.toString(),
                                              overflow:
                                              TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: Colors.blueAccent,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              data[index]
                                                  .description
                                                  .toString(),
                                              overflow:
                                              TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: Colors.blueAccent,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Egp " +
                                                      data[index]
                                                          .price
                                                          .toString(),
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    color:
                                                    Colors.blueAccent,
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  data[index]
                                                      .discountPercentage
                                                      .toString() +
                                                      " Egp",
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    decoration:
                                                    TextDecoration
                                                        .lineThrough,
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                    color: Colors.blueGrey,
                                                    fontSize: 10,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Reviews (${data[index].rating.toString()})",
                                                  style: const TextStyle(
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                    color:
                                                    Colors.blueAccent,
                                                    fontSize: 12,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.star,
                                                  color: Color(0xFFF4B400),
                                                ),
                                                Spacer(),
                                                InkWell(
                                                  onTap: () {},
                                                  child: const ImageIcon(
                                                    AssetImage(
                                                        "assets/icons/add.png"),
                                                    color:
                                                    Color(0xFF004182),
                                                    size: 30,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )))
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }

}
