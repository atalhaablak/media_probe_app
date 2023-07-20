import 'package:flutter/material.dart';
import 'package:media_probe_app/core/extensions/string_extension.dart';
import 'package:media_probe_app/core/ui/style/global_text_styles.dart';
import 'package:media_probe_app/core/ui/widget/ui_state.dart';

/*

 API çağrılarına yanıtları işlemek için kullanılan bir yapı sunar. 

 */

class ApiResponseBuilder<T> extends StatelessWidget {
  const ApiResponseBuilder({
    Key? key,
    required this.response,
    required this.builder,
    this.idleWidget,
    this.loadingWidget,
    this.errorWidget,
  }) : super(key: key);
  final UIState<T> response;
  final Function(T) builder;
  final Widget? idleWidget;
  final Widget? loadingWidget;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    switch (response.status) {
      case UIStateStatus.idle:
        return idleWidget ?? const SizedBox.shrink();
      case UIStateStatus.loading:
        return Center(child: loadingWidget ?? const CircularProgressIndicator.adaptive());
      case UIStateStatus.success:
        return builder(response.data as T);
      case UIStateStatus.error:
        return errorWidget ?? Text(response.message.getValueOrDefault, style: context.px16w500);
    }
  }
}
