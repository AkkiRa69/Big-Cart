// To parse this JSON data, do
//
//     final randomUserModel = randomUserModelFromMap(jsonString);

import 'dart:convert';

RandomUserModel randomUserModelFromMap(String str) => RandomUserModel.fromMap(json.decode(str));

String randomUserModelToMap(RandomUserModel data) => json.encode(data.toMap());

class RandomUserModel {
    List<Result>? results;
    Info? info;

    RandomUserModel({
        this.results,
        this.info,
    });

    factory RandomUserModel.fromMap(Map<String, dynamic> json) => RandomUserModel(
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromMap(x))),
        info: json["info"] == null ? null : Info.fromMap(json["info"]),
    );

    Map<String, dynamic> toMap() => {
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toMap())),
        "info": info?.toMap(),
    };
}

class Info {
    String? seed;
    int? results;
    int? page;
    String? version;

    Info({
        this.seed,
        this.results,
        this.page,
        this.version,
    });

    factory Info.fromMap(Map<String, dynamic> json) => Info(
        seed: json["seed"],
        results: json["results"],
        page: json["page"],
        version: json["version"],
    );

    Map<String, dynamic> toMap() => {
        "seed": seed,
        "results": results,
        "page": page,
        "version": version,
    };
}

class Result {
    String? gender;
    Name? name;
    Location? location;
    String? email;
    Login? login;
    Dob? dob;
    Dob? registered;
    String? phone;
    String? cell;
    Id? id;
    Picture? picture;
    String? nat;

    Result({
        this.gender,
        this.name,
        this.location,
        this.email,
        this.login,
        this.dob,
        this.registered,
        this.phone,
        this.cell,
        this.id,
        this.picture,
        this.nat,
    });

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        gender: json["gender"],
        name: json["name"] == null ? null : Name.fromMap(json["name"]),
        location: json["location"] == null ? null : Location.fromMap(json["location"]),
        email: json["email"],
        login: json["login"] == null ? null : Login.fromMap(json["login"]),
        dob: json["dob"] == null ? null : Dob.fromMap(json["dob"]),
        registered: json["registered"] == null ? null : Dob.fromMap(json["registered"]),
        phone: json["phone"],
        cell: json["cell"],
        id: json["id"] == null ? null : Id.fromMap(json["id"]),
        picture: json["picture"] == null ? null : Picture.fromMap(json["picture"]),
        nat: json["nat"],
    );

    Map<String, dynamic> toMap() => {
        "gender": gender,
        "name": name?.toMap(),
        "location": location?.toMap(),
        "email": email,
        "login": login?.toMap(),
        "dob": dob?.toMap(),
        "registered": registered?.toMap(),
        "phone": phone,
        "cell": cell,
        "id": id?.toMap(),
        "picture": picture?.toMap(),
        "nat": nat,
    };
}

class Dob {
    DateTime? date;
    int? age;

    Dob({
        this.date,
        this.age,
    });

    factory Dob.fromMap(Map<String, dynamic> json) => Dob(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        age: json["age"],
    );

    Map<String, dynamic> toMap() => {
        "date": date?.toIso8601String(),
        "age": age,
    };
}

class Id {
    String? name;
    String? value;

    Id({
        this.name,
        this.value,
    });

    factory Id.fromMap(Map<String, dynamic> json) => Id(
        name: json["name"],
        value: json["value"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "value": value,
    };
}

class Location {
    Street? street;
    String? city;
    String? state;
    String? country;
    dynamic postcode;
    Coordinates? coordinates;
    Timezone? timezone;

    Location({
        this.street,
        this.city,
        this.state,
        this.country,
        this.postcode,
        this.coordinates,
        this.timezone,
    });

    factory Location.fromMap(Map<String, dynamic> json) => Location(
        street: json["street"] == null ? null : Street.fromMap(json["street"]),
        city: json["city"],
        state: json["state"],
        country: json["country"],
        postcode: json["postcode"],
        coordinates: json["coordinates"] == null ? null : Coordinates.fromMap(json["coordinates"]),
        timezone: json["timezone"] == null ? null : Timezone.fromMap(json["timezone"]),
    );

    Map<String, dynamic> toMap() => {
        "street": street?.toMap(),
        "city": city,
        "state": state,
        "country": country,
        "postcode": postcode,
        "coordinates": coordinates?.toMap(),
        "timezone": timezone?.toMap(),
    };
}

class Coordinates {
    String? latitude;
    String? longitude;

    Coordinates({
        this.latitude,
        this.longitude,
    });

    factory Coordinates.fromMap(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"],
        longitude: json["longitude"],
    );

    Map<String, dynamic> toMap() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}

class Street {
    int? number;
    String? name;

    Street({
        this.number,
        this.name,
    });

    factory Street.fromMap(Map<String, dynamic> json) => Street(
        number: json["number"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "number": number,
        "name": name,
    };
}

class Timezone {
    String? offset;
    String? description;

    Timezone({
        this.offset,
        this.description,
    });

    factory Timezone.fromMap(Map<String, dynamic> json) => Timezone(
        offset: json["offset"],
        description: json["description"],
    );

    Map<String, dynamic> toMap() => {
        "offset": offset,
        "description": description,
    };
}

class Login {
    String? uuid;
    String? username;
    String? password;
    String? salt;
    String? md5;
    String? sha1;
    String? sha256;

    Login({
        this.uuid,
        this.username,
        this.password,
        this.salt,
        this.md5,
        this.sha1,
        this.sha256,
    });

    factory Login.fromMap(Map<String, dynamic> json) => Login(
        uuid: json["uuid"],
        username: json["username"],
        password: json["password"],
        salt: json["salt"],
        md5: json["md5"],
        sha1: json["sha1"],
        sha256: json["sha256"],
    );

    Map<String, dynamic> toMap() => {
        "uuid": uuid,
        "username": username,
        "password": password,
        "salt": salt,
        "md5": md5,
        "sha1": sha1,
        "sha256": sha256,
    };
}

class Name {
    String? title;
    String? first;
    String? last;

    Name({
        this.title,
        this.first,
        this.last,
    });

    factory Name.fromMap(Map<String, dynamic> json) => Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
    );

    Map<String, dynamic> toMap() => {
        "title": title,
        "first": first,
        "last": last,
    };
}

class Picture {
    String? large;
    String? medium;
    String? thumbnail;

    Picture({
        this.large,
        this.medium,
        this.thumbnail,
    });

    factory Picture.fromMap(Map<String, dynamic> json) => Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toMap() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
    };
}
