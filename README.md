 Android App Checker Flutter Plugin

The **Android App Checker Flutter Plugin** is a Flutter plugin that allows you to retrieve information about an Android app installed on a device. You can use this plugin to fetch details such as the app's name, version name, and version code.

## Installation

To use this plugin in your Flutter project, you need to follow these steps:

1. Add the `android_app_checker` plugin to your project's `pubspec.yaml` file:

   ```yaml
   dependencies:
     android_app_checker: ^1.0.0```
Make sure to replace ^1.0.0 with the desired version.

Import the plugin in your Dart file:

```dart
import 'package:android_app_checker/android_app_checker.dart';```
Call the getAppVersion method with the package name of the target app:

```dart
Future<void> checkAppVersion() async {
  final packageName = "com.example.target_app"; // Replace with the target app's package name

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
}```
Run the checkAppVersion function to retrieve the app's information.

Example
Here's an example of how you can use the Android App Checker Flutter Plugin in your Flutter app:

```dart
import 'package:flutter/material.dart';
import 'package:android_app_checker/android_app_checker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Version Checker Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await checkAppVersion();
            },
            child: Text('Check App Version'),
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
}```
Feel free to replace "com.example.target_app" with the package name of the app you want to check.
