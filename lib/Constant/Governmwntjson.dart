import 'dart:convert' as convert;
import 'package:payfromit/model/government.dart';

var jsonEgypt_governorates =[
  {
    "id":1,
    "name_ar":"القاهرة",
    "name_en":"Cairo",
    "cities":[
      {
        "id":1,
        "id_country":1,
        "name_ar":"القاهره",
        "name_en":"Cairo"
      }
    ]
  },
  {
    "id":2,
    "name_ar":"الجيزة",
    "name_en":"Giza",
    "cities":[
      {
        "id":2,
        "id_country":2,
        "name_ar":"الجيزة",
        "name_en":"Giza"
      },
      {
        "id":3,
        "id_country":2,
        "name_ar":"السادس من أكتوبر",
        "name_en":"Sixth of October"
      },
      {
        "id":4,
        "id_country":2,
        "name_ar":"الشيخ زايد",
        "name_en":"Cheikh Zayed"
      },
      {
        "id":5,
        "id_country":2,
        "name_ar":"الحوامدية",
        "name_en":"Hawamdiyah"
      },
      {
        "id":6,
        "id_country":2,
        "name_ar":"البدرشين",
        "name_en":"Al Badrasheen"
      },
      {
        "id":7,
        "id_country":2,
        "name_ar":"الصف",
        "name_en":"Saf"
      },
      {
        "id":8,
        "id_country":2,
        "name_ar":"أطفيح",
        "name_en":"Atfih"
      },
      {
        "id":9,
        "id_country":2,
        "name_ar":"العياط",
        "name_en":"Al Ayat"
      },
      {
        "id":10,
        "id_country":2,
        "name_ar":"الباويطي",
        "name_en":"Al-Bawaiti"
      },
      {
        "id":11,
        "id_country":2,
        "name_ar":"منشأة القناطر",
        "name_en":"ManshiyetAl Qanater"
      },
      {
        "id":12,
        "id_country":2,
        "name_ar":"أوسيم",
        "name_en":"Oaseem"
      },
      {
        "id":13,
        "id_country":2,
        "name_ar":"كرداسة",
        "name_en":"Kerdasa"
      },
      {
        "id":14,
        "id_country":2,
        "name_ar":"أبو النمرس",
        "name_en":"Abu Nomros"
      },
      {
        "id":15,
        "id_country":2,
        "name_ar":"كفر غطاطي",
        "name_en":"Kafr Ghati"
      },
      {
        "id":16,
        "id_country":2,
        "name_ar":"منشأة البكاري",
        "name_en":"Manshiyet Al Bakari"
      }
    ]
  },
  {
    "id":3,
    "name_ar":"الأسكندرية",
    "name_en":"Alexandria",
    "cities":[
      {
        "id":17,
        "id_country":3,
        "name_ar":"الأسكندرية",
        "name_en":"Alexandria"
      },
      {
        "id":18,
        "id_country":3,
        "name_ar":"برج العرب",
        "name_en":"Burj Al Arab"
      },
      {
        "id":19,
        "id_country":3,
        "name_ar":"برج العرب الجديدة",
        "name_en":"New Burj Al Arab"
      }
    ]
  },
  {
    "id":4,
    "name_ar":"الدقهلية",
    "name_en":"Dakahlia",
    "cities":[
      {
        "id":66,
        "id_country":4,
        "name_ar":"المنصورة",
        "name_en":"Mansoura"
      },
      {
        "id":67,
        "id_country":4,
        "name_ar":"طلخا",
        "name_en":"Talkha"
      },
      {
        "id":68,
        "id_country":4,
        "name_ar":"ميت غمر",
        "name_en":"Mitt Ghamr"
      },
      {
        "id":69,
        "id_country":4,
        "name_ar":"دكرنس",
        "name_en":"Dekernes"
      },
      {
        "id":70,
        "id_country":4,
        "name_ar":"أجا",
        "name_en":"Aga"
      },
      {
        "id":71,
        "id_country":4,
        "name_ar":"منية النصر",
        "name_en":"Menia El Nasr"
      },
      {
        "id":72,
        "id_country":4,
        "name_ar":"السنبلاوين",
        "name_en":"Sinbillawin"
      },
      {
        "id":73,
        "id_country":4,
        "name_ar":"الكردي",
        "name_en":"El Kurdi"
      },
      {
        "id":74,
        "id_country":4,
        "name_ar":"بني عبيد",
        "name_en":"Bani Ubaid"
      },
      {
        "id":75,
        "id_country":4,
        "name_ar":"المنزلة",
        "name_en":"Al Manzala"
      },
      {
        "id":76,
        "id_country":4,
        "name_ar":"تمي الأمديد",
        "name_en":"tami al'amdid"
      },
      {
        "id":77,
        "id_country":4,
        "name_ar":"الجمالية",
        "name_en":"aljamalia"
      },
      {
        "id":78,
        "id_country":4,
        "name_ar":"شربين",
        "name_en":"Sherbin"
      },
      {
        "id":79,
        "id_country":4,
        "name_ar":"المطرية",
        "name_en":"Mataria"
      },
      {
        "id":80,
        "id_country":4,
        "name_ar":"بلقاس",
        "name_en":"Belqas"
      },
      {
        "id":81,
        "id_country":4,
        "name_ar":"ميت سلسيل",
        "name_en":"Meet Salsil"
      },
      {
        "id":82,
        "id_country":4,
        "name_ar":"جمصة",
        "name_en":"Gamasa"
      },
      {
        "id":83,
        "id_country":4,
        "name_ar":"محلة دمنة",
        "name_en":"Mahalat Damana"
      },
      {
        "id":84,
        "id_country":4,
        "name_ar":"نبروه",
        "name_en":"Nabroh"
      }
    ]
  },
  {
    "id":5,
    "name_ar":"البحر الأحمر",
    "name_en":"Red Sea",
    "cities":[
      {
        "id":201,
        "id_country":5,
        "name_ar":"الغردقة",
        "name_en":"Hurghada"
      },
      {
        "id":202,
        "id_country":5,
        "name_ar":"رأس غارب",
        "name_en":"Ras Ghareb"
      },
      {
        "id":203,
        "id_country":5,
        "name_ar":"سفاجا",
        "name_en":"Safaga"
      },
      {
        "id":204,
        "id_country":5,
        "name_ar":"القصير",
        "name_en":"El Qusiar"
      },
      {
        "id":205,
        "id_country":5,
        "name_ar":"مرسى علم",
        "name_en":"Marsa Alam"
      },
      {
        "id":206,
        "id_country":5,
        "name_ar":"الشلاتين",
        "name_en":"Shalatin"
      },
      {
        "id":207,
        "id_country":5,
        "name_ar":"حلايب",
        "name_en":"Halaib"
      }
    ]
  },
  {
    "id":6,
    "name_ar":"البحيرة",
    "name_en":"Beheira",
    "cities":[
      {
        "id":31,
        "id_country":6,
        "name_ar":"دمنهور",
        "name_en":"Damanhour"
      },
      {
        "id":32,
        "id_country":6,
        "name_ar":"كفر الدوار",
        "name_en":"Kafr El Dawar"
      },
      {
        "id":33,
        "id_country":6,
        "name_ar":"رشيد",
        "name_en":"Rashid"
      },
      {
        "id":34,
        "id_country":6,
        "name_ar":"إدكو",
        "name_en":"Edco"
      },
      {
        "id":35,
        "id_country":6,
        "name_ar":"أبو المطامير",
        "name_en":"Abu al-Matamir"
      },
      {
        "id":36,
        "id_country":6,
        "name_ar":"أبو حمص",
        "name_en":"Abu Homs"
      },
      {
        "id":37,
        "id_country":6,
        "name_ar":"الدلنجات",
        "name_en":"Delengat"
      },
      {
        "id":38,
        "id_country":6,
        "name_ar":"المحمودية",
        "name_en":"Mahmoudiyah"
      },
      {
        "id":39,
        "id_country":6,
        "name_ar":"الرحمانية",
        "name_en":"Rahmaniyah"
      },
      {
        "id":40,
        "id_country":6,
        "name_ar":"إيتاي البارود",
        "name_en":"Itai Baroud"
      },
      {
        "id":41,
        "id_country":6,
        "name_ar":"حوش عيسى",
        "name_en":"Housh Eissa"
      },
      {
        "id":42,
        "id_country":6,
        "name_ar":"شبراخيت",
        "name_en":"Shubrakhit"
      },
      {
        "id":43,
        "id_country":6,
        "name_ar":"كوم حمادة",
        "name_en":"Kom Hamada"
      },
      {
        "id":44,
        "id_country":6,
        "name_ar":"بدر",
        "name_en":"Badr"
      },
      {
        "id":45,
        "id_country":6,
        "name_ar":"وادي النطرون",
        "name_en":"Wadi Natrun"
      },
      {
        "id":46,
        "id_country":6,
        "name_ar":"النوبارية الجديدة",
        "name_en":"New Nubaria"
      }
    ]
  },
  {
    "id":7,
    "name_ar":"الفيوم",
    "name_en":"Fayoum",
    "cities":[
      {
        "id":168,
        "id_country":7,
        "name_ar":"الفيوم",
        "name_en":"Fayoum"
      },
      {
        "id":169,
        "id_country":7,
        "name_ar":"الفيوم الجديدة",
        "name_en":"Fayoum El Gedida"
      },
      {
        "id":170,
        "id_country":7,
        "name_ar":"طامية",
        "name_en":"Tamiya"
      },
      {
        "id":171,
        "id_country":7,
        "name_ar":"سنورس",
        "name_en":"Snores"
      },
      {
        "id":172,
        "id_country":7,
        "name_ar":"إطسا",
        "name_en":"Etsa"
      },
      {
        "id":173,
        "id_country":7,
        "name_ar":"إبشواي",
        "name_en":"Epschway"
      },
      {
        "id":174,
        "id_country":7,
        "name_ar":"يوسف الصديق",
        "name_en":"Yusuf El Sediaq"
      }
    ]
  },
  {
    "id":8,
    "name_ar":"الغربية",
    "name_en":"Gharbiya",
    "cities":[
      {
        "id":98,
        "id_country":8,
        "name_ar":"طنطا",
        "name_en":"Tanta"
      },
      {
        "id":99,
        "id_country":8,
        "name_ar":"المحلة الكبرى",
        "name_en":"Al Mahalla Al Kobra"
      },
      {
        "id":100,
        "id_country":8,
        "name_ar":"كفر الزيات",
        "name_en":"Kafr El Zayat"
      },
      {
        "id":101,
        "id_country":8,
        "name_ar":"زفتى",
        "name_en":"Zefta"
      },
      {
        "id":102,
        "id_country":8,
        "name_ar":"السنطة",
        "name_en":"El Santa"
      },
      {
        "id":103,
        "id_country":8,
        "name_ar":"قطور",
        "name_en":"Qutour"
      },
      {
        "id":104,
        "id_country":8,
        "name_ar":"بسيون",
        "name_en":"Basion"
      },
      {
        "id":105,
        "id_country":8,
        "name_ar":"سمنود",
        "name_en":"Samannoud"
      }
    ]
  },
  {
    "id":9,
    "name_ar":"الإسماعلية",
    "name_en":"Ismailia",
    "cities":[
      {
        "id":137,
        "id_country":9,
        "name_ar":"الإسماعيلية",
        "name_en":"Ismailia"
      },
      {
        "id":138,
        "id_country":9,
        "name_ar":"فايد",
        "name_en":"Fayed"
      },
      {
        "id":139,
        "id_country":9,
        "name_ar":"القنطرة شرق",
        "name_en":"Qantara Sharq"
      },
      {
        "id":140,
        "id_country":9,
        "name_ar":"القنطرة غرب",
        "name_en":"Qantara Gharb"
      },
      {
        "id":141,
        "id_country":9,
        "name_ar":"التل الكبير",
        "name_en":"El Tal El Kabier"
      },
      {
        "id":142,
        "id_country":9,
        "name_ar":"أبو صوير",
        "name_en":"Abu Sawir"
      },
      {
        "id":143,
        "id_country":9,
        "name_ar":"القصاصين الجديدة",
        "name_en":"Kasasien El Gedida"
      }
    ]
  },
  {
    "id":10,
    "name_ar":"المنوفية",
    "name_en":"Monofia",
    "cities":[
      {
        "id":106,
        "id_country":10,
        "name_ar":"شبين الكوم",
        "name_en":"Shbeen El Koom"
      },
      {
        "id":107,
        "id_country":10,
        "name_ar":"مدينة السادات",
        "name_en":"Sadat City"
      },
      {
        "id":108,
        "id_country":10,
        "name_ar":"منوف",
        "name_en":"Menouf"
      },
      {
        "id":109,
        "id_country":10,
        "name_ar":"سرس الليان",
        "name_en":"Sars El-Layan"
      },
      {
        "id":110,
        "id_country":10,
        "name_ar":"أشمون",
        "name_en":"Ashmon"
      },
      {
        "id":111,
        "id_country":10,
        "name_ar":"الباجور",
        "name_en":"Al Bagor"
      },
      {
        "id":112,
        "id_country":10,
        "name_ar":"قويسنا",
        "name_en":"Quesna"
      },
      {
        "id":113,
        "id_country":10,
        "name_ar":"بركة السبع",
        "name_en":"Berkat El Saba"
      },
      {
        "id":114,
        "id_country":10,
        "name_ar":"تلا",
        "name_en":"Tala"
      },
      {
        "id":115,
        "id_country":10,
        "name_ar":"الشهداء",
        "name_en":"Al Shohada"
      }
    ]
  },
  {
    "id":11,
    "name_ar":"المنيا",
    "name_en":"Minya",
    "cities":[
      {
        "id":175,
        "id_country":11,
        "name_ar":"المنيا",
        "name_en":"Minya"
      },
      {
        "id":176,
        "id_country":11,
        "name_ar":"المنيا الجديدة",
        "name_en":"Minya El Gedida"
      },
      {
        "id":177,
        "id_country":11,
        "name_ar":"العدوة",
        "name_en":"El Adwa"
      },
      {
        "id":178,
        "id_country":11,
        "name_ar":"مغاغة",
        "name_en":"Magagha"
      },
      {
        "id":179,
        "id_country":11,
        "name_ar":"بني مزار",
        "name_en":"Bani Mazar"
      },
      {
        "id":180,
        "id_country":11,
        "name_ar":"مطاي",
        "name_en":"Mattay"
      },
      {
        "id":181,
        "id_country":11,
        "name_ar":"سمالوط",
        "name_en":"Samalut"
      },
      {
        "id":182,
        "id_country":11,
        "name_ar":"المدينة الفكرية",
        "name_en":"Madinat El Fekria"
      },
      {
        "id":183,
        "id_country":11,
        "name_ar":"ملوي",
        "name_en":"Meloy"
      },
      {
        "id":184,
        "id_country":11,
        "name_ar":"دير مواس",
        "name_en":"Deir Mawas"
      }
    ]
  },
  {
    "id":12,
    "name_ar":"القليوبية",
    "name_en":"Qaliubiya",
    "cities":[
      {
        "id":20,
        "id_country":12,
        "name_ar":"بنها",
        "name_en":"Banha"
      },
      {
        "id":21,
        "id_country":12,
        "name_ar":"قليوب",
        "name_en":"Qalyub"
      },
      {
        "id":22,
        "id_country":12,
        "name_ar":"شبرا الخيمة",
        "name_en":"Shubra Al Khaimah"
      },
      {
        "id":23,
        "id_country":12,
        "name_ar":"القناطر الخيرية",
        "name_en":"Al Qanater Charity"
      },
      {
        "id":24,
        "id_country":12,
        "name_ar":"الخانكة",
        "name_en":"Khanka"
      },
      {
        "id":25,
        "id_country":12,
        "name_ar":"كفر شكر",
        "name_en":"Kafr Shukr"
      },
      {
        "id":26,
        "id_country":12,
        "name_ar":"طوخ",
        "name_en":"Tukh"
      },
      {
        "id":27,
        "id_country":12,
        "name_ar":"قها",
        "name_en":"Qaha"
      },
      {
        "id":28,
        "id_country":12,
        "name_ar":"العبور",
        "name_en":"Obour"
      },
      {
        "id":29,
        "id_country":12,
        "name_ar":"الخصوص",
        "name_en":"Khosous"
      },
      {
        "id":30,
        "id_country":12,
        "name_ar":"شبين القناطر",
        "name_en":"Shibin Al Qanater"
      }
    ]
  },
  {
    "id":13,
    "name_ar":"الوادي الجديد",
    "name_en":"New Valley",
    "cities":[
      {
        "id":196,
        "id_country":13,
        "name_ar":"الخارجة",
        "name_en":"El Kharga"
      },
      {
        "id":197,
        "id_country":13,
        "name_ar":"باريس",
        "name_en":"Paris"
      },
      {
        "id":198,
        "id_country":13,
        "name_ar":"موط",
        "name_en":"Mout"
      },
      {
        "id":199,
        "id_country":13,
        "name_ar":"الفرافرة",
        "name_en":"Farafra"
      },
      {
        "id":200,
        "id_country":13,
        "name_ar":"بلاط",
        "name_en":"Balat"
      }
    ]
  },
  {
    "id":14,
    "name_ar":"السويس",
    "name_en":"Suez",
    "cities":[
      {
        "id":144,
        "id_country":14,
        "name_ar":"السويس",
        "name_en":"Suez"
      }
    ]
  },
  {
    "id":15,
    "name_ar":"اسوان",
    "name_en":"Aswan",
    "cities":[
      {
        "id":240,
        "id_country":15,
        "name_ar":"أسوان",
        "name_en":"Aswan"
      },
      {
        "id":241,
        "id_country":15,
        "name_ar":"أسوان الجديدة",
        "name_en":"Aswan El Gedida"
      },
      {
        "id":242,
        "id_country":15,
        "name_ar":"دراو",
        "name_en":"Drau"
      },
      {
        "id":243,
        "id_country":15,
        "name_ar":"كوم أمبو",
        "name_en":"Kom Ombo"
      },
      {
        "id":244,
        "id_country":15,
        "name_ar":"نصر النوبة",
        "name_en":"Nasr Al Nuba"
      },
      {
        "id":245,
        "id_country":15,
        "name_ar":"كلابشة",
        "name_en":"Kalabsha"
      },
      {
        "id":246,
        "id_country":15,
        "name_ar":"إدفو",
        "name_en":"Edfu"
      },
      {
        "id":247,
        "id_country":15,
        "name_ar":"الرديسية",
        "name_en":"Al-Radisiyah"
      },
      {
        "id":248,
        "id_country":15,
        "name_ar":"البصيلية",
        "name_en":"Al Basilia"
      },
      {
        "id":249,
        "id_country":15,
        "name_ar":"السباعية",
        "name_en":"Al Sibaeia"
      },
      {
        "id":250,
        "id_country":15,
        "name_ar":"ابوسمبل السياحية",
        "name_en":"Abo Simbl Al Siyahia"
      }
    ]
  },
  {
    "id":16,
    "name_ar":"اسيوط",
    "name_en":"Assiut",
    "cities":[
      {
        "id":185,
        "id_country":16,
        "name_ar":"أسيوط",
        "name_en":"Assiut"
      },
      {
        "id":186,
        "id_country":16,
        "name_ar":"أسيوط الجديدة",
        "name_en":"Assiut El Gedida"
      },
      {
        "id":187,
        "id_country":16,
        "name_ar":"ديروط",
        "name_en":"Dayrout"
      },
      {
        "id":188,
        "id_country":16,
        "name_ar":"منفلوط",
        "name_en":"Manfalut"
      },
      {
        "id":189,
        "id_country":16,
        "name_ar":"القوصية",
        "name_en":"Qusiya"
      },
      {
        "id":190,
        "id_country":16,
        "name_ar":"أبنوب",
        "name_en":"Abnoub"
      },
      {
        "id":191,
        "id_country":16,
        "name_ar":"أبو تيج",
        "name_en":"Abu Tig"
      },
      {
        "id":192,
        "id_country":16,
        "name_ar":"الغنايم",
        "name_en":"El Ghanaim"
      },
      {
        "id":193,
        "id_country":16,
        "name_ar":"ساحل سليم",
        "name_en":"Sahel Selim"
      },
      {
        "id":194,
        "id_country":16,
        "name_ar":"البداري",
        "name_en":"El Badari"
      },
      {
        "id":195,
        "id_country":16,
        "name_ar":"صدفا",
        "name_en":"Sidfa"
      }
    ]
  },
  {
    "id":17,
    "name_ar":"بني سويف",
    "name_en":"Beni Suef",
    "cities":[
      {
        "id":160,
        "id_country":17,
        "name_ar":"بني سويف",
        "name_en":"Bani Sweif"
      },
      {
        "id":161,
        "id_country":17,
        "name_ar":"بني سويف الجديدة",
        "name_en":"Beni Suef El Gedida"
      },
      {
        "id":162,
        "id_country":17,
        "name_ar":"الواسطى",
        "name_en":"Al Wasta"
      },
      {
        "id":163,
        "id_country":17,
        "name_ar":"ناصر",
        "name_en":"Naser"
      },
      {
        "id":164,
        "id_country":17,
        "name_ar":"إهناسيا",
        "name_en":"Ehnasia"
      },
      {
        "id":165,
        "id_country":17,
        "name_ar":"ببا",
        "name_en":"beba"
      },
      {
        "id":166,
        "id_country":17,
        "name_ar":"الفشن",
        "name_en":"Fashn"
      },
      {
        "id":167,
        "id_country":17,
        "name_ar":"سمسطا",
        "name_en":"Somasta"
      }
    ]
  },
  {
    "id":18,
    "name_ar":"بورسعيد",
    "name_en":"Port Said",
    "cities":[
      {
        "id":135,
        "id_country":18,
        "name_ar":"بورسعيد",
        "name_en":"PorSaid"
      },
      {
        "id":136,
        "id_country":18,
        "name_ar":"بورفؤاد",
        "name_en":"PorFouad"
      }
    ]
  },
  {
    "id":19,
    "name_ar":"دمياط",
    "name_en":"Damietta",
    "cities":[
      {
        "id":55,
        "id_country":19,
        "name_ar":"دمياط",
        "name_en":"Damietta"
      },
      {
        "id":56,
        "id_country":19,
        "name_ar":"دمياط الجديدة",
        "name_en":"New Damietta"
      },
      {
        "id":57,
        "id_country":19,
        "name_ar":"رأس البر",
        "name_en":"Ras El Bar"
      },
      {
        "id":58,
        "id_country":19,
        "name_ar":"فارسكور",
        "name_en":"Faraskour"
      },
      {
        "id":59,
        "id_country":19,
        "name_ar":"الزرقا",
        "name_en":"Zarqa"
      },
      {
        "id":60,
        "id_country":19,
        "name_ar":"السرو",
        "name_en":"alsaru"
      },
      {
        "id":61,
        "id_country":19,
        "name_ar":"الروضة",
        "name_en":"alruwda"
      },
      {
        "id":62,
        "id_country":19,
        "name_ar":"كفر البطيخ",
        "name_en":"Kafr El-Batikh"
      },
      {
        "id":63,
        "id_country":19,
        "name_ar":"عزبة البرج",
        "name_en":"Azbet Al Burg"
      },
      {
        "id":64,
        "id_country":19,
        "name_ar":"ميت أبو غالب",
        "name_en":"Meet Abou Ghalib"
      },
      {
        "id":65,
        "id_country":19,
        "name_ar":"كفر سعد",
        "name_en":"Kafr Saad"
      }
    ]
  },
  {
    "id":20,
    "name_ar":"الشرقية",
    "name_en":"Sharkia",
    "cities":[
      {
        "id":116,
        "id_country":20,
        "name_ar":"الزقازيق",
        "name_en":"Zagazig"
      },
      {
        "id":117,
        "id_country":20,
        "name_ar":"العاشر من رمضان",
        "name_en":"Al Ashr Men Ramadan"
      },
      {
        "id":118,
        "id_country":20,
        "name_ar":"منيا القمح",
        "name_en":"Minya Al Qamh"
      },
      {
        "id":119,
        "id_country":20,
        "name_ar":"بلبيس",
        "name_en":"Belbeis"
      },
      {
        "id":120,
        "id_country":20,
        "name_ar":"مشتول السوق",
        "name_en":"Mashtoul El Souq"
      },
      {
        "id":121,
        "id_country":20,
        "name_ar":"القنايات",
        "name_en":"Qenaiat"
      },
      {
        "id":122,
        "id_country":20,
        "name_ar":"أبو حماد",
        "name_en":"Abu Hammad"
      },
      {
        "id":123,
        "id_country":20,
        "name_ar":"القرين",
        "name_en":"El Qurain"
      },
      {
        "id":124,
        "id_country":20,
        "name_ar":"ههيا",
        "name_en":"Hehia"
      },
      {
        "id":125,
        "id_country":20,
        "name_ar":"أبو كبير",
        "name_en":"Abu Kabir"
      },
      {
        "id":126,
        "id_country":20,
        "name_ar":"فاقوس",
        "name_en":"Faccus"
      },
      {
        "id":127,
        "id_country":20,
        "name_ar":"الصالحية الجديدة",
        "name_en":"El Salihia El Gedida"
      },
      {
        "id":128,
        "id_country":20,
        "name_ar":"الإبراهيمية",
        "name_en":"Al Ibrahimiyah"
      },
      {
        "id":129,
        "id_country":20,
        "name_ar":"ديرب نجم",
        "name_en":"Deirb Negm"
      },
      {
        "id":130,
        "id_country":20,
        "name_ar":"كفر صقر",
        "name_en":"Kafr Saqr"
      },
      {
        "id":131,
        "id_country":20,
        "name_ar":"أولاد صقر",
        "name_en":"Awlad Saqr"
      },
      {
        "id":132,
        "id_country":20,
        "name_ar":"الحسينية",
        "name_en":"Husseiniya"
      },
      {
        "id":133,
        "id_country":20,
        "name_ar":"صان الحجر القبلية",
        "name_en":"san alhajar alqablia"
      },
      {
        "id":134,
        "id_country":20,
        "name_ar":"منشأة أبو عمر",
        "name_en":"Manshayat Abu Omar"
      }
    ]
  },
  {
    "id":21,
    "name_ar":"جنوب سيناء",
    "name_en":"South Sinai",
    "cities":[
      {
        "id":152,
        "id_country":21,
        "name_ar":"شرم الشيخ",
        "name_en":"Sharm El-Shaikh"
      },
      {
        "id":153,
        "id_country":21,
        "name_ar":"دهب",
        "name_en":"Dahab"
      },
      {
        "id":154,
        "id_country":21,
        "name_ar":"نويبع",
        "name_en":"Nuweiba"
      },
      {
        "id":155,
        "id_country":21,
        "name_ar":"طابا",
        "name_en":"Taba"
      },
      {
        "id":156,
        "id_country":21,
        "name_ar":"سانت كاترين",
        "name_en":"Saint Catherine"
      },
      {
        "id":157,
        "id_country":21,
        "name_ar":"أبو رديس",
        "name_en":"Abu Redis"
      },
      {
        "id":158,
        "id_country":21,
        "name_ar":"أبو زنيمة",
        "name_en":"Abu Zenaima"
      },
      {
        "id":159,
        "id_country":21,
        "name_ar":"رأس سدر",
        "name_en":"Ras Sidr"
      }
    ]
  },
  {
    "id":22,
    "name_ar":"كفر الشيخ",
    "name_en":"Kafr Al sheikh",
    "cities":[
      {
        "id":85,
        "id_country":22,
        "name_ar":"كفر الشيخ",
        "name_en":"Kafr El Sheikh"
      },
      {
        "id":86,
        "id_country":22,
        "name_ar":"دسوق",
        "name_en":"Desouq"
      },
      {
        "id":87,
        "id_country":22,
        "name_ar":"فوه",
        "name_en":"Fooh"
      },
      {
        "id":88,
        "id_country":22,
        "name_ar":"مطوبس",
        "name_en":"Metobas"
      },
      {
        "id":89,
        "id_country":22,
        "name_ar":"برج البرلس",
        "name_en":"Burg Al Burullus"
      },
      {
        "id":90,
        "id_country":22,
        "name_ar":"بلطيم",
        "name_en":"Baltim"
      },
      {
        "id":91,
        "id_country":22,
        "name_ar":"مصيف بلطيم",
        "name_en":"Masief Baltim"
      },
      {
        "id":92,
        "id_country":22,
        "name_ar":"الحامول",
        "name_en":"Hamol"
      },
      {
        "id":93,
        "id_country":22,
        "name_ar":"بيلا",
        "name_en":"Bella"
      },
      {
        "id":94,
        "id_country":22,
        "name_ar":"الرياض",
        "name_en":"Riyadh"
      },
      {
        "id":95,
        "id_country":22,
        "name_ar":"سيدي سالم",
        "name_en":"Sidi Salm"
      },
      {
        "id":96,
        "id_country":22,
        "name_ar":"قلين",
        "name_en":"Qellen"
      },
      {
        "id":97,
        "id_country":22,
        "name_ar":"سيدي غازي",
        "name_en":"Sidi Ghazi"
      }
    ]
  },
  {
    "id":23,
    "name_ar":"مطروح",
    "name_en":"Matrouh",
    "cities":[
      {
        "id":47,
        "id_country":23,
        "name_ar":"مرسى مطروح",
        "name_en":"Marsa Matrouh"
      },
      {
        "id":48,
        "id_country":23,
        "name_ar":"الحمام",
        "name_en":"El Hamam"
      },
      {
        "id":49,
        "id_country":23,
        "name_ar":"العلمين",
        "name_en":"Alamein"
      },
      {
        "id":50,
        "id_country":23,
        "name_ar":"الضبعة",
        "name_en":"Dabaa"
      },
      {
        "id":51,
        "id_country":23,
        "name_ar":"النجيلة",
        "name_en":"Al-Nagila"
      },
      {
        "id":52,
        "id_country":23,
        "name_ar":"سيدي براني",
        "name_en":"Sidi Brani"
      },
      {
        "id":53,
        "id_country":23,
        "name_ar":"السلوم",
        "name_en":"Salloum"
      },
      {
        "id":54,
        "id_country":23,
        "name_ar":"سيوة",
        "name_en":"Siwa"
      }
    ]
  },
  {
    "id":24,
    "name_ar":"الأقصر",
    "name_en":"Luxor",
    "cities":[
      {
        "id":231,
        "id_country":24,
        "name_ar":"الأقصر",
        "name_en":"Luxor"
      },
      {
        "id":232,
        "id_country":24,
        "name_ar":"الأقصر الجديدة",
        "name_en":"New Luxor"
      },
      {
        "id":233,
        "id_country":24,
        "name_ar":"إسنا",
        "name_en":"Esna"
      },
      {
        "id":234,
        "id_country":24,
        "name_ar":"طيبة الجديدة",
        "name_en":"New Tiba"
      },
      {
        "id":235,
        "id_country":24,
        "name_ar":"الزينية",
        "name_en":"Al ziynia"
      },
      {
        "id":236,
        "id_country":24,
        "name_ar":"البياضية",
        "name_en":"Al Bayadieh"
      },
      {
        "id":237,
        "id_country":24,
        "name_ar":"القرنة",
        "name_en":"Al Qarna"
      },
      {
        "id":238,
        "id_country":24,
        "name_ar":"أرمنت",
        "name_en":"Armant"
      },
      {
        "id":239,
        "id_country":24,
        "name_ar":"الطود",
        "name_en":"Al Tud"
      }
    ]
  },
  {
    "id":25,
    "name_ar":"قنا",
    "name_en":"Qena",
    "cities":[
      {
        "id":221,
        "id_country":25,
        "name_ar":"قنا",
        "name_en":"Qena"
      },
      {
        "id":222,
        "id_country":25,
        "name_ar":"قنا الجديدة",
        "name_en":"New Qena"
      },
      {
        "id":223,
        "id_country":25,
        "name_ar":"أبو تشت",
        "name_en":"Abu Tesht"
      },
      {
        "id":224,
        "id_country":25,
        "name_ar":"نجع حمادي",
        "name_en":"Nag Hammadi"
      },
      {
        "id":225,
        "id_country":25,
        "name_ar":"دشنا",
        "name_en":"Deshna"
      },
      {
        "id":226,
        "id_country":25,
        "name_ar":"الوقف",
        "name_en":"Alwaqf"
      },
      {
        "id":227,
        "id_country":25,
        "name_ar":"قفط",
        "name_en":"Qaft"
      },
      {
        "id":228,
        "id_country":25,
        "name_ar":"نقادة",
        "name_en":"Naqada"
      },
      {
        "id":229,
        "id_country":25,
        "name_ar":"فرشوط",
        "name_en":"Farshout"
      },
      {
        "id":230,
        "id_country":25,
        "name_ar":"قوص",
        "name_en":"Quos"
      }
    ]
  },
  {
    "id":26,
    "name_ar":"شمال سيناء",
    "name_en":"North Sinai",
    "cities":[
      {
        "id":145,
        "id_country":26,
        "name_ar":"العريش",
        "name_en":"Arish"
      },
      {
        "id":146,
        "id_country":26,
        "name_ar":"الشيخ زويد",
        "name_en":"Sheikh Zowaid"
      },
      {
        "id":147,
        "id_country":26,
        "name_ar":"نخل",
        "name_en":"Nakhl"
      },
      {
        "id":148,
        "id_country":26,
        "name_ar":"رفح",
        "name_en":"Rafah"
      },
      {
        "id":149,
        "id_country":26,
        "name_ar":"بئر العبد",
        "name_en":"Bir al-Abed"
      },
      {
        "id":150,
        "id_country":26,
        "name_ar":"الحسنة",
        "name_en":"Al Hasana"
      },
      {
        "id":151,
        "id_country":21,
        "name_ar":"الطور",
        "name_en":"Al Toor"
      }
    ]
  },
  {
    "id":27,
    "name_ar":"سوهاج",
    "name_en":"Sohag",
    "cities":[
      {
        "id":208,
        "id_country":27,
        "name_ar":"سوهاج",
        "name_en":"Sohag"
      },
      {
        "id":209,
        "id_country":27,
        "name_ar":"سوهاج الجديدة",
        "name_en":"Sohag El Gedida"
      },
      {
        "id":210,
        "id_country":27,
        "name_ar":"أخميم",
        "name_en":"Akhmeem"
      },
      {
        "id":211,
        "id_country":27,
        "name_ar":"أخميم الجديدة",
        "name_en":"Akhmim El Gedida"
      },
      {
        "id":212,
        "id_country":27,
        "name_ar":"البلينا",
        "name_en":"Albalina"
      },
      {
        "id":213,
        "id_country":27,
        "name_ar":"المراغة",
        "name_en":"El Maragha"
      },
      {
        "id":214,
        "id_country":27,
        "name_ar":"المنشأة",
        "name_en":"almunsha'a"
      },
      {
        "id":215,
        "id_country":27,
        "name_ar":"دار السلام",
        "name_en":"Dar AISalaam"
      },
      {
        "id":216,
        "id_country":27,
        "name_ar":"جرجا",
        "name_en":"Gerga"
      },
      {
        "id":217,
        "id_country":27,
        "name_ar":"جهينة الغربية",
        "name_en":"Jahina Al Gharbia"
      },
      {
        "id":218,
        "id_country":27,
        "name_ar":"ساقلته",
        "name_en":"Saqilatuh"
      },
      {
        "id":219,
        "id_country":27,
        "name_ar":"طما",
        "name_en":"Tama"
      },
      {
        "id":220,
        "id_country":27,
        "name_ar":"طهطا",
        "name_en":"Tahta"
      }
    ]
  }
];

class Api{

  List<Governmet>getAllGovernmet()  {
    print("getAllGovernmet");
    var countries = List<Governmet>();

    //var parsed = convert.jsonDecode(jsonEgypt_governorates);
    //print(Governmet.fromJson(fee));
//print("parsed ${parsed}");
    for (var fee in jsonEgypt_governorates) {
      countries.add(Governmet.fromJson(fee));
      print(fee);
    }
    print(countries.length);

    return countries;
  }

}


