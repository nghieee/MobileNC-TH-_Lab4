import '../model/productmodel.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class ReadData {
  Future<List<Product>> loadData() async {
    var data = await rootBundle.loadString("/files/productlist.json");
    print("Dữ liệu product: $data");
    var dataJson = jsonDecode(data);
    var list = (dataJson['data'] as List)
        .map((e) => Product.fromJson(e))
        .toList();
    print("Số lượng sản phẩm: ${list.length}");
    return list;
  }
}
