import '../model/categorymodel.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class ReadData {
  Future<List<Category>> loadData() async {
    var data = await rootBundle.loadString("files/categorylist.json");
    print("Dữ liệu category: $data"); // Kiểm tra dữ liệu JSON
    var dataJson = jsonDecode(data);
    var list = (dataJson['data'] as List)
        .map((e) => Category.fromJson(e))
        .toList();
    print("Số lượng danh mục: ${list.length}"); // Kiểm tra số lượng mục
    return list;
  }
}
