import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'app_enums.dart';

enum SnackbarType { info, success, failed }

enum ModalType {
  moduleProgressUpdate,
  fullscreenVideo,
  loading,
  fullscreenImage
}

abstract class OverlayContract {
  void showSnackbar({
    String? message,
    String? title,
    SnackbarType alertType = SnackbarType.info,
    String? actionLabel,
    Function? callback,
    SnackbarPosition? position = SnackbarPosition.top,
  });
  Future showModal(ModalType modal, {Map<String, dynamic> arguments});

  Future<void> showAwesomeDialog(
      {DialogType? dialogType,
      required Function() onPrimaryTap,
      String? title,
      Function()? onSecondaryTap,
      String? secondaryText,
      String? primaryText,
      bool? dismissOnBackKeyPress});

  Future<dynamic> appDialog(Widget content, {double? radius});

  Future<dynamic> appBottomSheet(Widget content, {double? radius});

  void showMaterialBanner({
    String? message,
    String? title,
    SnackbarType materialType = SnackbarType.info,
    String? actionLabel,
    Function? callback,
    SnackbarPosition? position = SnackbarPosition.top,
  });

  void clearBanner();
}
