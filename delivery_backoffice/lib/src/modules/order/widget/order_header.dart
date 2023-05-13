import 'package:flutter/material.dart';

import '../../../core/ui/widgets/base_header.dart';
import '../../../models/orders/order_status.dart';
import '../order_controller.dart';

class OrderHeader extends StatefulWidget {
  final OrderController controller;
  const OrderHeader({super.key, required this.controller});

  @override
  State<OrderHeader> createState() => _OrderHeaderState();
}

class _OrderHeaderState extends State<OrderHeader> {
  OrderStatus? statusSelect;

  @override
  Widget build(BuildContext context) {
    return BaseHeader(
      title: 'Administrar Pedidos',
      addButton: false,
      filterWidget: DropdownButton<OrderStatus?>(
        value: statusSelect,
        onChanged: (value) {
          setState(() {
            widget.controller.changeStatusFilter(value);
            statusSelect = value;
          });
        },
        items: [
          const DropdownMenuItem(
            value: null,
            child: Text('Todos'),
          ),
          ...OrderStatus.values
              .map(
                (status) => DropdownMenuItem(
                  value: status,
                  child: Text(status.name),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
