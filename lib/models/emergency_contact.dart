import 'package:sms_maintained/sms.dart';
import 'package:geolocator/geolocator.dart';

class EmergencyContact {
  final String name;
  final String contactNumber;

  EmergencyContact({this.name, this.contactNumber});

  void sendSMS(Position currentPosition) {
    SmsSender sender = SmsSender();
    SmsMessage message = SmsMessage(contactNumber,
        'Please come and rescue me! I am at the location: maps.google.com/?ll=${currentPosition.latitude},${currentPosition.longitude}');
    // message.onStateChanged.listen((state) {
    //   if (state == SmsMessageState.Sent) {
    //     print("SMS is sent!");
    //   } else if (state == SmsMessageState.Delivered) {
    //     print("SMS is delivered!");
    //   }
    // });
    sender.sendSms(message);
  }
}
