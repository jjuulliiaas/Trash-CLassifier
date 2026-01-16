import 'package:flutter/material.dart';
import 'package:trash_classifier/generated/l10n.dart';

import '../../blocks/trash_category/model.dart';
import '../colors.dart';

extension TrashCategoryExtension on TrashCategory{

  String name(BuildContext context) {
    final $ = S.of(context);

    switch(this) {
      case TrashCategory.battery:
        return $.batteryName;
      case TrashCategory.biological:
        return $.biologicalName;
      case TrashCategory.cardboard:
        return $.cardboardName;
      case TrashCategory.clothes:
        return $.clothesName;
      case TrashCategory.glass:
        return $.glassName;
      case TrashCategory.metal:
        return $.metalName;
      case TrashCategory.paper:
        return $.paperName;
      case TrashCategory.plastic:
        return $.plasticName;
      case TrashCategory.shoes:
        return $.shoesName;
      case TrashCategory.trash:
        return $.trashName;
      default:
        return $.unknownName;
    }
  }

  String tagline (BuildContext context) {
    final $ = S.of(context);

    switch(this) {
      case TrashCategory.battery:
        return $.taglineBattery;
      case TrashCategory.biological:
        return $.taglineBiological;
      case TrashCategory.cardboard:
        return $.taglineCardboard;
      case TrashCategory.clothes:
        return $.taglineClothes;
      case TrashCategory.glass:
        return $.taglineGlass;
      case TrashCategory.metal:
        return $.taglineMetal;
      case TrashCategory.paper:
        return $.taglinePaper;
      case TrashCategory.plastic:
        return $.taglinePlastic;
      case TrashCategory.shoes:
        return $.taglineShoes;
      case TrashCategory.trash:
        return $.taglineTrash;
      default:
        return $.taglineUnknown;
    }
  }

  Color get labelColor {
    switch(this) {
      case TrashCategory.battery:
        return AppColors.primaryGrey;
      case TrashCategory.biological:
        return AppColors.primaryViolet2;
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