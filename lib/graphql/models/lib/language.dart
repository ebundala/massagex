enum Language {
  ar,
  be,
  bg,
  bn,
  bs,
  ca,
  cs,
  cy,
  da,
  de,
  el,
  en,
  en$GB,
  en$US,
  es,
  es$419,
  et,
  eu,
  fa,
  fi,
  fr,
  fr$CA,
  gl,
  gu,
  he,
  hi,
  hr,
  hu,
  id,
  is$,
  it,
  iw,
  ja,
  kn,
  ko,
  lt,
  lv,
  ml,
  mr,
  ms,
  nl,
  no,
  pl,
  pt,
  pt$BR,
  ro,
  ru,
  sk,
  sl,
  sr,
  sv,
  sw,
  ta,
  te,
  th,
  tl,
  tr,
  uk,
  vi,
  zh$CN,
  zh$TW
}

extension LanguageExt on Language {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case Language.ar:
        return "ar";
      case Language.be:
        return "be";
      case Language.bg:
        return "bg";
      case Language.bn:
        return "bn";
      case Language.bs:
        return "bs";
      case Language.ca:
        return "ca";
      case Language.cs:
        return "cs";
      case Language.cy:
        return "cy";
      case Language.da:
        return "da";
      case Language.de:
        return "de";
      case Language.el:
        return "el";
      case Language.en:
        return "en";
      case Language.en$GB:
        return "en_GB";
      case Language.en$US:
        return "en_US";
      case Language.es:
        return "es";
      case Language.es$419:
        return "es_419";
      case Language.et:
        return "et";
      case Language.eu:
        return "eu";
      case Language.fa:
        return "fa";
      case Language.fi:
        return "fi";
      case Language.fr:
        return "fr";
      case Language.fr$CA:
        return "fr_CA";
      case Language.gl:
        return "gl";
      case Language.gu:
        return "gu";
      case Language.he:
        return "he";
      case Language.hi:
        return "hi";
      case Language.hr:
        return "hr";
      case Language.hu:
        return "hu";
      case Language.id:
        return "id";
      case Language.is$:
        return "is";
      case Language.it:
        return "it";
      case Language.iw:
        return "iw";
      case Language.ja:
        return "ja";
      case Language.kn:
        return "kn";
      case Language.ko:
        return "ko";
      case Language.lt:
        return "lt";
      case Language.lv:
        return "lv";
      case Language.ml:
        return "ml";
      case Language.mr:
        return "mr";
      case Language.ms:
        return "ms";
      case Language.nl:
        return "nl";
      case Language.no:
        return "no";
      case Language.pl:
        return "pl";
      case Language.pt:
        return "pt";
      case Language.pt$BR:
        return "pt_BR";
      case Language.ro:
        return "ro";
      case Language.ru:
        return "ru";
      case Language.sk:
        return "sk";
      case Language.sl:
        return "sl";
      case Language.sr:
        return "sr";
      case Language.sv:
        return "sv";
      case Language.sw:
        return "sw";
      case Language.ta:
        return "ta";
      case Language.te:
        return "te";
      case Language.th:
        return "th";
      case Language.tl:
        return "tl";
      case Language.tr:
        return "tr";
      case Language.uk:
        return "uk";
      case Language.vi:
        return "vi";
      case Language.zh$CN:
        return "zh_CN";
      case Language.zh$TW:
        return "zh_TW";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static Language fromJson(String json) {
    switch (json) {
      case "ar":
        return Language.ar;
      case "be":
        return Language.be;
      case "bg":
        return Language.bg;
      case "bn":
        return Language.bn;
      case "bs":
        return Language.bs;
      case "ca":
        return Language.ca;
      case "cs":
        return Language.cs;
      case "cy":
        return Language.cy;
      case "da":
        return Language.da;
      case "de":
        return Language.de;
      case "el":
        return Language.el;
      case "en":
        return Language.en;
      case "en_GB":
        return Language.en$GB;
      case "en_US":
        return Language.en$US;
      case "es":
        return Language.es;
      case "es_419":
        return Language.es$419;
      case "et":
        return Language.et;
      case "eu":
        return Language.eu;
      case "fa":
        return Language.fa;
      case "fi":
        return Language.fi;
      case "fr":
        return Language.fr;
      case "fr_CA":
        return Language.fr$CA;
      case "gl":
        return Language.gl;
      case "gu":
        return Language.gu;
      case "he":
        return Language.he;
      case "hi":
        return Language.hi;
      case "hr":
        return Language.hr;
      case "hu":
        return Language.hu;
      case "id":
        return Language.id;
      case "is":
        return Language.is$;
      case "it":
        return Language.it;
      case "iw":
        return Language.iw;
      case "ja":
        return Language.ja;
      case "kn":
        return Language.kn;
      case "ko":
        return Language.ko;
      case "lt":
        return Language.lt;
      case "lv":
        return Language.lv;
      case "ml":
        return Language.ml;
      case "mr":
        return Language.mr;
      case "ms":
        return Language.ms;
      case "nl":
        return Language.nl;
      case "no":
        return Language.no;
      case "pl":
        return Language.pl;
      case "pt":
        return Language.pt;
      case "pt_BR":
        return Language.pt$BR;
      case "ro":
        return Language.ro;
      case "ru":
        return Language.ru;
      case "sk":
        return Language.sk;
      case "sl":
        return Language.sl;
      case "sr":
        return Language.sr;
      case "sv":
        return Language.sv;
      case "sw":
        return Language.sw;
      case "ta":
        return Language.ta;
      case "te":
        return Language.te;
      case "th":
        return Language.th;
      case "tl":
        return Language.tl;
      case "tr":
        return Language.tr;
      case "uk":
        return Language.uk;
      case "vi":
        return Language.vi;
      case "zh_CN":
        return Language.zh$CN;
      case "zh_TW":
        return Language.zh$TW;
      default:
        return Language.ar;
    }
    //return Language.values.firstWhere((e) => e.toJson() == json);
  }
}
