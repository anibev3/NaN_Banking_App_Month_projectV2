part of './app_pages.dart';

abstract class Routes {
  // SESSION
  static const INITIAL = '/splash';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const LOGINOTP = '/login_otp';
  static const INFOSUP = '/register_info_sup';

  // HOME
  // ignore: constant_identifier_names
  static const HOME = '/home';

  // EPARGNE
  // ignore: constant_identifier_names
  static const EPARGNE = '/epargne';

  // MESSAGERIE
  // ignore: constant_identifier_names
  static const MESSAGERIE = '/messagerie';

  // PROFILE
  // ignore: constant_identifier_names
  static const PROFILE = '/profile';

  // TRANSFERT
  // ignore: constant_identifier_names
  static const TRANSFERT = '/tranfert';

  // STATISTIC
  // ignore: constant_identifier_names
  static const STATISTIC = '/statistic';

  // PARAMETRE
  // ignore: constant_identifier_names
  static const PARAMETRE = '/parametre';

  // PARAMETRE
  // ignore: constant_identifier_names
  static const PAIEMENTSUCCESS = '/paiementsuccess';
  static const PAIEMENTFAILED = '/paiementfailed';
  static const DETAILTRANSACTION = '/detail';
}
