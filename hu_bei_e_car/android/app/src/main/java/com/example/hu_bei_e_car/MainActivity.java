package com.example.hu_bei_e_car;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    registerCustomPlugin(this);
  }

  private static void registerCustomPlugin(PluginRegistry registrar) {
    JumpPlugin.registerWith(registrar.registrarFor(JumpPlugin.CHANNEL));
  }

}
