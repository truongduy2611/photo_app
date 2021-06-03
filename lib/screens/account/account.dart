import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:photo_app/generated/l10n.dart';
import 'package:photo_app/routes/routes.dart';
import 'package:photo_app/widgets/app_space_bar.dart';
import 'package:photo_app/widgets/button.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 128,
              flexibleSpace: AppSpaceBar(
                title: S.current.accountTitle,
              ),
            ),
            if (_auth.currentUser != null)
              SliverToBoxAdapter(
                child: ListTile(
                  leading: _auth.currentUser!.photoURL != null
                      ? Image.network(
                          _auth.currentUser!.photoURL!,
                        )
                      : const Icon(
                          Icons.account_circle_rounded,
                          size: 32,
                        ),
                  title: Text(_auth.currentUser?.displayName ?? 'N/A'),
                  subtitle: Text(_auth.currentUser?.email ?? 'N/A'),
                ),
              ),
            // SliverToBoxAdapter(
            //   child: ListTile(
            //     leading: const Icon(Icons.language_rounded),
            //     title: Text(Localizations.localeOf(context).toLanguageTag()),
            //     onTap: () {
            //       showDialog(
            //           context: context,
            //           builder: (context) {
            //             return AlertDialog(
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(16.0),
            //               ),
            //               title: Text(''),
            //               content: Column(
            //                 mainAxisSize: MainAxisSize.min,
            //                 children: [
            //                   ...S.delegate.supportedLocales.map(
            //                     (o) => ListTile(
            //                       title: Text(o.toLanguageTag()),
            //                       onTap: () {
            //                         S.load(o);
            //                       },
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               actionsPadding: const EdgeInsets.all(12.0),
            //               actions: [
            //                 SizedBox(
            //                   width: MediaQuery.of(context).size.width,
            //                   child: FilledAppButton(
            //                     onPressed: () {
            //                       Navigator.pop(context);
            //                     },
            //                     child: Text(S.current.okTitle),
            //                   ),
            //                 )
            //               ],
            //             );
            //           });
            //     },
            //     // subtitle: Text(_auth.currentUser?.email ?? 'N/A'),
            //   ),
            // ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 360,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SafeArea(
            child: OutlinedAppButton(
              onPressed: () {
                /// TODO create bloc to handle logout event
                FirebaseAuth.instance.signOut().then((_) {
                  Navigator.pushReplacementNamed(
                    context,
                    Routes.logout,
                  );
                });
              },
              child: Text(
                S.current.logoutButtonText.toUpperCase(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
