import 'dart:developer' as devtools show log;

void showSuccess(String message) {
  devtools.log(message, name: 'SUCCESS');
}

void showError(String message) {
  devtools.log(message, name: 'ERROR');
}

void showWarning(String message) {
  devtools.log(message, name: 'WARNING');
}

void showInfo(String message) {
  devtools.log(message, name: 'INFO');
}

void showDebug(String message) {
  devtools.log(message, name: 'DEBUG');
}
