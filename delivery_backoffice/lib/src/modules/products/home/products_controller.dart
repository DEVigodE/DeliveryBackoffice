import 'dart:developer';

import '../../../models/product_model.dart';
import '../../../repositories/products/product_repository.dart';
import 'package:mobx/mobx.dart';

part 'products_controller.g.dart';

enum ProductStateStatus { initial, loading, loaded, error }

class ProductsController = ProductsControllerBase with _$ProductsController;

abstract class ProductsControllerBase with Store {
  final ProductRepository _productRepository;

  ProductsControllerBase(this._productRepository);

  @readonly
  var _status = ProductStateStatus.initial;

  @readonly
  var _products = <ProductModel>[];

  @readonly
  String? _filterName;

  Future<void> filterByName(String name) async {
    _filterName = name;
    await loadProducts();
  }

  @action
  Future<void> loadProducts() async {
    try {
      _status = ProductStateStatus.loading;
      _products.clear();
      _products = await _productRepository.findAll(_filterName);
      _status = ProductStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao carregar os produtos', error: e, stackTrace: s);
      _status = ProductStateStatus.error;
    }
  }
}
