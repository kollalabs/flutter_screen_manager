//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <hotkey_manager/hotkey_manager_plugin.h>
#include <flutter_screen_manager/flutter_screen_manager_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  HotkeyManagerPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("HotkeyManagerPlugin"));
  ScreenRetrieverPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ScreenRetrieverPlugin"));
}
