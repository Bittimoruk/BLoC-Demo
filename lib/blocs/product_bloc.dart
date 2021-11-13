import 'dart:async';

import 'package:blocsample/data/product_service.dart';
import 'package:blocsample/models/product.dart';

class ProductBloc {

  final productStreamContoller = StreamController.broadcast();

  Stream get getStream => productStreamContoller.stream;

  List<Product>? getAll() {
    return ProductService.getAll();
  }

}

final productBloc = ProductBloc();