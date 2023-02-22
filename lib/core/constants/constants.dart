class Constants {
  // ------------------------- API URLs End -----------------------------------

// -------------------------- Shared Preferences keys Begin -----------------

// -------------------------- Shared Preferences keys End -------------------

// -------------------------------Firebase Begin-----------------------------

//-------------------------------Firebase End--------------------------------

// -------------------------------Const Begin-----------------------------

  static const List<Map> languages = [
    {
      'id': '1',
      'title': 'English',
      'code': 'en',
    },
    {
      'id': '2',
      'title': 'हिन्दी',
      'code': 'hi',
    },
    {
      'id': '2',
      'title': 'অসমীয়া',
      'code': 'as',
    }
  ];

//-----------------------------Regex String BEGIN ------------------------------
  static const String nameRegex = r'^[a-zA-Z .]+';
  static const String emojiDisableRegex =
      '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])';
  static const String remarkRegex = r'^[a-zA-Z0-9 .]+';
  static const String phoneRegex = r'^[7896]\d{9}';
  static const String ageRegex = r'^[1-9]{1}[0-9]{0,1}';
  static const String numberRegex = r'^[1-9]{1}[0-9]*';
  static const String workExpRegex = r'/(?<=^| )\d+(\.\d{1})?(?=$)/s';
  static const String pinCode = r'^[1-9][0-9]{5}$';
  static const String generalTextRegex = r'^[a-zA-Z ,]+';
  static const String passwordRegex =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#^<>=])[A-Za-z\d@$!%*?&#^<>=]{8,}$';
//-----------------------------Regex String END------------------------------

//-------------------------------Const End--------------------------------
}
