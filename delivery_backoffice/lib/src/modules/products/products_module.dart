import 'package:flutter_modular/flutter_modular.dart';

import 'detail/product_detail_controller.dart';
import 'detail/product_detail_page.dart';
import 'home/product_page.dart';
import 'home/products_controller.dart';

class ProductsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => ProductsController(i())),
        Bind.lazySingleton(
          (i) => ProductDetailController(i()),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ProductPage()),
        ChildRoute(
          '/detail',
          child: (context, args) => const ProductDetailPage(
            productId: null,
          ),
        ),
      ];
}
