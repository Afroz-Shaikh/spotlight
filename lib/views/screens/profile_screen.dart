import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spotlight/constants.dart';

import '../../controllers/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  final String uid;
  const ProfileScreen({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    profileController.updateUserId(widget.uid);
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   profileController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    bool i = Navigator.canPop(context);
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          if (controller.user.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    i
                        ? InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 20.w),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipOval(
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: controller.user['profilePhoto'],
                                    height: 100,
                                    width: 100,
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.error,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.user['name'],
                                      style: h1.copyWith(fontSize: 18),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                controller.user['verified'] == true
                                    ? Icon(
                                        Icons.verified,
                                        color: Colors.blue,
                                      )
                                    : SizedBox.shrink()
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      controller.user['following'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      'Following',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  color: Colors.black54,
                                  width: 1,
                                  height: 15,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      controller.user['followers'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      'Followers',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  color: Colors.black54,
                                  width: 1,
                                  height: 15,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      controller.user['likes'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      'Likes',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              onTap: () => {
                                if (widget.uid == authController.user.uid)
                                  {authController.signOut()}
                                else
                                  {controller.followUser()}
                              },
                              child: Container(
                                child: Center(
                                  child: Text(
                                    widget.uid == authController.user.uid
                                        ? 'Sign Out'
                                        : controller.user['isFollowing']
                                            ? 'Unfollow'
                                            : 'Follow',
                                    style: h3.copyWith(
                                        color: Colors.white,
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                height: 35.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: appRed),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            // Container(
                            //   width: 140,
                            //   height: 47,
                            //   decoration: BoxDecoration(
                            //     border: Border.all(
                            //       color: Colors.black12,
                            //     ),
                            //   ),
                            //   child: Center(
                            //     child: InkWell(
                            //       onTap: () {
                            //         if (widget.uid == authController.user.uid) {
                            //           authController.signOut();
                            //         } else {
                            //           controller.followUser();
                            //         }
                            //       },
                            //       child: Text(
                            //         widget.uid == authController.user.uid
                            //             ? 'Sign Out'
                            //             : controller.user['isFollowing']
                            //                 ? 'Unfollow'
                            //                 : 'Follow',
                            //         style: const TextStyle(
                            //           fontSize: 15,
                            //           fontWeight: FontWeight.bold,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            const SizedBox(
                              height: 25,
                            ),
                            // video list
                            controller.user['thumbnails'].length != 0
                                ? GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        controller.user['thumbnails'].length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1,
                                      crossAxisSpacing: 5,
                                    ),
                                    itemBuilder: (context, index) {
                                      String thumbnail =
                                          controller.user['thumbnails'][index];
                                      return CachedNetworkImage(
                                        imageUrl:
                                            'https://user-images.githubusercontent.com/101482/29592647-40da86ca-875a-11e7-8bc3-941700b0a323.png',
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  )
                                : Center(
                                    child: Text(
                                      'No Videos Available',
                                      style: h3,
                                    ),
                                  )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
