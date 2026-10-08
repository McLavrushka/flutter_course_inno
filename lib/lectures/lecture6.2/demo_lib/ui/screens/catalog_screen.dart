import 'package:flutter/material.dart';
import 'package:flutter_course_inno/lectures/lecture6.2/demo_lib/domain/entities/catalog_item.dart';
import 'package:flutter_course_inno/lectures/lecture6.2/demo_lib/ui/widgets/catalog_item_widget.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  var items = [
    CatalogItem(id: 1, name: 'Сова'),
    CatalogItem(id: 2, name: 'Слон'),
    CatalogItem(id: 3, name: 'Акула'),
    CatalogItem(id: 4, name: 'Змея'),
  ];

  Set<int> clicked = {};

  void doSomething(int id) {
    if (!clicked.contains(id)) {
      clicked.add(id);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (final item in items)
              CatalogItemWidget(
                item: item,
                function: () => doSomething(item.id),
                isClicked: clicked.contains(item.id),
              ),
          ],
        ),
      ),
    );
  }
}
