import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repeat_master/features/home/home_repository/home_repo.dart';
import 'package:repeat_master/features/home/view/screens/home_screen.dart';

import 'features/home/bloc/home_bloc.dart';
import 'features/notification/notification_manager.dart';

void main()async {  WidgetsFlutterBinding.ensureInitialized();
    final notificationManager = NotificationManager();
  
  // Initialize the notification manager
  await notificationManager.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(TaskRepository()),
        ),

        // Add more BlocProviders as needed
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: HomeScreen(),
      ),
    );
  }
}
