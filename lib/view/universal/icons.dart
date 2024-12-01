part of 'common.dart';

class UniversalIcon {
  UniversalIcon(this.design);

  final UIDesign design;

  IconData get brightness {
    switch (design) {
      case UIDesign.material:
        return material.Icons.brightness_auto;
      case UIDesign.fluent:
        return FluentIcons.flash_auto_24_regular;
    }
  }

  IconData get brightnessLight {
    switch (design) {
      case UIDesign.material:
        return material.Icons.brightness_5;
      case UIDesign.fluent:
        return FluentIcons.flash_24_regular;
    }
  }

  IconData get brightnessDark {
    switch (design) {
      case UIDesign.material:
        return material.Icons.brightness_3;
      case UIDesign.fluent:
        return FluentIcons.flash_off_24_regular;
    }
  }

  IconData get tiphereth {
    switch (design) {
      case UIDesign.material:
        return material.Icons.account_circle;
      case UIDesign.fluent:
        return FluentIcons.person_24_regular;
    }
  }

  IconData get gebura {
    switch (design) {
      case UIDesign.material:
        return material.Icons.casino;
      case UIDesign.fluent:
        return FluentIcons.grid_24_regular;
    }
  }

  IconData get yesod {
    switch (design) {
      case UIDesign.material:
        return material.Icons.rss_feed;
      case UIDesign.fluent:
        return FluentIcons.rss_24_regular;
    }
  }

  IconData get chesed {
    switch (design) {
      case UIDesign.material:
        return material.Icons.photo_album;
      case UIDesign.fluent:
        return FluentIcons.album_24_regular;
    }
  }

  IconData get notification {
    switch (design) {
      case UIDesign.material:
        return material.Icons.notifications;
      case UIDesign.fluent:
        return FluentIcons.alert_24_regular;
    }
  }

  IconData get settings {
    switch (design) {
      case UIDesign.material:
        return material.Icons.settings;
      case UIDesign.fluent:
        return FluentIcons.settings_24_regular;
    }
  }

  IconData get apps {
    switch (design) {
      case UIDesign.material:
        return material.Icons.apps;
      case UIDesign.fluent:
        return FluentIcons.grid_dots_24_regular;
    }
  }

  IconData get search {
    switch (design) {
      case UIDesign.material:
        return material.Icons.search;
      case UIDesign.fluent:
        return FluentIcons.search_24_regular;
    }
  }

  IconData get close {
    switch (design) {
      case UIDesign.material:
        return material.Icons.close;
      case UIDesign.fluent:
        return FluentIcons.dismiss_24_regular;
    }
  }

  IconData get refresh {
    switch (design) {
      case UIDesign.material:
        return material.Icons.refresh;
      case UIDesign.fluent:
        return FluentIcons.arrow_clockwise_24_regular;
    }
  }

  IconData get folder {
    switch (design) {
      case UIDesign.material:
        return material.Icons.folder;
      case UIDesign.fluent:
        return FluentIcons.folder_24_regular;
    }
  }

  IconData get check {
    switch (design) {
      case UIDesign.material:
        return material.Icons.check;
      case UIDesign.fluent:
        return FluentIcons.checkmark_24_regular;
    }
  }

  IconData get play {
    switch (design) {
      case UIDesign.material:
        return material.Icons.play_arrow;
      case UIDesign.fluent:
        return FluentIcons.play_24_regular;
    }
  }

  IconData get add {
    switch (design) {
      case UIDesign.material:
        return material.Icons.add;
      case UIDesign.fluent:
        return FluentIcons.add_24_regular;
    }
  }

  IconData get edit {
    switch (design) {
      case UIDesign.material:
        return material.Icons.edit;
      case UIDesign.fluent:
        return FluentIcons.edit_24_regular;
    }
  }

  IconData get person {
    switch (design) {
      case UIDesign.material:
        return material.Icons.person;
      case UIDesign.fluent:
        return FluentIcons.person_24_regular;
    }
  }

  IconData get image {
    switch (design) {
      case UIDesign.material:
        return material.Icons.image;
      case UIDesign.fluent:
        return FluentIcons.image_24_regular;
    }
  }

  IconData get shoppingCart {
    switch (design) {
      case UIDesign.material:
        return material.Icons.shopping_cart;
      case UIDesign.fluent:
        return FluentIcons.cart_24_regular;
    }
  }

  IconData get filter {
    switch (design) {
      case UIDesign.material:
        return material.Icons.filter_alt_outlined;
      case UIDesign.fluent:
        return FluentIcons.filter_24_regular;
    }
  }

  IconData get clear {
    switch (design) {
      case UIDesign.material:
        return material.Icons.clear;
      case UIDesign.fluent:
        return FluentIcons.dismiss_24_regular;
    }
  }

  IconData get libraryAdd {
    switch (design) {
      case UIDesign.material:
        return material.Icons.library_add;
      case UIDesign.fluent:
        return FluentIcons.library_24_regular;
    }
  }

  IconData get openInFull {
    switch (design) {
      case UIDesign.material:
        return material.Icons.open_in_full;
      case UIDesign.fluent:
        return FluentIcons.arrow_expand_24_regular;
    }
  }

  IconData get folderOpen {
    switch (design) {
      case UIDesign.material:
        return material.Icons.folder_open;
      case UIDesign.fluent:
        return FluentIcons.folder_open_24_regular;
    }
  }

  IconData get fileCopy {
    switch (design) {
      case UIDesign.material:
        return material.Icons.file_copy;
      case UIDesign.fluent:
        return FluentIcons.copy_24_regular;
    }
  }

  IconData get help {
    switch (design) {
      case UIDesign.material:
        return material.Icons.help;
      case UIDesign.fluent:
        return FluentIcons.question_24_regular;
    }
  }

  IconData get logout {
    switch (design) {
      case UIDesign.material:
        return material.Icons.logout;
      case UIDesign.fluent:
        return FluentIcons.sign_out_24_regular;
    }
  }

  IconData get error {
    switch (design) {
      case UIDesign.material:
        return material.Icons.error;
      case UIDesign.fluent:
        return FluentIcons.error_circle_24_regular;
    }
  }

  IconData get copy {
    switch (design) {
      case UIDesign.material:
        return material.Icons.copy;
      case UIDesign.fluent:
        return FluentIcons.copy_24_regular;
    }
  }

  IconData get lock {
    switch (design) {
      case UIDesign.material:
        return material.Icons.lock_outline;
      case UIDesign.fluent:
        return FluentIcons.lock_closed_24_regular;
    }
  }

  IconData get delete {
    switch (design) {
      case UIDesign.material:
        return material.Icons.delete;
      case UIDesign.fluent:
        return FluentIcons.delete_24_regular;
    }
  }

  IconData get cache {
    switch (design) {
      case UIDesign.material:
        return material.Icons.cached;
      case UIDesign.fluent:
        return FluentIcons.arrow_counterclockwise_dashes_24_regular;
    }
  }

  IconData get warning {
    switch (design) {
      case UIDesign.material:
        return material.Icons.warning;
      case UIDesign.fluent:
        return FluentIcons.warning_24_regular;
    }
  }

  IconData get arrowBack {
    switch (design) {
      case UIDesign.material:
        return material.Icons.arrow_back;
      case UIDesign.fluent:
        return FluentIcons.arrow_left_24_regular;
    }
  }

  IconData get automated {
    switch (design) {
      case UIDesign.material:
        return material.Icons.auto_awesome;
      case UIDesign.fluent:
        return FluentIcons.bot_24_regular;
    }
  }

  IconData get favorite {
    switch (design) {
      case UIDesign.material:
        return material.Icons.favorite;
      case UIDesign.fluent:
        return FluentIcons.star_24_filled;
    }
  }

  IconData get favoriteBorder {
    switch (design) {
      case UIDesign.material:
        return material.Icons.favorite_border;
      case UIDesign.fluent:
        return FluentIcons.star_24_regular;
    }
  }

  IconData get timer {
    switch (design) {
      case UIDesign.material:
        return material.Icons.timer;
      case UIDesign.fluent:
        return FluentIcons.timer_24_regular;
    }
  }
}
