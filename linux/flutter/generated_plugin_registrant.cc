//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <awesome_notifications/awesome_notifications_plugin.h>
#include <dynamic_color/dynamic_color_plugin.h>
#include <media_kit_libs_linux/media_kit_libs_linux_plugin.h>
#include <media_kit_video/media_kit_video_plugin.h>
#include <objectbox_flutter_libs/objectbox_flutter_libs_plugin.h>
#include <url_launcher_linux/url_launcher_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) awesome_notifications_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "AwesomeNotificationsPlugin");
  awesome_notifications_plugin_register_with_registrar(awesome_notifications_registrar);
  g_autoptr(FlPluginRegistrar) dynamic_color_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "DynamicColorPlugin");
  dynamic_color_plugin_register_with_registrar(dynamic_color_registrar);
  g_autoptr(FlPluginRegistrar) media_kit_libs_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "MediaKitLibsLinuxPlugin");
  media_kit_libs_linux_plugin_register_with_registrar(media_kit_libs_linux_registrar);
  g_autoptr(FlPluginRegistrar) media_kit_video_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "MediaKitVideoPlugin");
  media_kit_video_plugin_register_with_registrar(media_kit_video_registrar);
  g_autoptr(FlPluginRegistrar) objectbox_flutter_libs_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ObjectboxFlutterLibsPlugin");
  objectbox_flutter_libs_plugin_register_with_registrar(objectbox_flutter_libs_registrar);
  g_autoptr(FlPluginRegistrar) url_launcher_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "UrlLauncherPlugin");
  url_launcher_plugin_register_with_registrar(url_launcher_linux_registrar);
}
