import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthCubit() : super(AuthInitialState());

  Future<void> signUp({required String email, required String password}) async {
    emit(AuthLoadingState());
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

      final user = credential.user;
      if(user != null){
        await FirebaseFirestore.instance
          .collection('users').doc(credential.user!.uid)
          .set({
          'email': email,
          'uid' : user.uid,
      });}

      emit(AuthSuccessState(credential.user!));
    } catch (err) {
      emit(AuthErrorState(
        error : err.toString(),
      ));
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    emit(AuthLoadingState());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      emit(AuthSuccessState(credential.user!));
    } catch (err) {
      emit(AuthErrorState(
        error : err.toString(),
      ));
    }
  }

  Future<void> signOut() async {
    emit(AuthLoadingState());
    try {
      await FirebaseAuth.instance.signOut();
      emit(AuthInitialState());
    } catch (err) {
      emit(AuthErrorState(
        error : err.toString(),
      ));
    }
  }

  User getLoggedInUser() {
    return FirebaseAuth.instance.currentUser!;
  }

  void togglePasswordVisibility() {
    final newVisibility = !state.isPasswordHidden;
    emit(AuthPasswordVisibilityChangedState(isPasswordHidden: newVisibility));
  }
}
