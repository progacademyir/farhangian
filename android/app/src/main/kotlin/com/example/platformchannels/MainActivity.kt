package com.example.platformchannels

import android.content.*
import android.os.BatteryManager
import android.os.Build
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import android.telephony.SmsManager
import android.telephony.SubscriptionInfo
import android.telephony.SubscriptionManager
import android.telephony.TelephonyManager
import android.widget.Toast
import io.flutter.embedding.android.FlutterFragmentActivity


class MainActivity: FlutterFragmentActivity() {

    companion object {
        private const val TOAST_CHANNEL = "samples.flutter.io/toast"
        private const val CHARGING_CHANNEL = "samples.flutter.io/charging"
        private const val SMS_CHANNEL = "samples.flutter.io/sms"
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, Companion.TOAST_CHANNEL).setMethodCallHandler {
                call, result ->
            // Note: this method is invoked on the main thread.
            if (call.method == "getToast") {
                val message = call.argument<String>("message")
                Toast.makeText(this, "$message", Toast.LENGTH_SHORT).show()
            } else {
                result.notImplemented()
            }
        }
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, Companion.SMS_CHANNEL).setMethodCallHandler {
                call, result ->
            // Note: this method is invoked on the main thread.
            if (call.method == "getSmsStatus") {

Toast.makeText(this, "sms", Toast.LENGTH_SHORT).show()

                val dsim = call.argument<String>("name")
                val sim = call.argument<String>("simcard")
                val msg = call.argument<String>("message")
                val lang = call.argument<String>("language")
                val smsManager: SmsManager = SmsManager.getDefault()
 Toast.makeText(this, "sms2", Toast.LENGTH_SHORT).show()
     if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP_MR1) {
        Toast.makeText(this, "sms3", Toast.LENGTH_SHORT).show()
        val subscriptionManager = this.getSystemService(Context.TELEPHONY_SUBSCRIPTION_SERVICE) as SubscriptionManager
        val subs = subscriptionManager.activeSubscriptionInfoList


        val subId1 = subs?.get(0)?.subscriptionId
        val subId2 = subs?.get(1)?.subscriptionId
        val subIdyek = subId1.toString()
        val subIddo = subId2.toString()
        val subIdyk: Int = subIdyek.toInt()
        val subIdd: Int = subIddo.toInt()
            Toast.makeText(this, "$subId2", Toast.LENGTH_SHORT).show()

                if("$dsim"=="1"){
               SmsManager.getSmsManagerForSubscriptionId(subIdyk).sendTextMessage("09380280022", null, "Y1ohouou $dsim", null, null);
            }else{
                SmsManager.getSmsManagerForSubscriptionId(subIdd).sendTextMessage("09380280022", null, "Yo2houou $dsim", null, null);
        } 
            Toast.makeText(this, "Message Sent", Toast.LENGTH_SHORT).show()
            
            } else {
                Toast.makeText(this, "sms4", Toast.LENGTH_SHORT).show()
        SmsManager.getDefault().sendTextMessage("09380280022", null, "Yo4houou $dsim", null, null);
        }
        }
        }
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, Companion.CHARGING_CHANNEL).setStreamHandler(
            object : EventChannel.StreamHandler {
                var receiver : BroadcastReceiver? = null
                override fun onListen(arguments: Any?, events: EventChannel.EventSink) {
                    receiver = object : BroadcastReceiver() {
                        override fun onReceive(context: Context?, intent: Intent) {
                            var status = intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1)
                            if (status == BatteryManager.BATTERY_STATUS_UNKNOWN) {
                                events.error("UNAVAILABLE", "Charging status unavailable", null);
                            } else {
                                val isCharging =
                                    status == BatteryManager.BATTERY_STATUS_CHARGING ||
                                            status == BatteryManager.BATTERY_STATUS_FULL
                                events.success(if (isCharging) "charging" else "discharging")
                            }
                        }
                    }
                    ContextWrapper(applicationContext).registerReceiver(
                        receiver, IntentFilter(Intent.ACTION_BATTERY_CHANGED)
                    )
                }
                override fun onCancel(arguments: Any?) {
                    ContextWrapper(applicationContext).unregisterReceiver(receiver)
                    receiver = null
                }
            }
        )
    }

    private fun getBatteryLevel(): Int {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            val batteryManager = getSystemService(BATTERY_SERVICE) as BatteryManager
            batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(applicationContext).registerReceiver(
                null, IntentFilter(
                    Intent.ACTION_BATTERY_CHANGED
                )
            )
            intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(
                BatteryManager.EXTRA_SCALE,
                -1
            )
        }
    }

    // private fun getSmsStatus(): Int {
    //     val smsManager:SmsManager
    //     return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            
                
    //                 smsManager = this.getSystemService(SmsManager::class.java)
                
                 
    //             // on below line we are sending text message.
    //             val smsStatus = smsManager.sendTextMessage("09380280022", null, "alifss", null, null) as BatteryManager
    //         smsStatus.getIntProperty(SmsManager.BATTERY_PROPERTY_CAPACITY)
                 
    //             // on below line we are displaying a toast message for message send,
    //            // val batteryManager = 1
                 
            
    //     }else{
    //         val smsStatus = smsManager.sendTextMessage("09380280022", null, "alifss", null, null) as BatteryManager
    //         smsStatus.getIntProperty(SmsManager.BATTERY_PROPERTY_CAPACITY)
    //     }
    
    //     }
}

