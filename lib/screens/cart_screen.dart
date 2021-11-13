import 'package:blocsample/blocs/cart_bloc.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget{
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sepet"),
      ),
      body: StreamBuilder(
        stream: cartBloc.getStream,
        initialData: cartBloc.getCart(),
        builder: (context, AsyncSnapshot snapshot) {
          return buildCart(snapshot);
        },
      ),
    );
  }

  Widget buildCart(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, index) {
        final cart = snapshot.data;
        return ListTile(
          title: Text(cart[index].product.name),
          subtitle: Text(cart[index].product.price.toString()),
          trailing: IconButton(
            icon: const Icon(Icons.remove_shopping_cart),
            onPressed: () {
              cartBloc.removeFromCart(cart[index]);
            },
          ),
        );
      },
    );
  }

}