import 'package:task/features/orders/logic/entity/order.dart';

import '../dto/orders_dto.dart';

extension OrdersModelX on OrdersModel {
  OrdersEntity toDomain() {
    return OrdersEntity(
      id: id,
      isActive: isActive,
      price: price,
      company: company,
      picture: picture,
      buyer: buyer,
      tags: tags,
      status: OrderStatus.values.firstWhere(
        (e) => e.name == status,
        orElse: () => OrderStatus.ORDERED,
      ),
      registered: registered,
    );
  }
}
