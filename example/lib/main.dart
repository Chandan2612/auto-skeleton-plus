import 'package:flutter/material.dart';
import 'package:auto_skeleton_plus/auto_skeleton_plus.dart';

/// Entry point of the example app
void main() => runApp(const MyApp());

/// Root widget of the demo application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoScreen(),
    );
  }
}

/// Demonstrates how to use [AutoSkeleton] in a real screen
class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {

  /// Controls whether skeleton UI is shown
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // 🔹 Simulate API delay (loading state)
    Future.delayed(const Duration(seconds: 3), () {
      setState(() => isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto Skeleton Plus Demo'),
      ),

      // 🔹 Wrap your UI with AutoSkeleton
      body: AutoSkeleton(
        isLoading: isLoading,

        // 🔹 Original UI (will be converted automatically)
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Title
              Text(
                "Profile",
                style: TextStyle(fontSize: 20),
              ),

              SizedBox(height: 16),

              // Name
              Text("Chandan Kumar"),

              SizedBox(height: 8),

              // Email
              Text("chandan@email.com"),

              SizedBox(height: 20),

              // Description
              Text(
                "This is a demo showing automatic skeleton loading.",
              ),
            ],
          ),
        ),
      ),

      // 🔹 Button to toggle loading state manually
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => isLoading = !isLoading),
        tooltip: 'Toggle Loading',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
