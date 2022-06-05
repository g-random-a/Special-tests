import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/application/hospital%20profile/bloc/hospitalBloc.dart';
import 'package:special_tests/application/hospital_list/bloc/popularHospitalBloc.dart';
import 'package:special_tests/presentation/Common/Color.dart';
import 'package:special_tests/presentation/pages/index.dart';
import 'package:special_tests/infrastructure/index.dart';
import 'package:special_tests/application/index.dart';
import 'package:special_tests/presentation/pages/signup/clientRegistration.dart';
import 'package:special_tests/presentation/pages/signup/hospitalRegistration.dart';
import 'package:special_tests/presentation/pages/special_tests/detail.dart';
import 'package:special_tests/presentation/pages/user/CommonUserProfileEdit.dart';
part 'routes.dart';

void main() {
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
          create: (context) =>
              AuthRepository(authDataProvider: AuthDataProvider())),
      RepositoryProvider(
          create: (context) =>
              UserRepository(dataProvider: UserDataProvider())),
      RepositoryProvider(
          create: (context) =>
              ClientRepository(dataProvider: ClientDataProvider())),
      RepositoryProvider(
          create: (context) =>
              HospitalRepository(dataProvider: HospitalDataProvider())),
      RepositoryProvider(
          create: (context) =>
              RequestRepository(dataProvider: RequestDataProvider())),
      RepositoryProvider(
          create: (context) =>
              SpecialTestRepository(dataProvider: SpecialTestDataProvider())),
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthStatusBloc(context.read<AuthRepository>())
              ..add(CheckAuthenticationEvent())),
        BlocProvider(
            create: (context) => AuthBloc(context.read<AuthRepository>())),
        BlocProvider(create: (context) => RoleBloc()),
        BlocProvider(
          create: (context) => hospitalBloc(
              hospitalRepository: context.read<HospitalRepository>()),
        ),
        BlocProvider(
          create: (context) =>
              ClientBloc(clientRepository: context.read<ClientRepository>()),
        ),
        BlocProvider(
            create: (context) => hospitalTestsBloc(
                hospitalRepository: context.read<HospitalRepository>())),
        BlocProvider(
            create: (context) => HospProfileEditBloc(
                hospitalRepository: context.read<HospitalRepository>())),
        BlocProvider(
            create: (context) => hospitalListBloc(
                hospitalRepository: context.read<HospitalRepository>())),
        BlocProvider(
            create: (context) => PopularHospitalBloc(
                hospitalRepository: context.read<HospitalRepository>())),
        BlocProvider(
            create: (context) => requestbloc(
                requestRepository: context.read<RequestRepository>())),
        BlocProvider(
            create: (context) => requestUpdatebloc(
                requestRepository: context.read<RequestRepository>())),
        BlocProvider(
            create: (context) => specialTestBloc(
                specialTestRepository: context.read<SpecialTestRepository>())),
        BlocProvider(
            create: (context) => CatagoryTestBloc(
                hospitalRepository: context.read<HospitalRepository>())),
        BlocProvider(
            create: (context) => TestDetailBloc(
                specialTestRepository: context.read<SpecialTestRepository>())),
        BlocProvider(
            create: (context) =>
                UserBloc(userRepository: context.read<UserRepository>())),
      ],
      child: MaterialApp.router(
        routeInformationParser: router().routeInformationParser,
        routerDelegate: router().routerDelegate,
        debugShowCheckedModeBanner: false,
        title: "Special Tests",
      ),
    ),
  ));
}

class SpecialTests extends StatelessWidget {
  const SpecialTests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthStatusBloc, AuthStatusState>(
        listener: (context, state) {
      if (state is AuthenticatedState) {
        final userData = state.user;
        switch (userData.role) {
          case 'CLIENT':
            BlocProvider.of<PopularHospitalBloc>(context)
                .add(loadPopularHospital());
            context.goNamed("home");
            break;
          default:
            BlocProvider.of<hospitalBloc>(context).add(loadHospitalfromDb());
            context.goNamed("hospital_profile");
        }
      } else {
        context.goNamed("selectRole");
      }
    }, builder: (context, state) {
      BlocProvider.of<AuthStatusBloc>(context).add(CheckAuthenticationEvent());
      return Scaffold(
        body: Center(
          child: SizedBox(
            width: 25,
            height: 25,
            child: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ),
          ),
        ),
      );
    });
  }
}
