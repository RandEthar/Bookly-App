import 'package:bookly_app/core/utils/functions/custom_snack_bar.dart';

import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String myurl) async {
  if (myurl!=null) {
  final Uri url = Uri.parse(myurl);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    showSnakcBar(context,"cannot luncher $myurl");
  }
}
}


