import 'package:intl/intl.dart';

import 'order.dart';

enum OrderFilterType {
  year,
  month,
  day,
}

class OrderFilterRequest {
  final DateTime date;
  final OrderFilterType type;

  String dateFormat(DateTime orderDate) {
    if (type == OrderFilterType.year) {
      return DateFormat.y().format(
        orderDate,
      );
    } else if (type == OrderFilterType.month) {
      return DateFormat.yMMM().format(
        orderDate,
      );
    } else {
      return DateFormat.yMMMd().format(
        orderDate,
      );
    }
  }

  DateTime dateByRequestType(DateTime orderDate) {
    if (type == OrderFilterType.year) {
      return DateTime(orderDate.year, 1, 1, 1, 1, 1, 1, 1);
    } else if (type == OrderFilterType.month) {
      return DateTime(orderDate.year, orderDate.month, 1, 1, 1, 1, 1, 1);
    } else {
      return DateTime(
          orderDate.year, orderDate.month, orderDate.day, 1, 1, 1, 1, 1);
    }
  }

  bool filterDate(DateTime? orderDate) {
    if (type == OrderFilterType.year) {
      return true;
    } else if (type == OrderFilterType.month) {
      return orderDate?.year == date.year;
    } else if (type == OrderFilterType.day) {
      return orderDate?.year == date.year && orderDate?.month == date.month;
    }
    return false;
  }

  OrderFilterRequest({
    required this.date,
    required this.type,
  });

  factory OrderFilterRequest.initial() {
    return OrderFilterRequest(
      date: DateTime(2021, 1, 1, 1, 1, 1, 1),
      type: OrderFilterType.month,
    );
  }

  OrderFilterRequest coyWith({
    DateTime? date,
    OrderFilterType? type,
  }) {
    return OrderFilterRequest(
      date: date ?? this.date,
      type: type ?? this.type,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderFilterRequest &&
          runtimeType == other.runtimeType &&
          date == other.date &&
          type == other.type;

  @override
  int get hashCode => date.hashCode ^ type.hashCode;
}

class OrderFilterResponse {
  DateTime date;

  List<OrdersEntity> orders;

  OrderFilterResponse({
    required this.date,
    required this.orders,
  });
}
