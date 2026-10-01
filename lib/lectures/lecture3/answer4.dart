import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 8)),
              Text('Favorite', style: TextStyle(color: Color(0xFF181725))),
              Padding(padding: EdgeInsets.only(top: 32)),
              Divider(),
              Row(
                children: [
                  Image.asset('assets/sprite.png'),
                  Column(
                    children: [(Text('Sprite can')), Text('325 ml, Price')],
                  ),
                  Text('\$1.50'),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_right_outlined),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}







// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const titleWidth = 200.0;

//     Widget favouriteRow({
//       required String imageUrl,
//       required String title,
//       required String subtitle,
//       required String price,
//     }) {
//       return Padding(
//         padding: const EdgeInsets.symmetric(vertical: 14),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(6),
//                   child: Image.asset(
//                     'assets/sprite.png',
//                     width: 48,
//                     height: 48,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 SizedBox(
//                   width: titleWidth,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         title,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         subtitle,
//                         style: const TextStyle(
//                           color: Colors.grey,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   price,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//                 const SizedBox(width: 4),
//                 const Icon(
//                   Icons.chevron_right,
//                   color: Colors.black45,
//                   size: 20,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//     }

//     Widget navItem(IconData icon, String label, {bool active = false}) {
//       final color = active ? const Color(0xFF6FA97A) : Colors.black87;
//       return Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, color: color, size: 24),
//           const SizedBox(height: 4),
//           Text(label, style: TextStyle(color: color, fontSize: 12)),
//         ],
//       );
//     }

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.black,
//           elevation: 0,
//           centerTitle: true,
//           title: const Text(
//             'Favourite',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//           ),
//           bottom: const PreferredSize(
//             preferredSize: Size.fromHeight(1),
//             child: Divider(height: 1, thickness: 1),
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               favouriteRow(
//                 imageUrl:
//                     '',
//                 title: 'Sprite Can',
//                 subtitle: '325ml, Price',
//                 price: '\$1.50',
//               ),
//               const Divider(height: 1),
//               favouriteRow(
//                 imageUrl:
//                     'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/DietCoke.png/240px-DietCoke.png',
//                 title: 'Diet Coke',
//                 subtitle: '355ml, Price',
//                 price: '\$1.99',
//               ),
//               const Divider(height: 1),
//               favouriteRow(
//                 imageUrl:
//                     'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Apple_juice.jpg/240px-Apple_juice.jpg',
//                 title: 'Apple & Grape Juice',
//                 subtitle: '2L, Price',
//                 price: '\$15.50',
//               ),
//               const Divider(height: 1),
//               favouriteRow(
//                 imageUrl:
//                     'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Coca-Cola_can.jpg/240px-Coca-Cola_can.jpg',
//                 title: 'Coca Cola Can',
//                 subtitle: '325ml, Price',
//                 price: '\$4.99',
//               ),
//               const Divider(height: 1),
//               favouriteRow(
//                 imageUrl:
//                     'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Pepsi_can.png/240px-Pepsi_can.png',
//                 title: 'Pepsi Can',
//                 subtitle: '330ml, Price',
//                 price: '\$4.99',
//               ),
//               const SizedBox(height: 24),
//               SizedBox(
//                 width: double.infinity,
//                 height: 56,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF6FA97A),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(28),
//                     ),
//                   ),
//                   child: const Text(
//                     'Add All To Cart',
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 8),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     navItem(Icons.storefront_outlined, 'Shop'),
//                     navItem(Icons.search, 'Explore'),
//                     navItem(Icons.shopping_cart_outlined, 'Cart'),
//                     navItem(Icons.favorite_border, 'Favourite', active: true),
//                     navItem(Icons.person_outline, 'Account'),
//                   ],
//                 ),
//                 const SizedBox(height: 8),
//                 Container(
//                   width: 120,
//                   height: 4,
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade300,
//                     borderRadius: BorderRadius.circular(2),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
