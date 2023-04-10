enum EmailSignUpResults {
  SignUpCompleted,
  EmailAlreadyPresent,
  SignUpNotCompleted,
  EmailDomainInvalid,
}

enum EmailSignInResults {
  SignInCompleted,
  EmailNotVerified,
  EmailOrPasswordInvalid,
  UnexpectedError,
}
