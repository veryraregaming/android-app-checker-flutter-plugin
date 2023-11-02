package dev.starshopping.android_app_checker

import android.content.pm.PackageManager
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry.Registrar

class AndroidAppCheckerPlugin(private val registrar: Registrar) : MethodChannel.MethodCallHandler {

  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "android_app_checker")
      channel.setMethodCallHandler(AndroidAppCheckerPlugin(registrar))
    }
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    if (call.method == "getAppVersion") {
      val packageName = call.argument<String>("package_name")
      if (packageName != null) {
        val versionInfo = getAppVersion(packageName)
        result.success(versionInfo)
      } else {
        result.error("INVALID_ARGUMENT", "Package name cannot be null", null)
      }
    } else {
      result.notImplemented()
    }
  }

  private fun getAppVersion(packageName: String): Map<String, String> {
    val versionInfo = mutableMapOf<String, String>()
    try {
      val packageInfo = registrar.context().packageManager.getPackageInfo(packageName, 0)
      versionInfo["package_name"] = packageInfo.packageName
      versionInfo["version_name"] = packageInfo.versionName
      versionInfo["version_code"] = packageInfo.versionCode.toString()
    } catch (e: PackageManager.NameNotFoundException) {
      versionInfo["error"] = "Package not found"
    }
    return versionInfo
  }
}
