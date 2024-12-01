enum OrderStatus {
  ORDERED,
  DELIVERED,
  RETURNED,
}

class OrdersEntity {
  String? id;
  bool? isActive;
  String? price;
  String? company;
  String? picture;
  String? buyer;
  List<String>? tags;
  OrderStatus status;
  DateTime registered;

  double get actualPrice => double.parse(
        price?.replaceAll("\$", "").replaceAll(",", "") ?? "0.0",
      );

  OrdersEntity({
    required this.id,
    required this.isActive,
    required this.price,
    required this.company,
    required this.picture,
    required this.buyer,
    required this.tags,
    required this.status,
    required this.registered,
  });
}
