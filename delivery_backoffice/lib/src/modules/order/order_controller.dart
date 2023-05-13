import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../dto/order/order_dto.dart';
import '../../models/orders/order_model.dart';
import '../../models/orders/order_status.dart';
import '../../repositories/order/get_order_by_id.dart';
import '../../repositories/products/order/order_repository.dart';
part 'order_controller.g.dart';

enum OrderStateStatus { initial, loading, loaded, error, showDetailModal, statusChanged }

class OrderController = OrderControllerBase with _$OrderController;

abstract class OrderControllerBase with Store {
  final OrderRepository _orderRepository;
  final GetOrderById _getOrderById;

  @readonly
  var _status = OrderStateStatus.initial;

  late DateTime _today;

  @readonly
  OrderStatus? _statusFilter;

  @readonly
  var _orders = <OrderModel>[];

  @readonly
  String? _errorMessage;

  @readonly
  OrderDto? _orderSelected;

  OrderControllerBase(this._orderRepository, this._getOrderById) {
    final now = DateTime.now();
    _today = DateTime(now.year, now.month, now.day);
  }

  @action
  void changeStatusFilter(OrderStatus? status) {
    _statusFilter = status;
    findOrders();
  }

  @action
  Future<void> findOrders() async {
    try {
      _status = OrderStateStatus.loading;
      _orders = await _orderRepository.findAllOrders(_today, _statusFilter);
      _status = OrderStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar pedidos', error: e, stackTrace: s);
      _errorMessage = 'Erro ao buscar pedidos';
      _status = OrderStateStatus.error;
      rethrow;
    }
  }

  @action
  Future<void> showDetailModal(OrderModel model) async {
    _status = OrderStateStatus.loading;
    _orderSelected = await _getOrderById(model);
    _status = OrderStateStatus.showDetailModal;
  }

  @action
  Future<void> changeStatus(OrderStatus status) async {
    _status = OrderStateStatus.loading;
    await _orderRepository.changeStatus(_orderSelected!.id, status);
    _status = OrderStateStatus.statusChanged;
  }
}
