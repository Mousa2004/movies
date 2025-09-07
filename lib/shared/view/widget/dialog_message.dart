import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies/shared/view/widget/app_theme.dart';

class DialogMessage {
  static void showErrorMessage(String? message) {
    Fluttertoast.showToast(
      msg: message ?? "This is Center Short Toast",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppTheme.red,
      textColor: AppTheme.white,
      fontSize: 16.0,
    );
  }

  static void showSuccessMessage() {
    Fluttertoast.showToast(
      msg: "Successfully",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppTheme.green,
      textColor: AppTheme.white,
      fontSize: 16.0,
    );
  }
}
