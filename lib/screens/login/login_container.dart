part of 'login.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({Key? key}) : super(key: key);

  @override
  _LoginContainerState createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  late FormGroup _formGroup;

  @override
  void initState() {
    _formGroup = FormGroup({
      'email': FormControl(
        validators: [
          Validators.email,
          Validators.required,
        ],
      ),
      'password': FormControl(
        validators: [
          Validators.required,
        ],
      ),
    });
    super.initState();
  }

  void _onSubmit() {
    _formGroup.markAllAsTouched();
    if (_formGroup.valid) {
      final value = _formGroup.value;
      BlocProvider.of<LoginBloc>(context).add(
        OnPressedLoginButtonEvent(
          email: (value['email'] as String).trim(),
          password: (value['password'] as String).trim(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final layout = context.layout;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const AppBackButton(),
            pinned: true,
            expandedHeight: 128,
            flexibleSpace: AppSpaceBar(title: S.current.loginTitle),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: layout.gutter,
              horizontal: layout.fluidGutter,
            ),
            sliver: SliverSafeArea(
              top: false,
              sliver: SliverToBoxAdapter(
                child: ReactiveForm(
                  formGroup: _formGroup,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 16.0),
                      ReactiveTextField(
                        formControlName: 'email',
                        autocorrect: false,
                        validationMessages: (control) => {
                          ValidationMessage.required:
                              S.current.emailIsRequiredError,
                          ValidationMessage.email:
                              S.current.emailIsInvalidError,
                        },
                        decoration: InputDecoration(
                          hintText: S.current.emailLabel,
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        onSubmitted: () {
                          _formGroup.control('password').focus();
                        },
                      ),
                      const SizedBox(height: 16.0),
                      ReactiveTextField(
                        formControlName: 'password',
                        obscureText: true,
                        autocorrect: false,
                        validationMessages: (control) => {
                          ValidationMessage.required:
                              S.current.passwordIsRequiredError
                        },
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: S.current.passwordLabel,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      BlocListener<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state is LoginError) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                title: Text(state.message),
                                actionsPadding: const EdgeInsets.all(12.0),
                                actions: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: FilledAppButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(S.current.okTitle),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }
                          if (state is LoginSuccess) {
                            /// Pop the logout page then replace
                            /// by the loggedInRoot
                            Navigator.pop(context);
                            Navigator.pushReplacementNamed(
                                context, Routes.loggedInRoot);
                          }
                        },
                        child: BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return FilledAppButton(
                              onPressed:
                                  state is LoginInProgress ? null : _onSubmit,
                              child: state is LoginInProgress
                                  ? MiniCircularProgressIndicator(
                                      color: theme.colorScheme.onPrimary,
                                    )
                                  : Text(S.current.loginButtonText),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
