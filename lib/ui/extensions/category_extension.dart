import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../blocks/trash_category/model.dart';
import '../colors.dart';

extension TrashCategoryExtension on TrashCategory{

  String get description {
    switch(this) {
      case TrashCategory.battery:
        return '⚡ Handle with care!';
      case TrashCategory.biological:
        return '🌱 Nature’s own cycle.';
      case TrashCategory.cardboard:
        return '📦 Fold before recycling.';
      case TrashCategory.clothes:
        return '👕 Reuse before you refuse.';
      case TrashCategory.glass:
        return '🥂 Fragile but recyclable.';
      case TrashCategory.metal:
        return '🔩 Strong. Recyclable. Eternal.';
      case TrashCategory.paper:
        return '📄 Write, recycle, repeat.';
      case TrashCategory.plastic:
        return '♻️ Think twice before single-use.';
      case TrashCategory.shoes:
        return '👟 Walk green!';
      case TrashCategory.trash:
        return '🗑️ Last stop: landfill.';
      default:
        return '❓ Not sure what that is!';
    }
  }

  IconData get icon {
    switch(this) {
      case TrashCategory.battery:
        return FluentIcons.developer_board_lightning_20_filled;
      case TrashCategory.biological:
        return FluentIcons.plant_grass_20_filled;
      case TrashCategory.cardboard:
        return FluentIcons.box_20_filled;
      case TrashCategory.clothes:
        return FluentIcons.clothes_hanger_20_filled;
      case TrashCategory.glass:
        return FluentIcons.drink_bottle_20_filled;
      case TrashCategory.metal:
        return FluentIcons.dumbbell_20_filled;
      case TrashCategory.paper:
        return FluentIcons.notepad_edit_20_filled;
      case TrashCategory.plastic:
        return FluentIcons.balloon_20_filled;
      case TrashCategory.shoes:
        return FluentIcons.run_20_filled;
      case TrashCategory.trash:
        return FluentIcons.sanitize_20_filled;
      default:
        return FluentIcons.book_exclamation_mark_20_filled;
    }
  }

  Color get iconAndLabelColor {
    switch(this) {
      case TrashCategory.battery:
        return AppColors.primaryGrey;
      case TrashCategory.biological:
        return AppColors.primaryGreen;
      case TrashCategory.cardboard:
        return AppColors.primaryOrange;
      case TrashCategory.clothes:
        return AppColors.primaryYellow;
      case TrashCategory.glass:
        return AppColors.primaryBlue;
      case TrashCategory.metal:
        return AppColors.primaryBlack;
      case TrashCategory.paper:
        return AppColors.primaryViolet;
      case TrashCategory.plastic:
        return AppColors.primaryIndigo;
      case TrashCategory.shoes:
        return AppColors.primaryBrown;
      case TrashCategory.trash:
        return AppColors.primarySaladColor;
      default:
        return AppColors.primaryRed;
    }
  }

  Color get categoryColor {
    switch (this) {
      case TrashCategory.battery:
        return AppColors.lightGrey;
      case TrashCategory.biological:
        return AppColors.lightGreen;
      case TrashCategory.cardboard:
        return AppColors.lightOrange;
      case TrashCategory.clothes:
        return AppColors.lightYellow;
      case TrashCategory.glass:
        return AppColors.lightBlue;
      case TrashCategory.metal:
        return AppColors.lightGrey;
      case TrashCategory.paper:
        return AppColors.lightViolet;
      case TrashCategory.plastic:
        return AppColors.lightIndigo;
      case TrashCategory.shoes:
        return AppColors.lightBrown;
      case TrashCategory.trash:
        return AppColors.lightSaladColor;
      default:
        return AppColors.lightRed;
    }
  }




}