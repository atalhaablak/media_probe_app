import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:media_probe_app/core/extensions/num_extension.dart';
import 'package:media_probe_app/core/extensions/string_extension.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html/parser.dart' show parse;

class FlutterHtmlWidget extends StatelessWidget {
  const FlutterHtmlWidget({
    Key? key,
    required this.data,
  }) : super(key: key);
  final String data;
  @override
  Widget build(BuildContext context) {
    final document = parse(data); // HTML verisini DOM belgesine çevirin
    final elements = document.getElementsByTagName("p");

    // Sadece "g-body" sınıfına sahip olan <p> etiketleri içindeki metinleri alın
    final filteredElements = elements.where((element) {
      final classes = element.classes;
      return classes.contains("g-body");
    }).toList();

    // Sonuçları bir metin olarak birleştirin
    String result = '';
    for (final element in filteredElements) {
      result += "<br><p>${element.innerHtml}";
    }

    return Html(
      data: result,
      style: {
        "body": Style(
          fontSize: FontSize(14.sp),
          lineHeight: LineHeight.number(1.28),
          fontFamily: 'GeneralSans',
          textAlign: TextAlign.justify,
        ),
        "html": Style(
          fontSize: FontSize(14.sp),
          lineHeight: LineHeight.number(1.28),
          fontFamily: 'GeneralSans',
        )
      },
    );
  }
}
