import 'package:flutter/material.dart';
import 'package:photo_app/generated/l10n.dart';
import 'package:photo_app/widgets/app_space_bar.dart';
import 'package:photo_app/widgets/back_button.dart';
import 'package:photo_app/widgets/button.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
  }

  @override
  Widget build(BuildContext context) {
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
                    FilledAppButton(
                      onPressed: _onSubmit,
                      child: Text(S.current.registerButtonText),
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
