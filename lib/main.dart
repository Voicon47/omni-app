// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/component/card_body.dart';
// import 'package:flutter_application_1/component/modal_bottom.dart';
// import 'package:flutter_application_1/modal/items.dart';

// void main() {
//   // runApp(const MyApp());
//   runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
// }

// class MyApp extends StatefulWidget {
//   MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final List<DataItem> items = [];

//   void handleAddTask(String name) {
//     setState(() {
//       items.add(DataItem(id: DateTime.now().toString(), name: name));
//     });
//   }

//   void handleDeleteTask(String id) {
//     setState(() {
//       items.removeWhere((item) => item.id == id);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "ToDoList",
//           style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
//         ),
//         backgroundColor: Colors.blue,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         child: Column(
//           children:
//               items
//                   .map(
//                     (item) => ItemWidget(
//                       index: items.indexOf(item),
//                       item: item,
//                       deleteTask: handleDeleteTask,
//                     ),
//                   )
//                   .toList(),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed:
//             () => {
//               showModalBottomSheet(
//                 isScrollControlled: true,
//                 context: context,
//                 builder: (BuildContext context) {
//                   return ModalBottom(addTask: handleAddTask);
//                 },
//               ),
//             },
//         child: const Icon(Icons.add, size: 30),
//       ),
//     );
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/routes/routes.dart';
import 'package:smart_home/src/screens/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print("✅ Firebase connected successfully");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Use `const` for performance
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'MetaHome',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Poppins', primarySwatch: Colors.blue),
          home: const SplashScreen(),
          routes: routes,
        );
      },
    );
  }
}
