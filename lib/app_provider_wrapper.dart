part of './main.dart';

class AppProvidersWrapper extends StatelessWidget {
  const AppProvidersWrapper({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>(
            create: (context) => getIt<LanguageCubit>()),
        BlocProvider<AppBloc>(
          create: (context) => getIt<AppBloc>(),
        ),
      ],
      child: child,
    );
  }
}
