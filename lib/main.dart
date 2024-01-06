import 'package:flutter/material.dart';
import 'package:impact/services/api_service.dart';
import 'package:impact/screens/onboarding1.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // ApiService().executeApiService();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: onBoarding1(),
    );
  }
} 


// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: const Color.fromARGB(255, 203, 235, 204),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 40),
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 80,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       const Text(
//                         "Hey Selena",
//                         style: TextStyle(
//                           fontSize: 25,
//                           fontWeight: FontWeight.w600,
//                           color: Color.fromARGB(255, 39, 116, 43),
//                         ),
//                       ),
//                       const SizedBox(height: 1), // Added SizedBox for spacing
//                       Text(
//                         "Welcome Back",
//                         style: TextStyle(
//                           color: const Color.fromARGB(255, 39, 116, 43)
//                               .withOpacity(0.8),
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ],
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
