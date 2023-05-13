import 'package:flutter/material.dart';

enum OrderStatus {
  pending('Pendente', 'P', Colors.blue),
  confirmed('Confirmado', 'C', Colors.green),
  finished('Finalizado', 'F', Colors.black),
  canceled('Cancelado', 'R', Colors.red);

  final String name;
  final String acronym;
  final Color color;

  const OrderStatus(
    this.name,
    this.acronym,
    this.color,
  );

  static OrderStatus parse(String acronym) {
    return values.firstWhere((status) => status.acronym == acronym);
  }
}
