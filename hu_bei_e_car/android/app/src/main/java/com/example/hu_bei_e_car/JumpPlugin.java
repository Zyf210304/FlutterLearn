package com.example.hu_bei_e_car;

import android.app.Activity;
import android.content.Intent;
import android.util.Log;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

public class JumpPlugin implements MethodChannel.MethodCallHandler {

    public static final String CHANNEL = "test";
    static MethodChannel channel;
    private Activity activity;

    private JumpPlugin(Activity activity) {
        this.activity = activity;
    }

    public static void registerWith(PluginRegistry.Registrar registrar) {
        channel = new MethodChannel(registrar.messenger(), CHANNEL);
        JumpPlugin instance = new JumpPlugin(registrar.activity());
        //setMethodCallHandler在此通道上接收方法调用的回调
        channel.setMethodCallHandler(instance);
    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        if (call.method.equals("testActivity")) {
            // 跳转到指定Activity
            Intent intent = new Intent(activity, TestActivity.class);
            activity.startActivity(intent);
            // 返回给flutter的参数
            result.success("success");
        } else if (call.method.equals("twoAct")) {

            // 解析参数
            String text = call.argument("flutter");

            // 带参数跳转到指定Activity
//            Intent intent = new Intent(activity, TwoActivity.class);
//            intent.putExtra(TwoActivity.VALUE, text);
//            activity.startActivity(intent);

            // 返回给flutter的参数
            result.success("success");
        } else {
            result.notImplemented();
        }
    }
}
