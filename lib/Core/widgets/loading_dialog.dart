import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';

dynamic showLoadingDialog(context) => showDialog(
  context: context,
  barrierDismissible: false,
  builder: (_) => Center(child: CustomLoadingIndicator()),
);
