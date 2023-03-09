import 'package:ecommerce_api/constants/size_config.dart';
import 'package:ecommerce_api/cubits/getdata/getdata.cubit.dart';
import 'package:ecommerce_api/cubits/getdata/getdata.state.dart';
import 'package:ecommerce_api/views/widgets/shop.item.dart';
import 'package:ecommerce_api/views/widgets/show.mssg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScr extends StatelessWidget {
  HomeScr({super.key});

  TextEditingController sController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Ecommerce"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/cart');
              },
              child: const Icon(CupertinoIcons.cart_fill),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: sController,
              decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.bodyMedium,
                  hintText: "Search",
                  suffixIcon: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.search,
                        color: Colors.blue,
                      )),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.blue))),
            ),
            Expanded(
              child: SizedBox(
                child: BlocBuilder<DataCubit, DataState>(
                    builder: (context, DataState state) {
                  if (state is DataLoaded) {
                    return ListView.builder(
                      itemCount: state.data.length,
                      itemBuilder: (context, index) {
                        return ShopItemWidget(item: state.data[index]);
                      },
                    );
                  } else if (state is DataErrorState) {
                    return Center(
                      child: Text(state.error),
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
