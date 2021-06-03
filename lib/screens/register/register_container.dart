part of 'register.dart';

class RegisterContainer extends StatefulWidget {
  const RegisterContainer({Key? key}) : super(key: key);

  @override
  _RegisterContainerState createState() => _RegisterContainerState();
}

class _RegisterContainerState extends State<RegisterContainer> {
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
      'confirm': FormControl(),
    }, validators: [
      Validators.mustMatch('password', 'confirm')
    ]);
    super.initState();
  }

  void _onSubmit() {
    _formGroup.markAllAsTouched();
    if (_formGroup.valid) {
      final value = _formGroup.value;
      BlocProvider.of<RegisterBloc>(context).add(
        OnPressedRegisterButtonEvent(
          email: (value['email'] as String).trim(),
          password: (value['password'] as String).trim(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const AppBackButton(),
            pinned: true,
            expandedHeight: 128,
            flexibleSpace: AppSpaceBar(title: S.current.registerTitle),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16.0,
            ),
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
                        ValidationMessage.email: S.current.emailIsInvalidError,
                      },
                      onSubmitted: () {
                        _formGroup.control('password').focus();
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: S.current.emailLabel,
                      ),
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
                      onSubmitted: () {
                        _formGroup.control('confirm').focus();
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: S.current.passwordLabel,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ReactiveTextField(
                      formControlName: 'confirm',
                      obscureText: true,
                      autocorrect: false,
                      keyboardType: TextInputType.visiblePassword,
                      validationMessages: (control) => {
                        ValidationMessage.mustMatch:
                            S.current.confirmPasswordIsNotMatchError
                      },
                      decoration: InputDecoration(
                        hintText: S.current.confirmPasswordLabel,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text.rich(
                      TextSpan(
                        text: S.current.termOfServiceAndPrivacyPolicyText,
                        children: [
                          WidgetSpan(
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                S.current.termOfServiceText,
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          TextSpan(text: ' ${S.current.andText} '),
                          WidgetSpan(
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                S.current.privacyPolicyText,
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          const TextSpan(text: '.'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    BlocListener<RegisterBloc, RegisterState>(
                      listener: (context, state) {
                        if (state is RegisterError) {
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
                        if (state is RegisterSuccess) {
                          /// Pop the logout page then replace
                          /// by the loggedInRoot
                          Navigator.pop(context);
                          Navigator.pushReplacementNamed(
                              context, Routes.loggedInRoot);
                        }
                      },
                      child: BlocBuilder<RegisterBloc, RegisterState>(
                        builder: (context, state) {
                          return FilledAppButton(
                            onPressed:
                                state is RegisterInProgress ? null : _onSubmit,
                            child: state is RegisterInProgress
                                ? MiniCircularProgressIndicator(
                                    color: theme.colorScheme.onPrimary,
                                  )
                                : Text(S.current.registerButtonText),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
