import 'package:flutter/material.dart';

import '../../../../../core/extensions/formatter_extensions.dart';
import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../dto/order/order_product_dto.dart';

class OrderProductItem extends StatelessWidget {
  final OrderProductDto orderProduct;

  const OrderProductItem({super.key, required this.orderProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey[300]!,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              orderProduct.product.name,
              style: context.textStyles.textRegular,
            ),
          ),
          Text(
            orderProduct.amount.toString(),
            style: context.textStyles.textRegular,
          ),
          Expanded(
            flex: 1,
            child: Text(
              orderProduct.totalPrice.currencyPTBR,
              textAlign: TextAlign.end,
              style: context.textStyles.textRegular,
            ),
          ),
        ],
      ),
    );
  }
}
