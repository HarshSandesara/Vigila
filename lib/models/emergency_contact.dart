import 'package:sms_maintained/sms.dart';

class EmergencyContact {
  final String name;
  final String contactNumber;

  EmergencyContact({this.name, this.contactNumber});
    
  void sendSMS() {
    SmsSender sender = SmsSender();
    SmsMessage message = SmsMessage(contactNumber, 'Sample message');
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
