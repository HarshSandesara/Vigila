import 'package:sms_maintained/sms.dart';
import 'package:geolocator/geolocator.dart';

class EmergencyContact {
  final String name;
  final String contactNumber;

  EmergencyContact({this.name, this.contactNumber});

  Future<void> sendSMS(Position currentPosition) async {
    // Sends SMS with the current position to users
    SmsSender sender = SmsSender();
    SmsMessage message = SmsMessage(contactNumber,
        'Please come and rescue me! I am at the location: maps.google.com/?ll=${currentPosition.latitude},${currentPosition.longitude}');
    await sender.sendSms(message);
  }
}
