import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Version Checker Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await checkAppVersion();
            },
            child: const Text('Check App Version'),
          ),
        ),
      ),
    );
  }

  Future<void> checkAppVersion() async {
    const packageName = "com.example.target_app"; // Replace with the target app's package name

    final versionInfo = await AndroidAppChecker.getAppVersion(packageName);

    if (versionInfo.containsKey("error")) {
      print("Error: ${versionInfo['error']}");
    } else {
      final appName = versionInfo['app_name'];
      final versionName = versionInfo['version_name'];
      final versionCode = versionInfo['version_code'];

      print("App Name: $appName");
      print("Version Name: $versionName");
      print("Version Code: $versionCode");
    }
  }
}

class AndroidAppChecker {
  static Future<Map<String, String>> getAppVersion(String packageName) async {
    // Replace this with your logic to get the app version information
    // You can use platform-specific code to fetch app version information from Android.
    return <String, String>{};
  }
}
