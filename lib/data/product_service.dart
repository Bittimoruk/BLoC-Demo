import 'package:blocsample/models/product.dart';

class ProductService {

  static List<Product> products = <Product>[];

  static final ProductService _singleton = ProductService._internal();

  factory ProductService() {
    return _singleton;
  }

  ProductService._internal();

  static List<Product>? getAll() {
    products.add(Product(1, "Acer Laptop", 6000));
    products.add(Product(2, "AMD Laptop", 8000));
    products.add(Product(3, "MSI Laptop", 12000));
    return products;
  }

}