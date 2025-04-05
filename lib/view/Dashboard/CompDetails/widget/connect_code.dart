import 'package:business_dot_com/Controller/data_controller.dart';
import 'package:business_dot_com/model/comp_detail_model.dart';
import 'package:url_launcher/url_launcher.dart';

void openWhatsApp({required int majorListIndex, required int index}) async {
  String phoneNumber =majorCompDetailModelList[majorListIndex][index].mobileNo;
  const message =
      "Hello, as you registered your business on BUSINESS.COM, I saw your profile I want to connect with you.";
  final url = Uri.parse(
      "https://wa.me/+91${phoneNumber}?text=${Uri.encodeComponent(message)}");
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}
