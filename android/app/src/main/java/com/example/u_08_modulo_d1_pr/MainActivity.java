package com.example.u_08_modulo_d1_pr;

import android.app.ComponentCaller;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.util.Base64;
import android.view.WindowManager;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.List;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {

    private String caminhoCanal = "com.example_08_modulo_d1_pr";
    private BroadcastReceiver broadInternet;
    private EventChannel.EventSink eventInternet;
    private MethodChannel.Result resultado;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        broadInternet = new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, Intent intent) {
                eventInternet.success(verificarConexao());
            }
        };

        new MethodChannel(flutterEngine.getDartExecutor(), caminhoCanal + "/main").setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {

                resultado = result;
                List<Object> args = call.arguments();

                switch (call.method) {

                    case "imagem":

                        Intent intent = new Intent(Intent.ACTION_PICK);
                        intent.setType("image/png");
                        startActivityForResult(intent, 1000);

                        break;

                    case "print":

                        if (args != null) {

                            switch (Integer.parseInt(args.get(0).toString())) {

                                case 1:
                                    getWindow().setFlags(WindowManager.LayoutParams.FLAG_SECURE, WindowManager.LayoutParams.FLAG_SECURE);
                                    break;

                                    case 2:
                                        getWindow().clearFlags(WindowManager.LayoutParams.FLAG_SECURE);
                                    break;

                            }

                            result.success("sucesso");

                        }

                        break;

                }

            }
        });

        new EventChannel(flutterEngine.getDartExecutor(), caminhoCanal + "/internet").setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(Object arguments, EventChannel.EventSink events) {
                eventInternet = events;
                registerReceiver(broadInternet, new IntentFilter(ConnectivityManager.CONNECTIVITY_ACTION));
                events.success(verificarConexao());
            }

            @Override
            public void onCancel(Object arguments) {

            }
        });

    }

    private boolean verificarConexao() {

        ConnectivityManager connectivityManager = (ConnectivityManager) getSystemService(CONNECTIVITY_SERVICE);
        NetworkInfo networkInfo = connectivityManager.getActiveNetworkInfo();

        if (networkInfo != null) {

            switch (networkInfo.getState()) {

                case CONNECTED:
                    return true;

            }

        }
        return false;

    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, @Nullable Intent data, @NonNull ComponentCaller caller) {
        super.onActivityResult(requestCode, resultCode, data, caller);

        if (requestCode == 1000 && data != null) {

            if (data.getData() != null) {

                Uri uri = (Uri) data.getData();

                if (uri != null) {

                    try{

                        InputStream inputStream = getContentResolver().openInputStream(uri);
                        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                        Bitmap bitmap = BitmapFactory.decodeStream(inputStream);
                        bitmap.compress(Bitmap.CompressFormat.PNG, 100, byteArrayOutputStream);
                        byte[] bytes = byteArrayOutputStream.toByteArray();
                        resultado.success(Base64.encodeToString(bytes, Base64.NO_WRAP));

                    }catch (Exception e){
                        e.printStackTrace();
                    }

                }

            }

        }

    }
}