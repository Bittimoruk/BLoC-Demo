import 'package:blocsample/blocs/cart_bloc.dart';
import 'package:blocsample/blocs/product_bloc.dart';
import 'package:blocsample/models/cart.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alışveriş"),
        actions: [
          IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () => Navigator.pushNamed(context, "/cart"),
          )
        ],
      ),
      body: buildProductList(),
    );
  }

  buildProductList() {
    return StreamBuilder(
      initialData: productBloc.getAll(),
        stream: productBloc.getStream,
        builder: (context, AsyncSnapshot snapshot) {
        return snapshot.data.length>0?buildProductListItems(snapshot):const Center(child: Text("Data yok"),);
        },
    );
  }

  buildProductListItems(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, index) {
          final list = snapshot.data;
          return ListTile(
            title: Text(list[index].name),
            subtitle: Text(list[index].price.toString()),
            trailing: IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () {
                cartBloc.addToCart(Cart(list[index],1));
                },
            ),
          );
        },
    );
  }

}