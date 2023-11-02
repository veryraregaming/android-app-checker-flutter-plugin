# Android App Checker Flutter Plugin

The **Android App Checker Flutter Plugin** is a Flutter plugin that allows you to retrieve information about an Android app installed on a device. You can use this plugin to fetch details such as the app's name, version name, and version code.

## Usage

To use this plugin, you'll need to include it in your Flutter project and then call the `getAppVersion` method with the package name of the target app. Here's how you can use it in your Flutter app:

1. Add the plugin to your `pubspec.yaml` file:

```yaml
dependencies:
  android_app_checker: ^1.0.0

dart
Copy code
import 'package:android_app_checker/android_app_checker.dart';
