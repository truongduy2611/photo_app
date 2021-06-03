import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_app/generated/l10n.dart';
import 'package:photo_app/models/unsplash_photo.dart';
import 'package:photo_app/repositories/photo/repository.dart';
import 'package:photo_app/screens/home/bloc/photo_list_bloc.dart';
import 'package:photo_app/screens/home/bloc/today_photo_bloc.dart';
import 'package:photo_app/widgets/app_space_bar.dart';
import 'package:photo_app/widgets/button.dart';
import 'package:photo_app/widgets/empty_container.dart';
import 'package:photo_app/widgets/error_container.dart';
import 'package:photo_app/widgets/network_image.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'home_page.dart';
part 'home_container.dart';
part 'today_photo_container.dart';
