part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const JOKE_SCREEN = _Paths.JOKE_SCREEN;
  static const AUTH = _Paths.AUTH;
  static const JOKE = _Paths.JOKE;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const JOKE_SCREEN = '/joke-screen';
  static const AUTH = '/auth';
  static const JOKE = '/joke';
}
