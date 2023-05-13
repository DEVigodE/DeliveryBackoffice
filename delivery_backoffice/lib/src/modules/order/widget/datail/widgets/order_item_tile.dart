import 'package:flutter/material.dart';

import '../../../../../core/ui/styles/text_styles.dart';

class OrderItemTile extends StatelessWidget {
  final String label;
  final String info;

  const OrderItemTile({super.key, required this.label, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: context.textStyles.textBold,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            info,
            style: context.textStyles.textMedium,
          ),
        ],
      ),
    );
  }
}
