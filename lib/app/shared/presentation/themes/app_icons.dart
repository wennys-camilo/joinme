abstract class AppIcons {
  String get chat;
  String get report;
  String get calendar;
  String get calendarSelected;
  String get event;
  String get eventSelected;
  String get home;
  String get homeSelected;
  String get saveds;
  String get savedsSelected;
  String get user;
  String get userSelected;
  String get medal;
  String get look;
  String get notification;
  String get invite;
  String get logout;
  String get help;
}

class AppIconsImpl implements AppIcons {
  @override
  String get chat => "assets/icons/chat_icon.svg";

  @override
  String get report => "assets/icons/report_icon.svg";

  @override
  String get calendar => "assets/icons/calendar.svg";

  @override
  String get calendarSelected => "assets/icons/calendar_selected.svg";

  @override
  String get event => "assets/icons/event.svg";

  @override
  String get eventSelected => "assets/icons/event_selected.svg";

  @override
  String get home => "assets/icons/home.svg";

  @override
  String get homeSelected => "assets/icons/home_selected.svg";

  @override
  String get saveds => "assets/icons/saveds.svg";

  @override
  String get savedsSelected => "assets/icons/saveds_selected.svg";

  @override
  String get user => "assets/icons/user.svg";

  @override
  String get userSelected => "assets/icons/user_selected.svg";

  @override
  String get medal => "assets/icons/medal_icon.svg";

  @override
  String get look => "assets/icons/lock.svg";

  @override
  String get notification => "assets/icons/notification.svg";

  @override
  String get help => "assets/icons/help.svg";

  @override
  String get invite => "assets/icons/invite.svg";

  @override
  String get logout => "assets/icons/logout.svg";
}
