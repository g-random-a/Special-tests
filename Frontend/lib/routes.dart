part of 'main.dart';

class Routes extends Equatable {
  static const login = '/login';
  static const home = '/';
  static const selectRole = '/selectRole';
  static const clientSignup = '/clientSignup';
  static const hospitalSignup = '/hospitalSignup';
  static const hospitalList = '/hospitalList';
  static const editProfile = '/editProfile';
  static const special_test = '/special_test';
  static const notification = '/notification';
  static const hospital_profile = '/hospital_profile';
  static const request = '/request';
  static const userProfile = '/userProfile';
  static const editHospitalProfile = '/editHospitalProfile';
  static const editAddTests = '/editAddTests';
  static const userNotification = '/userNotification';
  static const testDetail = '/testDetail';
  static const signup = '/signup';
  static const check = '/check';
  static const Commonprofile = '/CommonUserProfileEdit';

  @override
  List<Object?> get props => [
        login,
        home,
        selectRole,
        clientSignup,
        hospitalSignup,
        hospitalList,
        editProfile,
        special_test,
        notification,
        hospital_profile,
        request,
        userProfile,
        editHospitalProfile,
        editAddTests,
        userNotification,
        testDetail,
        signup,
        check,
        Commonprofile
      ];
}

GoRouter router([String? initialLocation]) => GoRouter(
      initialLocation: '/check',
      routes: [
        GoRoute(
            name: 'checkStatus',
            path: '/check',
            pageBuilder: (context, state) => MaterialPage(
                  child: SpecialTests(),
                )),
        GoRoute(
            name: 'home',
            path: '/',
            pageBuilder: (context, state) => MaterialPage(
                  child: home(),
                )),
        GoRoute(
            name: 'login',
            path: '/login',
            pageBuilder: (context, state) => MaterialPage(
                  child: LoginPage(),
                )),
        GoRoute(
            name: 'selectRole',
            path: '/selectRole',
            pageBuilder: (context, state) => MaterialPage(
                  child: SelectRole(),
                )),
        GoRoute(
            name: 'signup',
            path: '/signup',
            pageBuilder: (context, state) => MaterialPage(
                  child: RegistrationPage(),
                )),
        GoRoute(
            name: 'hospitalList',
            path: '/hospitalList',
            pageBuilder: (context, state) => MaterialPage(
                  child: HospitalList(),
                )),
        GoRoute(
            name: 'editProfile',
            path: '/editProfile',
            pageBuilder: (context, state) => MaterialPage(
                  child: EditProfile(),
                )),
        GoRoute(
            name: 'special_test',
            path: '/special_test',
            pageBuilder: (context, state) => MaterialPage(
                  child: Special_test(),
                )),
        GoRoute(
            name: 'notification',
            path: '/notification',
            pageBuilder: (context, state) => MaterialPage(
                  child: Notify(),
                )),
        GoRoute(
            name: 'hospital_profile',
            path: '/hospital_profile',
            pageBuilder: (context, state) => MaterialPage(
                  child: Hospital_Profile(),
                )),
        GoRoute(
            name: 'request',
            path: '/request',
            pageBuilder: (context, state) => MaterialPage(
                  child: Request(),
                )),
        GoRoute(
            name: 'userProfile',
            path: '/userProfile',
            pageBuilder: (context, state) => MaterialPage(
                  child: User_profile(),
                )),
        GoRoute(
          path: '/editHospitalProfile',
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: HospitalEditProfile(),
          ),
        ),
        GoRoute(
            name: 'userNotification',
            path: '/userNotification',
            pageBuilder: (context, state) => MaterialPage(
                  child: userNotification(),
                )),
        GoRoute(
            name: 'testDetail',
            path: '/testDetail',
            pageBuilder: (context, state) => MaterialPage(
                  child: Detail(),
                )),
        GoRoute(
            name: 'clientSignup',
            path: '/clientSignup',
            pageBuilder: (context, state) => MaterialPage(
                  child: ClientRegistrationPageTwo(),
                )),
        GoRoute(
            name: 'hospitalSignup',
            path: '/hospitalSignup',
            pageBuilder: (context, state) => MaterialPage(
                  child: HospitalRegistrationPageTwo(),
                )),
        GoRoute(
            name: 'editAddTests',
            path: '/editAddTests',
            pageBuilder: (context, state) => MaterialPage(
                  child: editAddTests(),
                )),
        GoRoute(
            name: 'CommonUserProfileEdit',
            path: '/CommonUserProfileEdit',
            pageBuilder: (context, state) => MaterialPage(
                  child: CommonUserProfileEdit(),
                )),
      ],
      errorPageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(state.error.toString()),
          ),
        ),
      ),
    );
