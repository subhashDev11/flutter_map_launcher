import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_today/core/app_enums.dart';
import 'package:test_today/core/core.dart';
import 'package:test_today/core/route/navigation_service.dart';
import 'package:test_today/presentation/widgets/common/module_completion_popupe.dart';
import 'package:test_today/presentation/widgets/common/screen_card.dart';

import '../core/helper/app_bottom_sheet.dart';

class OverlayService implements OverlayContract {
  Color _scaffoldMessengerColor(SnackbarType typr) {
    switch (typr) {
      case SnackbarType.info:
        return Colors.black;
      case SnackbarType.success:
        return Colors.cyan.shade700;
      case SnackbarType.failed:
        return Colors.red.shade500;
    }
  }

  IconData _scaffoldMessengerIcon(SnackbarType typr) {
    switch (typr) {
      case SnackbarType.info:
        return Icons.info_outline;
      case SnackbarType.success:
        return Icons.check_circle_outline;
      case SnackbarType.failed:
        return Icons.error_outline;
    }
  }

  double _scaffoldMessengerColorPosition(SnackbarPosition position) {
    final navigationService = getIt<NavigationService>();
    switch (position) {
      case SnackbarPosition.top:
        return MediaQuery.of(navigationService.navigatorKey.currentState!.context).size.height - (120);
      case SnackbarPosition.center:
        return MediaQuery.of(navigationService.navigatorKey.currentState!.context).size.height * 0.5;
      case SnackbarPosition.bottom:
        return 40;
      case SnackbarPosition.topCenter:
        return MediaQuery.of(navigationService.navigatorKey.currentState!.context).size.height * 0.75;
      case SnackbarPosition.bottomCenter:
        return MediaQuery.of(navigationService.navigatorKey.currentState!.context).size.height * 0.25;
      default:
        return 40;
    }
  }

  @override
  void showSnackbar({
    String? message,
    String? title,
    SnackbarType alertType = SnackbarType.info,
    String? actionLabel,
    Function? callback,
    SnackbarPosition? position = SnackbarPosition.top,
  }) {
    final navigationService = getIt<NavigationService>();

    ScaffoldMessenger.of(navigationService.navigatorKey.currentState!.context).showSnackBar(
      SnackBar(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: title != null && title.isNotEmpty,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title ?? '',
                      style: Theme.of(navigationService.navigatorKey.currentState!.context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Icon(
                    _scaffoldMessengerIcon(alertType),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Visibility(
              visible: message != null && message.isNotEmpty,
              child: Text(
                message ?? '',
                style: Theme.of(navigationService.navigatorKey.currentState!.context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
        backgroundColor: _scaffoldMessengerColor(alertType),
        action: (callback != null) && (message != null && message.isNotEmpty)
            ? SnackBarAction(
                label: actionLabel ?? 'Ok',
                onPressed: () => callback,
              )
            : SnackBarAction(
                label: 'Dismiss',
                textColor: Colors.yellow.shade700,
                onPressed: () {
                  ScaffoldMessenger.of(navigationService.navigatorKey.currentState!.context).hideCurrentSnackBar();
                },
              ),
        margin: const EdgeInsets.only(
          bottom: 20,
          left: 10,
          right: 10,
        ),
        padding: const EdgeInsets.all(10),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Future showModal(ModalType modal, {Map<String, dynamic>? arguments, String? title, String? subTitle}) async {
    final navigationService = getIt<NavigationService>();

    switch (modal) {
      case ModalType.moduleProgressUpdate:
        return showDialog(
            context: navigationService.navigatorKey.currentState!.context,
            builder: (context) => ModuleCompletionPopup(
                  achived: 100,
                  initial: 50,
                  title: title,
                  subTitle: subTitle,
                ),
            useSafeArea: false);
      case ModalType.fullscreenImage:
        return showDialog(
            context: navigationService.navigatorKey.currentState!.context,
            builder: (context) => const Center(
                  child: Text('Not implemented'),
                ),
            useSafeArea: false);
      /*case ModalType.fullscreenVideo:
        showDialog(
            context: navigationService.navigatorKey.currentState!.context,
            builder: (context) => FullscreenPlayer(
                  path: arguments!['path'],
                ),
            useSafeArea: false);
        break;*/

      case ModalType.loading:
        showDialog(
          context: navigationService.navigatorKey.currentState!.context,
          builder: (context) => const CircularProgressIndicator(),
          useSafeArea: false,
          barrierDismissible: false,
        );
        break;
    }
  }

  @override
  Future<dynamic> showAwesomeDialog(
      {DialogType? dialogType,
      required Function() onPrimaryTap,
      String? title,
      String? subTitle,
      Function()? onSecondaryTap,
      String? secondaryText,
      String? primaryText,
      bool? dismissOnBackKeyPress}) async {
    final navigationService = getIt<NavigationService>();
    await AwesomeDialog(
      context: navigationService.navigatorKey.currentState!.context,
      title: title,
      titleTextStyle: Theme.of(navigationService.navigatorKey.currentState!.context).textTheme.titleLarge,
      desc: subTitle,
      descTextStyle: Theme.of(navigationService.navigatorKey.currentState!.context).textTheme.titleSmall,
      dialogType: dialogType ?? DialogType.info,
      dismissOnTouchOutside: false,
      btnCancel: onSecondaryTap == null
          ? null
          : ElevatedButton(
              onPressed: () {
                Navigator.of(navigationService.navigatorKey.currentState!.context).pop();
                onSecondaryTap();
              },
              child: Text(
                secondaryText ?? 'Cancel',
                style: TextStyle(
                  color: Theme.of(navigationService.navigatorKey.currentState!.context).primaryColor,
                ),
              ),
            ),
      btnOk: ElevatedButton(
        onPressed: () {
          Navigator.of(navigationService.navigatorKey.currentState!.context).pop();
          onPrimaryTap();
        },
        child: Text(
          primaryText ?? "OK",
          textAlign: TextAlign.center,
        ),
      ),
      dismissOnBackKeyPress: dismissOnBackKeyPress ?? true,
    ).show();
  }

  @override
  Future appDialog(Widget content, {BuildContext? myContext, double? radius}) async {
    final navigationService = getIt<NavigationService>();
    return await showDialog(
      context: myContext ?? navigationService.navigatorKey.currentState!.context,
      barrierDismissible: false,
      barrierLabel: '',
      builder: (myCtx) {
        return Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(
                microseconds: 300,
              ),
              transformAlignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Dialog(
                      child: Stack(
                        children: [
                          NoPopWidget(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: content,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(myCtx).pop();
                              },
                              icon: Icon(
                                Icons.close,
                                size: 30,
                                color: Theme.of(myCtx).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Future appBottomSheet(Widget content, {double? radius}) async {
    final navigationService = getIt<NavigationService>();
    return await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: navigationService.navigatorKey.currentState!.context,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(navigationService.navigatorKey.currentState!.context).size.height * 0.7,
      ),
      builder: (BuildContext context) {
        return SheetContent(content: content);
      },
    );
  }

  @override
  void clearBanner() {
    ScaffoldMessenger.of(getIt<NavigationService>().navigatorKey.currentState!.context).clearMaterialBanners();
  }

  @override
  void showMaterialBanner(
      {String? message,
      String? title,
      SnackbarType materialType = SnackbarType.info,
      String? actionLabel,
      Function? callback,
      SnackbarPosition? position = SnackbarPosition.top}) {
    final navigatorKey = getIt<NavigationService>().navigatorKey;
    ScaffoldMessenger.of(navigatorKey.currentState!.context).showMaterialBanner(MaterialBanner(
      backgroundColor: _scaffoldMessengerColor(materialType),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: title != null,
            child: Text(
              title ?? '',
              style: Theme.of(navigatorKey.currentState!.context).textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
          ),
          Visibility(
            visible: message != null,
            child: Text(
              message ?? '',
              style: Theme.of(navigatorKey.currentState!.context).textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
      leading: Icon(
        _scaffoldMessengerIcon(materialType),
        color: Colors.white,
      ),
      overflowAlignment: OverflowBarAlignment.start,
      actions: [
        TextButton(
          onPressed: () {
            if (callback != null) {
              callback();
            }
            ScaffoldMessenger.of(navigatorKey.currentState!.context).clearMaterialBanners();
            return;
          },
          style: TextButton.styleFrom(foregroundColor: Colors.yellow),
          child: Text(actionLabel ?? "Dismiss"),
        )
      ],
    ));
  }
}

class NoPopWidget extends StatelessWidget {
  const NoPopWidget({Key? key, required this.child, this.futureTask}) : super(key: key);
  final Widget child;
  final Future<bool> Function()? futureTask;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: child,
      onWillPop: () async {
        if (futureTask != null) {
          return await futureTask!();
        } else {
          return await Future.microtask(() => false);
        }
      },
    );
  }
}

class DialogContent extends StatelessWidget {
  const DialogContent({Key? key, required this.content, this.radius}) : super(key: key);
  final Widget content;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return kIsWeb
        ? Content(
            radius: radius,
            child: content,
          )
        : Stack(
            children: [
              ScreenCard(
                color: theme.cardColor,
                borderRadius: radius ?? 10,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.center,
                  child: content,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Material(
                  type: MaterialType.circle,
                  color: Theme.of(context).primaryColor,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 25,
                    ),
                  ),
                ),
              )
            ],
          );
  }
}

class Content extends StatelessWidget {
  const Content({Key? key, required this.child, this.radius}) : super(key: key);
  final Widget child;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 500,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: true,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.close,
                    color: theme.scaffoldBackgroundColor,
                    size: 30,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ScreenCard(
                color: theme.cardColor,
                borderRadius: radius ?? 10,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(20),
                child: child,
              ),
            )
          ],
        ),
      ),
    );
  }
}
