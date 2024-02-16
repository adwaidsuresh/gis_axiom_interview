// To parse this JSON data, do
//
//     final restuarent = restuarentFromJson(jsonString);

import 'dart:convert';

Restuarent restuarentFromJson(String str) =>
    Restuarent.fromJson(json.decode(str));

String restuarentToJson(Restuarent data) => json.encode(data.toJson());

class Restuarent {
  String? response;
  List<MenuItem>? menuItems;
  String? pageTitle;
  Website? website;

  Restuarent({
    this.response,
    this.menuItems,
    this.pageTitle,
    this.website,
  });

  factory Restuarent.fromJson(Map<String, dynamic> json) => Restuarent(
        response: json["response"],
        menuItems: json["menu_items"] == null
            ? []
            : List<MenuItem>.from(
                json["menu_items"]!.map((x) => MenuItem.fromJson(x))),
        pageTitle: json["page_title"],
        website:
            json["website"] == null ? null : Website.fromJson(json["website"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response,
        "menu_items": menuItems == null
            ? []
            : List<dynamic>.from(menuItems!.map((x) => x.toJson())),
        "page_title": pageTitle,
        "website": website?.toJson(),
      };
}

class MenuItem {
  String? name;
  SliderTitle? sliderTitle;
  SliderDesc? sliderDesc;
  String? isActive;
  String? sliderImage;
  List<Product>? products;

  MenuItem({
    this.name,
    this.sliderTitle,
    this.sliderDesc,
    this.isActive,
    this.sliderImage,
    this.products,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) => MenuItem(
        name: json["name"],
        sliderTitle: sliderTitleValues.map[json["slider_title"]]!,
        sliderDesc: sliderDescValues.map[json["slider_desc"]]!,
        isActive: json["is_active"],
        sliderImage: json["slider_image"],
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slider_title": sliderTitleValues.reverse[sliderTitle],
        "slider_desc": sliderDescValues.reverse[sliderDesc],
        "is_active": isActive,
        "slider_image": sliderImage,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  String? id;
  String? name;
  String? desc;
  String? amount;
  String? productType;
  String? isActive;
  String? image;
  Currency? currency;

  Product({
    this.id,
    this.name,
    this.desc,
    this.amount,
    this.productType,
    this.isActive,
    this.image,
    this.currency,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        amount: json["amount"],
        productType: json["product_type"],
        isActive: json["is_active"],
        image: json["image"],
        currency: currencyValues.map[json["currency"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "amount": amount,
        "product_type": productType,
        "is_active": isActive,
        "image": image,
        "currency": currencyValues.reverse[currency],
      };
}

enum Currency { EMPTY, INR }

final currencyValues = EnumValues({"₹": Currency.EMPTY, "INR": Currency.INR});

enum SliderDesc { EMPTY, STARTER_DISHES }

final sliderDescValues = EnumValues(
    {"": SliderDesc.EMPTY, "Starter dishes": SliderDesc.STARTER_DISHES});

enum SliderTitle { EMPTY, STARTER }

final sliderTitleValues =
    EnumValues({"": SliderTitle.EMPTY, "Starter": SliderTitle.STARTER});

class Website {
  String? id;
  String? restaurantId;
  String? eventId;
  String? aboutUs;
  String? sliderTitle;
  String? sliderDesc;
  String? phone;
  String? mobile;
  String? email;
  String? address;
  String? copyright;
  String? facebookLink;
  String? instagramLink;
  String? twitterLink;
  String? pinterestLink;
  String? linkedinLink;
  String? image;
  String? isPdfMenu;
  String? pdfMenu;

  Website({
    this.id,
    this.restaurantId,
    this.eventId,
    this.aboutUs,
    this.sliderTitle,
    this.sliderDesc,
    this.phone,
    this.mobile,
    this.email,
    this.address,
    this.copyright,
    this.facebookLink,
    this.instagramLink,
    this.twitterLink,
    this.pinterestLink,
    this.linkedinLink,
    this.image,
    this.isPdfMenu,
    this.pdfMenu,
  });

  factory Website.fromJson(Map<String, dynamic> json) => Website(
        id: json["id"],
        restaurantId: json["restaurant_id"],
        eventId: json["event_id"],
        aboutUs: json["about_us"],
        sliderTitle: json["slider_title"],
        sliderDesc: json["slider_desc"],
        phone: json["phone"],
        mobile: json["mobile"],
        email: json["email"],
        address: json["address"],
        copyright: json["copyright"],
        facebookLink: json["facebook_link"],
        instagramLink: json["instagram_link"],
        twitterLink: json["twitter_link"],
        pinterestLink: json["pinterest_link"],
        linkedinLink: json["linkedin_link"],
        image: json["image"],
        isPdfMenu: json["is_pdf_menu"],
        pdfMenu: json["pdf_menu"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "restaurant_id": restaurantId,
        "event_id": eventId,
        "about_us": aboutUs,
        "slider_title": sliderTitle,
        "slider_desc": sliderDesc,
        "phone": phone,
        "mobile": mobile,
        "email": email,
        "address": address,
        "copyright": copyright,
        "facebook_link": facebookLink,
        "instagram_link": instagramLink,
        "twitter_link": twitterLink,
        "pinterest_link": pinterestLink,
        "linkedin_link": linkedinLink,
        "image": image,
        "is_pdf_menu": isPdfMenu,
        "pdf_menu": pdfMenu,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
