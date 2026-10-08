import 'package:flutter/material.dart';
import 'package:flutter_course_inno/lectures/lecture6.2/demo_lib/domain/entities/catalog_item.dart';

class CatalogItemWidget extends StatelessWidget {
  final CatalogItem item;
  final VoidCallback function;
  final bool isClicked;

  const CatalogItemWidget({
    super.key,
    required this.item,
    required this.function,
    required this.isClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: 80,
              height: 110,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    item.name.substring(0, 1),
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Text(
            item.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),

          ElevatedButton(onPressed: function, child: Text('нажми на меня')),
          if (isClicked) Text('Нажато!'),
        ],
      ),
    );
  }
}
