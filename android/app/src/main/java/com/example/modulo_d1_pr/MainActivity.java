package com.example.modulo_d1_pr;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.widget.Toast;
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.EventChannel;

public class MainActivity extends FlutterActivity {

    String caminhoCanal = "com.example.modulo_d1_pr";
    private BroadcastReceiver broadInternet;

    @Override
    protected void onDestroy() {
        super.onDestroy();
        unregisterReceiver(broadInternet);
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        new EventChannel(flutterEngine.getDartExecutor(), caminhoCanal + "/internet").setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(Object arguments, EventChannel.EventSink events) {
                events.success(verificarConexao());
                broadInternet = new BroadcastReceiver() {
                    @Override
                    public void onReceive(Context context, Intent intent) {
                        if (verificarConexao() == 0) {
                            Toast.makeText(context, "Sem conexão com internet", Toast.LENGTH_SHORT).show();
                        }
                        events.success(verificarConexao());
                    }
                };
                registerReceiver(broadInternet, new IntentFilter(ConnectivityManager.CONNECTIVITY_ACTION));
            }

            @Override
            public void onCancel(Object arguments) {

            }
        });

    }

    private int verificarConexao() {

        int conexao = 0;
        ConnectivityManager connectivityManager = (ConnectivityManager) getSystemService(CONNECTIVITY_SERVICE);
        NetworkInfo networkInfo = connectivityManager.getActiveNetworkInfo();

        if (networkInfo != null) {

            switch (networkInfo.getState()) {

                case CONNECTED:
                    conexao = 1;
                    break;

                default:
                    conexao = 0;
                    break;

            }

        }

        return conexao;

    }

}