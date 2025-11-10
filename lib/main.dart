import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:together_test/features/auth/data/repositories/forget_password_repository_impl.dart';
import 'package:together_test/features/auth/data/repositories/login_repository_impl.dart';
import 'package:together_test/features/auth/data/repositories/register_repository_impl.dart';
import 'package:together_test/features/auth/data/repositories/reset_password_repository_impl.dart';
import 'package:together_test/features/auth/data/repositories/verify_email_repository_impl.dart';
import 'package:together_test/features/auth/data/repositories/verify_otp_repository_impl.dart';
import 'package:together_test/features/auth/domain/useCases/forget_password_useCase.dart';
import 'package:together_test/features/auth/domain/useCases/login_useCase.dart';
import 'package:together_test/features/auth/domain/useCases/register_useCase.dart';
import 'package:together_test/features/auth/domain/useCases/reset_password_useCase.dart';
import 'package:together_test/features/auth/domain/useCases/verify_email_useCase.dart';
import 'package:together_test/features/auth/domain/useCases/verify_otp_useCase.dart';
import 'package:together_test/features/auth/presentation/bloc/forgetPassword/forget_password_bloc.dart';
import 'package:together_test/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:together_test/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:together_test/features/auth/presentation/bloc/resetPassword/reset_password_bloc.dart';
import 'package:together_test/features/auth/presentation/bloc/verifyEmail/verify_email_bloc.dart';
import 'package:together_test/features/auth/presentation/bloc/verifyOtp/verify_otp_bloc.dart';
import 'package:together_test/features/auth/presentation/pages/emailLogin.dart';
import 'package:together_test/features/auth/presentation/pages/passwordLogin.dart';
import 'package:together_test/features/auth/presentation/pages/register.dart';
import 'package:together_test/features/common/presentation/pages/bottomTabs.dart';
import 'package:together_test/campaigns.dart';
import 'package:together_test/donate.dart';
import 'package:together_test/features/home/presentation/pages/home.dart';
import 'package:together_test/features/more/data/repositories/change_email_repository_impl.dart';
import 'package:together_test/features/more/data/repositories/change_password_repository_impl.dart';
import 'package:together_test/features/more/data/repositories/check_password_repository_impl.dart';
import 'package:together_test/features/more/data/repositories/edit_profile_repository_impl.dart';
import 'package:together_test/features/more/data/repositories/logout_repository_impl.dart';
import 'package:together_test/features/more/data/repositories/reset_email_repository_impl.dart';
import 'package:together_test/features/more/domain/usecases/change_email_useCase.dart';
import 'package:together_test/features/more/domain/usecases/change_password_useCase.dart';
import 'package:together_test/features/more/domain/usecases/check_password_useCase.dart';
import 'package:together_test/features/more/domain/usecases/edit_profile_useCase.dart';
import 'package:together_test/features/more/domain/usecases/logout_useCase.dart';
import 'package:together_test/features/more/domain/usecases/reset_email_useCase.dart';
import 'package:together_test/features/more/presentation/bloc/changeEmail/change_email_bloc.dart';
import 'package:together_test/features/more/presentation/bloc/changePassword/change_password_bloc.dart';
import 'package:together_test/features/more/presentation/bloc/checkPassword/check_password_bloc.dart';
import 'package:together_test/features/more/presentation/bloc/editProfile/edit_profile_bloc.dart';
import 'package:together_test/features/more/presentation/bloc/logout/log_out_bloc.dart';
import 'package:together_test/features/more/presentation/bloc/resetEmail/reset_email_bloc.dart';
import 'package:together_test/features/more/presentation/pages/more.dart';
import 'package:together_test/features/auth/presentation/pages/reset_password.dart';
import 'package:together_test/features/programs/presentation/pages/programs.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/more/presentation/pages/aboutUs.dart';
import 'package:together_test/features/more/presentation/pages/faq.dart';
import 'package:together_test/features/more/presentation/pages/privacyPolicy.dart';
import 'package:together_test/features/more/presentation/pages/subscriptions.dart';
import 'package:together_test/features/more/presentation/pages/termsAndConditions.dart';
import 'package:together_test/features/more/presentation/pages/transactionHistory.dart';
import 'package:together_test/features/auth/presentation/pages/orgList.dart';
import 'package:together_test/features/programs/presentation/pages/paymentMethod.dart';
import 'package:together_test/features/more/presentation/pages/profile.dart';
import 'package:together_test/features/programs/presentation/pages/programDetails.dart';
import 'package:together_test/features/splash/presentation/pages/splash.dart';

void main() {
  DioHelper.init(null);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) => RegisterBloc(RegisterUseCase(RegisterRepositoryImpl())),
        ),
        BlocProvider(
          create:
              (_) => VerifyEmailBloc(
                VerifyEmailUseCase(VerifyEmailRepositoryImpl()),
              ),
        ),
        BlocProvider(
          create: (_) => LoginBloc(LoginUseCase(LoginRepositoryImpl())),
        ),
        BlocProvider(
          create:
              (_) => ForgetPasswordBloc(
                ForgetPasswordUseCase(ForgetPasswordRepositoryImpl()),
              ),
        ),
        BlocProvider(
          create:
              (_) => VerifyOtpBloc(VerifyOtpUseCase(VerifyOtpRepositoryImpl())),
        ),
        BlocProvider(
          create:
              (_) => ResetPasswordBloc(
                ResetPasswordUseCase(ResetPasswordRepositoryImpl()),
              ),
        ),
        BlocProvider(
          create: (_) => LogoutBloc(LogoutUseCase(LogoutRepositoryImpl())),
        ),
        BlocProvider(
          create:
              (_) => EditProfileBloc(
                EditProfileUseCase(EditProfileRepositoryImpl()),
              ),
        ),
        BlocProvider(
          create:
              (_) => ChangePasswordBloc(
                ChangePasswordUseCase(ChangePasswordRepositoryImpl()),
              ),
        ),
        BlocProvider(
          create:
              (_) => CheckPasswordBloc(
                CheckPasswordUseCase(CheckPasswordRepositoryImpl()),
              ),
        ),
        BlocProvider(
          create:
              (_) => ChangeEmailBloc(
                ChangeEmailUseCase(ChangeEmailRepositoryImpl()),
              ),
        ),
        BlocProvider(
          create:
              (_) =>
                  ResetEmailBloc(ResetEmailUseCase(ResetEmailRepositoryImpl())),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      routes: {
        'orgList': (context) => OrgList(),
        'emailLogin': (context) => EmailLogin(),
        'register': (context) => Register(),
        'passwordLogin': (context) => PasswordLogin(),
        'resetPassword': (context) => ResetPassword(),
        'bottomTabs': (context) => BottomTabs(),
        'home': (context) => Home(),
        'programs': (context) => Programs(),
        'donate': (context) => Donate(),
        'campaigns': (context) => Campaigns(),
        'more': (context) => More(),
        'profile': (context) => Profile(),
        'programDetails': (context) => ProgramDetails(),
        'paymentMethod': (context) => PaymentMethod(),
        'aboutUs': (context) => AboutUs(),
        'faq': (context) => FAQ(),
        'privacyPolicy': (context) => PrivacyPolicy(),
        'termsAndConditions': (context) => TermsAndConditions(),
        'subscriptions': (context) => Subscriptions(),
        'transactionHistory': (context) => TransactionHistory(),
      },
    );
  }
}
