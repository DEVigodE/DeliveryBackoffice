import 'package:mobx/mobx.dart';

import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/messages.dart';
import 'payment_type_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'widgets/payment_type_item.dart';
import 'package:flutter/material.dart';
import 'widgets/payment_type_header.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PaymentTypePage extends StatefulWidget {
  const PaymentTypePage({super.key});

  @override
  State<PaymentTypePage> createState() => _PaymentTypePageState();
}

class _PaymentTypePageState extends State<PaymentTypePage> with Loader, Messages {
  final controller = Modular.get<PaymentTypeController>();

  final disposers = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case PaymentTypeStatus.initial:
            break;
          case PaymentTypeStatus.loading:
            showLoader();
            break;
          case PaymentTypeStatus.loaded:
            hideLoader();
            break;
          case PaymentTypeStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro ao buscar as formas de pagamento');
            break;
        }
      });
      disposers.addAll([statusDisposer]);
      controller.loadPayments();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.only(left: 40, top: 40, right: 40),
      child: Column(
        children: [
          const PaymentTypeHeader(),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Observer(
              builder: (_) {
                return GridView.builder(
                  itemCount: controller.paymentTypes.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisExtent: 120,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    maxCrossAxisExtent: 680,
                  ),
                  itemBuilder: (context, index) {
                    final paymentTypeModel = controller.paymentTypes[index];
                    return const PaymentTypeItem();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
