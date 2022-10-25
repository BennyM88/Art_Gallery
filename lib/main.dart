import 'package:art_gallery/cubits/comments_cubit/comments_cubit.dart';
import 'package:art_gallery/cubits/connection_cubit/connection_cubit.dart';
import 'package:art_gallery/cubits/photos_cubit/photos_cubit.dart';
import 'package:art_gallery/services/network_services/network_service.dart';
import 'package:art_gallery/view/pages/home_page.dart';
import 'package:art_gallery/view/transition/enter_exit.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const MyApp());
}

NetworkService networkService = NetworkService();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<PhotosCubit>(
              create: (context) => PhotosCubit(),
            ),
            BlocProvider<CommentsCubit>(
              create: (context) => CommentsCubit(),
            ),
            BlocProvider<ConnectionCheckCubit>(
              create: (context) => ConnectionCheckCubit(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              pageTransitionsTheme: PageTransitionsTheme(
                builders: {
                  TargetPlatform.android: EnterExitTransitionsBuilder(),
                  TargetPlatform.iOS:
                      const CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
                },
              ),
            ),
            home: const HomePage(),
          ),
        );
      },
    );
  }
}
