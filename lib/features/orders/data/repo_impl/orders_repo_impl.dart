import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:task/features/orders/data/mapper/mapper.dart';
import 'package:task/features/orders/logic/entity/order.dart';

import '../../logic/repo/orders_repo.dart';
import '../dto/orders_dto.dart';

const _ORDER_JSON = 'assets/data.json';

class OrdersRepoImpl implements OrderRepo {
  @override
  Future<List<OrdersEntity>> getAllOrders() async {
    final orders = await _loadAssetData(_ORDER_JSON);

    final List<OrdersEntity> result = List.from(
      orders.map(
        (json) => OrdersModel.fromJson(json).toDomain(),
      ),
    );
    return result;
  }

  dynamic _loadAssetData(String path) async {
    final String jsonString = await rootBundle.loadString(path);
    return json.decode(jsonString);
  }
}
