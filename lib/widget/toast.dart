import 'package:fluttertoast/fluttertoast.dart';
import '../config/app_color.dart';

Future<bool?> toast({
  String msg = "",
}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: ColorConst.green,
    textColor: ColorConst.white,
    fontSize: 16.0,
  );
}
