import 'package:flutter/material.dart';
import '../../data/model/productmodel.dart';
import '../../data/provider/productprovider.dart';
import 'productbody.dart';
import '../../conf/const.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  List<Product> lstProduct = [];
  late Future<String> _future;

  Future<String> loadProductList() async {
    lstProduct = await ReadData().loadData();
    return '';
  }

  @override
  void initState() {
    super.initState();
    _future = loadProductList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return Center(
          child: Column(
            children: [
              const Text("Product list", style: titleStyle),
              Expanded(
                child: ListView.builder(
                  itemCount: lstProduct.length,
                  itemBuilder: (context, index) {
                    return itemProductView(lstProduct[index]);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
