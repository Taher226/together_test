import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:together_test/features/auth/data/repositories/send_otp_repository.dart';
import 'send_otp_event.dart';
import 'send_otp_state.dart';
import 'package:flutter/foundation.dart';

class SendOtpBloc extends Bloc<SendOtpEvent, SendOtpState> {
  final SendOtpRepository repository;

  SendOtpBloc(this.repository) : super(SendOtpInitial()) {
    on<SendOtpSubmittedEvent>((event, emit) async {
      emit(SendOtpLoading());
      try {
        final response = await repository.sendOtp(email: event.email);
        if (response.success) {
          emit(SendOtpSuccess(response));
        } else {
          String errorMessage = response.message ?? 'Failed to send OTP';
          
          if (response.messages != null && response.messages!.isNotEmpty) {
            if (response.messages!['email'] != null) {
              String emailMessage = response.messages!['email'].toString();
              if (emailMessage.contains('already been taken')) {
                debugPrint("✅ Email already taken (expected after registration), proceeding with OTP");
                emit(SendOtpSuccess(response));
                return;
              }
              errorMessage = emailMessage;
            } else if (response.messages!['message'] != null) {
              errorMessage = response.messages!['message'].toString();
            }
          }
          
          emit(SendOtpError(errorMessage));
        }
      } catch (e) {
        debugPrint("❌ Send OTP Bloc Error: $e");
        String errorMessage = 'An unexpected error occurred';
        
        if (e.toString().contains('404')) {
          errorMessage = 'User not found or invalid email address.';
        } else if (e.toString().contains('timeout')) {
          errorMessage = 'Request timeout. Please check your internet connection and try again.';
        } else if (e.toString().contains('connection')) {
          errorMessage = 'No internet connection. Please check your network and try again.';
        } else if (e.toString().contains('429')) {
          errorMessage = 'Too many requests. Please wait before trying again.';
        }
        
        emit(SendOtpError(errorMessage));
      }
    });
  }
}
