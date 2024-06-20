import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchgame/bloc/ranking/ranking_bloc.dart';
import 'package:matchgame/bloc/match_game/match_game_bloc.dart';
import 'package:matchgame/bloc/user/user_bloc.dart';
import 'package:matchgame/repository/auth_repository.dart';
import 'package:matchgame/repository/ranking_repository.dart';
import 'package:matchgame/repository/match_game_repository.dart';
import 'package:matchgame/ui/screen/home_screen.dart';
import 'package:matchgame/ui/screen/login_screen.dart';
import 'package:matchgame/utils/navigation_widget.dart';
import 'package:matchgame/utils/services/hive_service.dart';
import 'package:matchgame/utils/theme/theme_manager.dart';
import 'package:matchgame/utils/theme/themes.dart';


void main() {
  initialization().then((value) => runApp(const MyApp()));
}

Future<void> initialization() async {
  await HiveService.initHive();
  await Future.delayed(const Duration(seconds: 5));
  //TransformToSql();
}

class AppPage extends Page {
  const AppPage({required String name}) : super(name: name);

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => const MyApp(),
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserBloc>();
    context.read<RankingBloc>().add(LoadingRankingEvent());
    return BlocBuilder<UserBloc, UserState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is UnAuthUserState) {
            return const LoginScreen();
          } else if(state is InAuthUserState){
            return const MyHomePage();
          } else {
            bloc.add(LoadingUserEvent());
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    return super.dispose();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(370, 640),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) => MultiBlocProvider(
          providers: [
            BlocProvider<UserBloc>(create: (_) => UserBloc(const AuthRepository())),
            BlocProvider<RankingBloc>(create: (_) => RankingBloc(const RankingRepository())),
            BlocProvider<MatchGameBloc>(create: (_) => MatchGameBloc(const MatchGameRepository()),)
          ],
          child: MaterialApp(
            title: 'Match Game',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: _themeManager.themeMode,
            home: const NavigationWidget(),
          ),
        )
    );
  }
}

