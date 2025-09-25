import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/auth/data/data_sources/image_list_data_sources.dart';
import 'package:movies/movies/bloc/get_profile_bloc.dart';
import 'package:movies/movies/bloc/get_profile_state.dart';
import 'package:movies/movies/bloc/history_bloc.dart';
import 'package:movies/movies/bloc/history_state.dart';
import 'package:movies/movies/bloc/watch_list_state.dart';
import 'package:movies/movies/bloc/watch_list_bloc.dart';
import 'package:movies/movies/data/models/profile_request.dart';
import 'package:movies/movies/view/screen/update_profile_screen.dart';
import 'package:movies/movies/view/widget/LoadingIndicator.dart';
import 'package:movies/movies/view/widget/customed_column_profile.dart';
import 'package:movies/movies/view/widget/customed_tabbar.dart';
import 'package:movies/shared/view/widget/app_theme.dart';
import 'package:movies/shared/view/widget/customed_button.dart';

class ProfileTab extends StatelessWidget {
  static const String routName = "/ProfileTab";
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileRequest? profile;
    return Scaffold(
      backgroundColor: AppTheme.grey,
      body: SafeArea(
        child: Container(
          color: AppTheme.grey,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: BlocBuilder<GetProfileBloc, GetProfileState>(
                        builder: (context, state) {
                          if (state is GetProfileLoading) {
                            return LoadingIndicator();
                          } else if (state is GetProfileSuccess) {
                            final profile = state.profile.profileRequest;

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  imageAvatarList[(profile?.avaterId ?? 1) - 1]
                                      .imageName,
                                  height: 118,
                                  width: 118,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(height: 15),
                                Text(
                                  profile?.name ?? "Unknown",
                                  style: Theme.of(context).textTheme.titleLarge!
                                      .copyWith(
                                        color: AppTheme.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            );
                          }

                          return SizedBox();
                        },
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: BlocBuilder<WatchListBloc, WatchListState>(
                        builder: (context, state) {
                          int count = 0;
                          if (state is WatchListSuccess) {
                            count = state.count;
                          }
                          return CustomedColumnProfile(
                            number: "$count",
                            text: "Wish List",
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: BlocBuilder<HistoryBloc, HistoryState>(
                        builder: (context, state) {
                          int count = 0;
                          if (state is HistorySuccess) {
                            count = state.count;
                          }
                          return CustomedColumnProfile(
                            number: "$count",
                            text: "History",
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: BlocListener<GetProfileBloc, GetProfileState>(
                      listener: (context, state) {
                        if (state is GetProfileSuccess) {
                          profile = state.profile.profileRequest;
                        }
                      },
                      child: CustomedButton(
                        text: "Edit Profile",
                        onPressed: () {
                          if (profile != null) {
                            Navigator.of(context)
                                .push(
                                  MaterialPageRoute(
                                    builder: (context) => UpdateProfileScreen(
                                      profileRequest: profile!,
                                    ),
                                  ),
                                )
                                .then((updateProfile) {
                                  if (updateProfile == true) {
                                    context.read<GetProfileBloc>().getProfile();
                                  }
                                });
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: MaterialButton(
                        color: AppTheme.red,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(15),
                        ),
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Exit",
                              style: Theme.of(context).textTheme.titleLarge!
                                  .copyWith(color: AppTheme.white),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.exit_to_app,
                              color: AppTheme.white,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(child: CustomedTabbar()),
            ],
          ),
        ),
      ),
    );
  }
}
