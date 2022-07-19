import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spotlight/constants.dart';
import 'package:spotlight/views/screens/video_add_details_screen.dart';
import 'package:spotlight/views/widgets/navigation.dart';

class AddVideo extends StatelessWidget {
  const AddVideo({Key? key}) : super(key: key);

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Navigator.of(context).push(SliderTransition(VideoDetailScreen(
        videoFile: File(video.path),
        videoPath: video.path,
      )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildHandle(context),
          SvgPicture.asset('assets/spotlight.svg'),
          Text(
            'Add new Video',
            style: h3,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.red,
                child: ListTile(
                  onTap: () => pickVideo(ImageSource.gallery, context),
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  tileColor: Colors.red,
                  leading: Icon(Icons.landscape),
                  title: Text('Upload from Gallery'),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.red,
                child: ListTile(
                  onTap: () => pickVideo(ImageSource.camera, context),
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  tileColor: Colors.red,
                  leading: Icon(Icons.camera),
                  title: Text(
                    'Upload from Camera',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            splashColor: Colors.red,
            onTap: () => Navigator.of(context).pop(),
            child: Text(
              'CANCEL',
              style: h3.copyWith(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildHandle(BuildContext context) {
  final theme = Theme.of(context);

  return FractionallySizedBox(
    widthFactor: 0.25,
    child: Container(
      margin: const EdgeInsets.symmetric(
        vertical: 12.0,
      ),
      child: Container(
        height: 5.0,
        decoration: BoxDecoration(
          color: theme.dividerColor,
          borderRadius: const BorderRadius.all(Radius.circular(2.5)),
        ),
      ),
    ),
  );
}

Widget _buildListItem(
  BuildContext context, {
  Widget? title,
  Widget? leading,
  Widget? trailing,
}) {
  final theme = Theme.of(context);

  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 24.0,
      vertical: 16.0,
    ),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: theme.dividerColor,
          width: 0.5,
        ),
      ),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (leading != null) leading,
        if (title != null)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: DefaultTextStyle(
              child: title,
              style: h3,
            ),
          ),
        Spacer(),
        if (trailing != null) trailing,
      ],
    ),
  );
}
