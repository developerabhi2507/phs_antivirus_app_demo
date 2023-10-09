// import 'package:flutter/material.dart';

// import '../../core/services/connectivity_service.dart';
// import '../../core/services/notification_services.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final connectivityService = ConnectivityService();
//   @override
//   void dispose() {
//     super.dispose();
//     connectivityService.stopMonitoring();
//   }

//   void _showNotification() async {
//     // Show a notification when needed
//     NotificationService notificationService = NotificationService();
//     await notificationService.showNotification(
//       0, // Replace with a unique notification ID
//       'Notification Title',
//       'This is the notification body.',
//       'notification_payload', // Replace with your own payload data if needed
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
