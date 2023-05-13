class AuthFailure {
  final String message;
  AuthFailure(this.message);
}

extension AuthFailureExtension on AuthFailure {
  String toMessage() {
    switch (message) {
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'email-already-in-use':
        return 'The account already exists for that email.';

      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided for that user.';

      default:
        return 'Something Wrong';
    }
  }
}
