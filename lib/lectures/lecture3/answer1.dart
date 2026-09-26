// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: Scaffold(
// //         body: Center(
// //           child: Container(
// //             margin: EdgeInsets.all(10),
// //             width: 300,
// //             height: 300,
// //             color: Colors.blueGrey,
// //             alignment: Alignment.bottomCenter,
// //             padding: EdgeInsets.only(bottom: 10),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceAround,
// //               children: [
// //                 Icon(Icons.share, color: Colors.blueAccent, size: 55),
// //                 Icon(
// //                   Icons.message,
// //                   color: Colors.greenAccent,
// //                   size: 55,
// //                   textDirection: TextDirection.ltr,
// //                 ),

// //                 Icon(Icons.favorite, color: Colors.yellowAccent, size: 55),

// //                 Icon(Icons.delete, color: Colors.redAccent, size: 55),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: SafeArea(
//           child: Column(
//             children: [
//               Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 8)),
//               Text('Favorite', style: TextStyle(color: Color(0xFF181725))),
//               Padding(padding: EdgeInsets.only(top: 32)),
//               Divider(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Image.asset('assets/sprite.png', width: 100,),
//                   Column(
//                     children: [(Text('Sprite can')), Text('325 ml, Price')],
//                   ),
//                   Text('\$1.50'),
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.arrow_right_outlined),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 8)),
                Text('Favorite', style: TextStyle(color: Color(0xFF181725))),
                Padding(padding: EdgeInsets.only(top: 16)),
                Divider(),
                Padding(padding: EdgeInsets.only(top: 16)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/sprite.png', width: 35),
                        Column(
                          children: [
                            (Text('Sprite can')),
                            Text('325 ml, Price'),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('\$1.50'),
                        Padding(
                          padding: EdgeInsets.all(0),
                          child: IconButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {},
                            icon: Icon(Icons.arrow_right_outlined),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
