import 'package:html/parser.dart';

String parseHtmlString(String htmlString) {
  var text = parseFragment(htmlString);
  return text.text ?? htmlString;
}
