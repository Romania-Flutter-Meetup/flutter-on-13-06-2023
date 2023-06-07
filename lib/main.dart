import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'blocs/bloc_exports.dart';
import 'pages/landing_page.dart';
import 'services/app_router.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory());
  runApp(ToDo(
    appRouter: AppRouter(),
  ));
}

class ToDo extends StatelessWidget {
  const ToDo({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: <BlocProvider<dynamic>>[
          BlocProvider<TodoBloc>(create: (BuildContext context) => TodoBloc()),
          BlocProvider<SettingsBloc>(
              create: (BuildContext context) => SettingsBloc())
        ],
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (BuildContext context, SettingsState state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Todo List',
              theme: state.isDarkModeEnabled
                  ? AppTheme.getDarkTheme(context)
                  : AppTheme.getLightTheme(context),
              home: const LandingPage(),
              onGenerateRoute: appRouter.onGenerateRoute,
            );
          },
        ));
  }
}
