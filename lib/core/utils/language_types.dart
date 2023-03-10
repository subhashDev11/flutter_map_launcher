class Language {
  final String code;
  final String name;
  final String nativeName;
  Language(this.code, this.name, this.nativeName);
}

List<Language> languages = [
  Language("ab", "Abkhaz", "аҧсуа"),
  Language("aa", "Afar", "Afaraf"),
  Language("af", "Afrikaans", "Afrikaans"),
  Language("ak", "Akan", "Akan"),
  Language("sq", "Albanian", "Shqip"),
  Language("am", "Amharic", "አማርኛ"),
  Language("ar", "Arabic", "العربية"),
  Language("an", "Aragonese", "Aragonés"),
  Language("hy", "Armenian", "Հայերեն"),
  Language("as", "Assamese", "অসমীয়া"),
  Language("av", "Avaric", "авар мацӀ, магӀарул мацӀ"),
  Language("ae", "Avestan", "avesta"),
  Language("ay", "Aymara", "aymar aru"),
  Language("az", "Azerbaijani", "azərbaycan dili"),
  Language("bm", "Bambara", "bamanankan"),
  Language("ba", "Bashkir", "башҡорт теле"),
  Language("eu", "Basque", "euskara, euskera"),
  Language("be", "Belarusian", "Беларуская"),
  Language("bn", "Bengali", "বাংলা"),
  Language("bh", "Bihari", "भोजपुरी"),
  Language("bi", "Bislama", "Bislama"),
  Language("bs", "Bosnian", "bosanski jezik"),
  Language("br", "Breton", "brezhoneg"),
  Language("bg", "Bulgarian", "български език"),
  Language("my", "Burmese", "ဗမာစာ"),
  Language("ca", "Catalan; Valencian", "Català"),
  Language("ch", "Chamorro", "Chamoru"),
  Language("ce", "Chechen", "нохчийн мотт"),
  Language("ny", "Chichewa; Chewa; Nyanja", "chiCheŵa, chinyanja"),
  Language("zh", "Chinese", "中文 (Zhōngwén), 汉语, 漢語"),
  Language("cv", "Chuvash", "чӑваш чӗлхи"),
  Language("kw", "Cornish", "Kerek"),
  Language("co", "Corsican", "corsu, lingua corsa"),
  Language("cr", "Cree", "ᓀᐦᐃᔭᐍᐏᐣ"),
  Language("hr", "Croatian", "hrvatski"),
  Language("cs", "Czech", "česky, čeština"),
  Language("da", "Danish", "dansk"),
  Language("dv", "Divehi; Dhivehi; Maldivian;", "ދިވެހި"),
  Language("nl", "Dutch", "Nederlands, Vlaams"),
  Language("en", "English", "English"),
  Language("eo", "Esperanto", "Esperanto"),
  Language("et", "Estonian", "eesti, eesti keel"),
  Language("ee", "Ewe", "Eʋegbe"),
  Language("fo", "Faroese", "føroyskt"),
  Language("fj", "Fijian", "vosa Vakaviti"),
  Language("fi", "Finnish", "suomi, suomen kieli"),
  Language("fr", "French", "français, langue française"),
  Language("ff", "Fula; Fulah; Pulaar; Pular", "Fulfulde, Pulaar, Pular"),
  Language("gl", "Galician", "Galego"),
  Language("ka", "Georgian", "ქართული"),
  Language("de", "German", "Deutsch"),
  Language("el", "Greek, Modern", "Ελληνικά"),
  Language("gn", "Guaraní", "Avañeẽ"),
  Language("gu", "Gujarati", "ગુજરાતી"),
  Language("ht", "Haitian; Haitian Creole", "Kreyòl ayisyen"),
  Language("ha", "Hausa", "Hausa, هَوُسَ"),
  Language("he", "Hebrew (modern)", "עברית"),
  Language("hz", "Herero", "Otjiherero"),
  Language("hi", "Hindi", "हिन्दी, हिंदी"),
  Language("ho", "Hiri Motu", "Hiri Motu"),
  Language("hu", "Hungarian", "Magyar"),
  Language("ia", "Interlingua", "Interlingua"),
  Language("id", "Indonesian", "Bahasa Indonesia"),
  Language("ie", "Interlingue",
      "Originally called Occidental; then Interlingue after WWII"),
  Language("ga", "Irish", "Gaeilge"),
  Language("ig", "Igbo", "Asụsụ Igbo"),
  Language("ik", "Inupiaq", "Iñupiaq, Iñupiatun"),
  Language("io", "Ido", "Ido"),
  Language("is", "Icelandic", "Íslenska"),
  Language("it", "Italian", "Italiano"),
  Language("iu", "Inuktitut", "ᐃᓄᒃᑎᑐᑦ"),
  Language("ja", "Japanese", "日本語 (にほんご／にっぽんご)"),
  Language("jv", "Javanese", "basa Jawa"),
  Language("kl", "Kalaallisut, Greenlandic", "kalaallisut, kalaallit oqaasii"),
  Language("kn", "Kannada", "ಕನ್ನಡ"),
  Language("kr", "Kanuri", "Kanuri"),
  Language("ks", "Kashmiri", "कश्मीरी, كشميري‎"),
  Language("kk", "Kazakh", "Қазақ тілі"),
  Language("km", "Khmer", "ភាសាខ្មែរ"),
  Language("ki", "Kikuyu, Gikuyu", "Gĩkũyũ"),
  Language("rw", "Kinyarwanda", "Ikinyarwanda"),
  Language("ky", "Kirghiz, Kyrgyz", "кыргыз тили"),
  Language("kv", "Komi", "коми кыв"),
  Language("kg", "Kongo", "KiKongo"),
  Language("ko", "Korean", "한국어 (韓國語), 조선말 (朝鮮語)"),
  Language("ku", "Kurdish", "Kurdî, كوردی‎"),
  Language("kj", "Kwanyama, Kuanyama", "Kuanyama"),
  Language("la", "Latin", "latine, lingua latina"),
  Language("lb", "Luxembourgish, Letzeburgesch", "Lëtzebuergesch"),
  Language("lg", "Luganda", "Luganda"),
  Language("li", "Limburgish, Limburgan, Limburger", "Limburgs"),
  Language("ln", "Lingala", "Lingála"),
  Language("lo", "Lao", "ພາສາລາວ"),
  Language("lt", "Lithuanian", "lietuvių kalba"),
  Language("lu", "Luba-Katanga", ""),
  Language("lv", "Latvian", "latviešu valoda"),
  Language("gv", "Manx", "Gaelg, Gailck"),
  Language("mk", "Macedonian", "македонски јазик"),
  Language("mg", "Malagasy", "Malagasy fiteny"),
  Language("ms", "Malay", "bahasa Melayu, بهاس ملايو‎"),
  Language("ml", "Malayalam", "മലയാളം"),
  Language("mt", "Maltese", "Malti"),
  Language("mi", "Māori", "te reo Māori"),
  Language("mr", "Marathi (Marāṭhī)", "मराठी"),
  Language("mh", "Marshallese", "Kajin M̧ajeļ"),
  Language("mn", "Mongolian", "монгол"),
  Language("na", "Nauru", "Ekakairũ Naoero"),
  Language("nv", "Navajo, Navaho", "Diné bizaad, Dinékʼehǰí"),
  Language("nb", "Norwegian Bokmål", "Norsk bokmål"),
  Language("nd", "North Ndebele", "isiNdebele"),
  Language("ne", "Nepali", "नेपाली"),
  Language("ng", "Ndonga", "Owambo"),
  Language("nn", "Norwegian Nynorsk", "Norsk nynorsk"),
  Language("no", "Norwegian", "Norsk"),
  Language("ii", "Nuosu", "ꆈꌠ꒿ Nuosuhxop"),
  Language("nr", "South Ndebele", "isiNdebele"),
  Language("oc", "Occitan", "Occitan"),
  Language("oj", "Ojibwe, Ojibwa", "ᐊᓂᔑᓈᐯᒧᐎᓐ"),
  Language(
      "cu",
      "Old Church Slavonic, Church Slavic, Church Slavonic, Old Bulgarian, Old Slavonic",
      "ѩзыкъ словѣньскъ"),
  Language("om", "Oromo", "Afaan Oromoo"),
  Language("or", "Oriya", "ଓଡ଼ିଆ"),
  Language("os", "Ossetian, Ossetic", "ирон æвзаг"),
  Language("pa", "Panjabi, Punjabi", "ਪੰਜਾਬੀ, پنجابی‎"),
  Language("pi", "Pāli", "पाऴि"),
  Language("fa", "Persian", "فارسی"),
  Language("pl", "Polish", "Polski"),
  Language("ps", "Pashto, Pushto", "پښتو"),
  Language("pt", "Portuguese", "Português"),
  Language("qu", "Quechua", "Runa Simi, Kichwa"),
  Language("rm", "Romansh", "rumantsch grischun"),
  Language("rn", "Kirundi", "kiRundi"),
  Language("ro", "Romanian, Moldavian, Moldovan", "română"),
  Language("ru", "Russian", "русский язык"),
  Language("sa", "Sanskrit (Saṁskṛta)", "संस्कृतम्"),
  Language("sc", "Sardinian", "sardu"),
  Language("sd", "Sindhi", "सिन्धी, سنڌي، سندھی‎"),
  Language("se", "Northern Sami", "Davvisámegiella"),
  Language("sm", "Samoan", "gagana faa Samoa"),
  Language("sg", "Sango", "yângâ tî sängö"),
  Language("sr", "Serbian", "српски језик"),
  Language("gd", "Scottish Gaelic; Gaelic", "Gàidhlig"),
  Language("sn", "Shona", "chiShona"),
  Language("si", "Sinhala, Sinhalese", "සිංහල"),
  Language("sk", "Slovak", "slovenčina"),
  Language("sl", "Slovene", "slovenščina"),
  Language("so", "Somali", "Soomaaliga, af Soomaali"),
  Language("st", "Southern Sotho", "Sesotho"),
  Language("es", "Spanish; Castilian", "español, castellano"),
  Language("su", "Sundanese", "Basa Sunda"),
  Language("sw", "Swahili", "Kiswahili"),
  Language("ss", "Swati", "SiSwati"),
  Language("sv", "Swedish", "svenska"),
  Language("ta", "Tamil", "தமிழ்"),
  Language("te", "Telugu", "తెలుగు"),
  Language("tg", "Tajik", "тоҷикӣ, toğikī, تاجیکی‎"),
  Language("th", "Thai", "ไทย"),
  Language("ti", "Tigrinya", "ትግርኛ"),
  Language("bo", "Tibetan Standard, Tibetan, Central", "བོད་ཡིག"),
  Language("tk", "Turkmen", "Türkmen, Түркмен"),
  Language("tl", "Tagalog", "Wikang Tagalog, ᜏᜒᜃᜅ᜔ ᜆᜄᜎᜓᜄ᜔"),
  Language("tn", "Tswana", "Setswana"),
  Language("to", "Tonga (Tonga Islands)", "faka Tonga"),
  Language("tr", "Turkish", "Türkçe"),
  Language("ts", "Tsonga", "Xitsonga"),
  Language("tt", "Tatar", "татарча, tatarça, تاتارچا‎"),
  Language("tw", "Twi", "Twi"),
  Language("ty", "Tahitian", "Reo Tahiti"),
  Language("ug", "Uighur, Uyghur", "Uyƣurqə, ئۇيغۇرچە‎"),
  Language("uk", "Ukrainian", "українська"),
  Language("ur", "Urdu", "اردو"),
  Language("uz", "Uzbek", "zbek, Ўзбек, أۇزبېك‎"),
  Language("ve", "Venda", "Tshivenḓa"),
  Language("vi", "Vietnamese", "Tiếng Việt"),
  Language("vo", "Volapük", "Volapük"),
  Language("wa", "Walloon", "Walon"),
  Language("cy", "Welsh", "Cymraeg"),
  Language("wo", "Wolof", "Wollof"),
  Language("fy", "Western Frisian", "Frysk"),
  Language("xh", "Xhosa", "isiXhosa"),
  Language("yi", "Yiddish", "ייִדיש"),
  Language("yo", "Yoruba", "Yorùbá"),
  Language("za", "Zhuang, Chuang", "Saɯ cueŋƅ, Saw cuengh"),
];
