import 'package:get_started_boilerplate/core/common/constants/constants.dart';

abstract class Strings {
  static const appName = Constants.appName;

  static const String cantBeEmpty = "can't be empty.";
  static const String fieldCantBeEmpty = 'Field $cantBeEmpty';
  static const String enterValid = 'Please enter a valid';
  static const otpValidation = 'Invalid OTP';

  static const String emailCantBeEmpty = 'Email $cantBeEmpty';
  static const String enterValidEmail = '$enterValid email.';

  static const String password = 'Password';
  static const String passwordCantBeEmpty = '$password $cantBeEmpty';
  static const String passwordValidation =
      '$password must be at least 6 characters long.';
  static const confirmPasswordValidation =
      '$password and Confirm password should be same.';


  static const mobileNumber = 'Mobile Number';
  static const String enterValidNumber = '$enterValid $mobileNumber.';

  static const checkboxValidation = 'Dummy Checkbox Validation Message';
}