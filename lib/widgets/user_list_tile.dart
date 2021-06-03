import 'package:flutter/material.dart';
import 'package:photo_app/models/unsplash_user.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({Key? key, this.user, this.textColor}) : super(key: key);

  final UnsplashUserModel? user;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        ClipOval(
          child: user?.profileImage != null
              ? Image.network(
                  user!.profileImage!.medium!,
                  height: 32,
                  width: 32,
                )
              : const Icon(
                  Icons.account_circle_rounded,
                  size: 32,
                ),
        ),
        const SizedBox(width: 12.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user?.name ?? 'User',
              style: theme.textTheme.subtitle2?.copyWith(
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
            Text(
              '@${user?.username ?? 'username'}',
              style: TextStyle(color: textColor),
            )
          ],
        ),
      ],
    );
  }
}
