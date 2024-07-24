import 'package:go_router/go_router.dart';
import 'package:matricula/views/auth/forget_password.dart';
import 'package:matricula/views/auth/login.dart';
import 'package:matricula/views/auth/registration.dart';
import 'package:matricula/views/chapterDetail/chapter_detail.dart';
import 'package:matricula/views/chapters/chapters.dart';
import 'package:matricula/views/downloads/donwload.dart';
import 'package:matricula/views/home/home_view.dart';
import 'package:matricula/views/library/library.dart';
import 'package:matricula/views/liveClass/live_class.dart';
import 'package:matricula/views/mainScreen/main_screen.dart';
import 'package:matricula/views/notes/notes.dart';
import 'package:matricula/views/profile/profile.dart';
import 'package:matricula/views/profile/update_profile.dart';
import 'package:matricula/views/progress/progress.dart';
import 'package:matricula/views/refer/refer.dart';
import 'package:matricula/views/splash/splash.dart';
import 'package:matricula/views/subscribe/subscribe.dart';
import 'package:matricula/views/test/test.dart';

enum AppRoute {
  home,
  login,
  registration,
  splash,
  mainScreenView,
  chapter,
  chapterDetail,
  test,
  liveClass,
  profile,
  notes,
  library,
  subscribe,
  updateProfile,
  download,
  progress,
  forgetPassword,
  refer
}

// flutter packages pub run build_runner build --delete-conflicting-outputs
final routers = [
  GoRoute(
    path: '/home',
    name: AppRoute.home.name,
    builder: (context, state) => const HomeView(),
  ),
  GoRoute(
    path: '/',
    name: AppRoute.splash.name,
    builder: (context, state) => const Splash(),
  ),
  GoRoute(
    path: '/login',
    name: AppRoute.login.name,
    builder: (context, state) => const Login(),
  ),
  GoRoute(
    path: '/registration',
    name: AppRoute.registration.name,
    builder: (context, state) => const Registration(),
  ),
  GoRoute(
    path: '/mainScreenView',
    name: AppRoute.mainScreenView.name,
    builder: (context, state) => const MainScreenView(),
  ),
  GoRoute(
    path: '/chapter',
    name: AppRoute.chapter.name,
    builder: (context, state) => const Chapter(),
  ),
  GoRoute(
    path: '/chapterDetail',
    name: AppRoute.chapterDetail.name,
    builder: (context, state) => const ChapterDetail(),
  ),
  GoRoute(
    path: '/test',
    name: AppRoute.test.name,
    builder: (context, state) => const Test(),
  ),
  GoRoute(
    path: '/subscribe',
    name: AppRoute.subscribe.name,
    builder: (context, state) => const Subscribe(),
  ),
  GoRoute(
    path: '/updateProfile',
    name: AppRoute.updateProfile.name,
    builder: (context, state) => const UpdateProfile(),
  ),
  GoRoute(
    path: '/profile',
    name: AppRoute.profile.name,
    builder: (context, state) => const Profile(),
  ),
  GoRoute(
    path: '/notes',
    name: AppRoute.notes.name,
    builder: (context, state) => const Notes(),
  ),
  GoRoute(
    path: '/download',
    name: AppRoute.download.name,
    builder: (context, state) => const Download(),
  ),
  GoRoute(
    path: '/liveClass',
    name: AppRoute.liveClass.name,
    builder: (context, state) => const LiveClass(),
  ),
  GoRoute(
    path: '/progress',
    name: AppRoute.progress.name,
    builder: (context, state) => const Progress(),
  ),
  GoRoute(
    path: '/library',
    name: AppRoute.library.name,
    builder: (context, state) => const Library(),
  ),
  GoRoute(
    path: '/forgetPassword',
    name: AppRoute.forgetPassword.name,
    builder: (context, state) => const ForgetPassword(),
  ),
  GoRoute(
    path: '/refer',
    name: AppRoute.refer.name,
    builder: (context, state) => const Refer(),
  ),
];
