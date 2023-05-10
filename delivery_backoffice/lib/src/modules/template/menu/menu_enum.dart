enum Menu {
  paymentType(
    '/payment-type/',
    'payment_type_ico',
    'payment_type_ico_selected',
    'Administrar Formas de Pagamento',
  ),
  products(
    '/products/',
    'product_ico',
    'product_ico_selected',
    'Administrar Produtos',
  ),

  orders(
    '/order/',
    'order_ico',
    'order_ico_selected',
    'Pdedidos do Dia',
  );

  final String route;
  final String assetIcon;
  final String assetIconSelected;
  final String label;

  const Menu(
    this.route,
    this.assetIcon,
    this.assetIconSelected,
    this.label,
  );
}
