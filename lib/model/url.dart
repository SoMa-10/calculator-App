
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  // كلاس لانشر
   launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) :  'Could not launch $url';


}