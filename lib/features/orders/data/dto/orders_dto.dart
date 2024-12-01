import 'package:intl/intl.dart';

class OrdersModel {
  String? id;
  bool? isActive;
  String? price;
  String? company;
  String? picture;
  String? buyer;
  List<String>? tags;
  String? status;
  DateTime registered;

  OrdersModel({
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

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
        id: json['id']?.toString(),
        isActive: json['isActive'] as bool?,
        price: json['price']?.toString(),
        company: json['company']?.toString(),
        picture: json['picture']?.toString(),
        buyer: json['buyer']?.toString(),
        tags: List.from(
          (json['tags'] ?? []).map(
            (e) => e?.toString() ?? "",
          ),
        ),
        status: json['status']?.toString(),
        registered:
            DateFormat("yyyy-MM-ddTHH:mm:ss Z").parse(json['registered'] ?? ""),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'isActive': isActive,
        'price': price,
        'company': company,
        'picture': picture,
        'buyer': buyer,
        'tags': tags,
        'status': status,
        'registered': registered,
      };
}
