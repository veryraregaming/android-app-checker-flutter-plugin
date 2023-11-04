# Android App Checker Flutter Plugin

The **Android App Checker Flutter Plugin** is a Flutter plugin that allows you to retrieve information about an Android app installed on a device. You can use this plugin to fetch details such as the app's name, version name, and version code.

## Installation

To use this plugin in your Flutter project, you need to follow these steps:

1. Add the following dependency to your project's `pubspec.yaml` file:

YAML

```
dependencies:
  android_app_checker: ^1.0.0]
```

2. Import the plugin into your Dart file:

Dart

```
import 'package:android_app_checker/android_app_checker.dart';
```

3. To get the version information of an app, call the `getAppVersion()` method with the package name of the app:

Dart

```
Future<Map<String, String>> getAppVersion(String packageName) async {
  final MethodChannel channel = MethodChannel('android_app_checker');
  final Map<String, String> result = await channel.invokeMethod('getAppVersion', {
    'package_name': packageName,
  });
  return result;
}
```

The `getAppVersion()` method returns a `Future` that resolves to a map of app information. The map will contain the following keys:

- `app_name`: The name of the app.
  
- `version_name`: The version name of the app.
  
- `version_code`: The version code of the app.
  

4. To use the app version information, you can access it using the keys in the map returned by the `getAppVersion()` method. For example, to get the app name, you would use the following code:

Dart

```
final appName = versionInfo['app_name'];
```

Here is an example of how to use the `android_app_checker` plugin in a Flutter app to get the version information of the app with the package name `com.example.target_app`:

Dart

```
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
              final versionInfo = await getAppVersion('com.example.target_app');

              if (versionInfo.containsKey('error')) {
                print('Error: ${versionInfo['error']}.');
              } else {
                print('App Name: ${versionInfo['app_name']}.');
                print('Version Name: ${versionInfo['version_name']}.');
                print('Version Code: ${versionInfo['version_code']}.');
              }
            },
            child: Text('Check App Version'),
          ),
        ),
      ),
    );
  }
}

```

When you run the app and tap the "Check App Version" button, the app will print the version information of the app with the package name `com.example.target_app` to the console.

## Checking if an App is Installed

To check if an app is installed on the device, you can use the following code:

```dart
import 'package:android_app_checker/android_app_checker.dart';

Future<bool> isAppInstalled(String packageName) async {
  final MethodChannel channel = MethodChannel('android_app_checker');
  final bool isInstalled = await channel.invokeMethod('isAppInstalled', {
    'package_name': packageName,
  });
  return isInstalled;
}
```

To use this code, simply pass the package name of the app you want to check to the `isAppInstalled()` method. The method will return a `Future` that resolves to a `bool` value. If the app is installed on the device, the `Future` will resolve to `true`. Otherwise, the `Future` will resolve to `false`.

Here is an example of how to use the `isAppInstalled()` method:

```dart
final packageName = "com.example.target_app";

final isInstalled = await isAppInstalled(packageName);

if (isInstalled) {
  print("The app is installed.");
} else {
  print("The app is not installed.");
}
```
