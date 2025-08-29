import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/data/models/comment_model/comment_model.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/functions/show_snack_bar.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Core/widgets/custom_card_background.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Core/widgets/custom_text_form_field.dart';
import 'package:visit_syria/Core/widgets/profile_avatar.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/recent_comment.dart';
import 'package:visit_syria/Features/Places/Presentation/Manager/add_comment_and_rating_cubit/add_comment_and_rating_cubit.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/custom_rating_bar.dart';

class RatingForm extends StatefulWidget {
  const RatingForm({
    super.key,
    this.padding = 16,
    this.boxShadow,
    this.hasBottomRadius = true,
    this.userRate,
    this.userComment,
    this.onChanged,
    this.onRatingUpdate,
    this.id,
    this.recentComments,
    this.comments,
    this.placeModel,
  });

  final double padding;
  final BoxShadow? boxShadow;
  final bool hasBottomRadius;
  final dynamic userRate;
  final String? userComment;
  final dynamic Function(String)? onChanged;
  final void Function(double)? onRatingUpdate;
  final dynamic id;
  final List<RecentComment>? recentComments;
  final List<CommentModel>? comments;
  final PlaceModel? placeModel;

  @override
  State<RatingForm> createState() => _RatingFormState();
}

class _RatingFormState extends State<RatingForm> {
  @override
  Widget build(BuildContext context) {
    String? comment = widget.userComment, rating = widget.userRate.toString();
    return BlocConsumer<AddCommentAndRatingCubit, AddCommentAndRatingState>(
      listener: (context, state) {
        if (state is AddCommentAndRatingFailure) {
          showFailureSnackBar(state.errorMessage, context);
        }
        if (state is AddCommentAndRatingSuccess) {
          showSuccessSnackBar("تم إضافة تعليقك بنجاح", context);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.padding),
          child: CustomCardBackground(
            hasBottomRadius: widget.hasBottomRadius,
            boxShadow: widget.boxShadow,
            padding: 24,
            child: Column(
              children: [
                Row(
                  children: [
                    ProfileAvatar(),
                    SizedBox(width: AppSpacing.s8),
                    CustomRatingBar(
                      initialRating: _parseUserRate(widget.userRate),
                      onRatingUpdate:
                          (rate) => rating = rate.round().toString(),
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.s12),
                CustomTextFormField(
                  hint: "اوصف تجربتك (اختياري)",
                  maxLines: 3,
                  textInputAction: TextInputAction.done,
                  initialValue: widget.userComment,
                  onChanged: (userComment) => comment = userComment,
                ),
                SizedBox(height: AppSpacing.s12),
                state is AddCommentAndRatingLoading
                    ? CustomLoadingIndicator(size: 64)
                    : CustomButton(
                      onPressed: () {
                        log("$comment , $rating");
                        setState(() {
                          BlocProvider.of<AddCommentAndRatingCubit>(
                            context,
                          ).addCommentAndRating(
                            placeId: widget.id.toString(),
                            comment: comment ?? 'a',
                            rating: rating ?? '1',
                            recentComments: widget.recentComments!,
                            comments: widget.comments,
                            placeModel: widget.placeModel,
                          );
                        });
                      },
                      title: "مشاركة",
                      textStyle: AppStyles.fontsBold14(
                        context,
                      ).copyWith(color: AppColors.whiteColor),
                      borderRadius: 16,
                      icon: Assets.iconsArrow,
                      iconColor: AppColors.whiteColor,
                      verPadding: 12,
                      size: 16,
                    ),
              ],
            ),
          ),
        );
      },
    );
  }

  double _parseUserRate(dynamic rate) {
    if (rate == null) return 1.0; // القيمة الافتراضية
    if (rate is int) return rate.toDouble();
    if (rate is double) return rate;
    if (rate is String) return double.tryParse(rate) ?? 1.0;
    return 1.0;
  }
}
