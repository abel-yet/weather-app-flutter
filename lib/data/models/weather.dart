import 'dart:convert';

class Weather {
    final Location location;
    final Current current;
    final Forecast forecast;

    Weather({
        required this.location,
        required this.current,
        required this.forecast,
    });

    Weather copyWith({
        Location? location,
        Current? current,
        Forecast? forecast,
    }) => 
        Weather(
            location: location ?? this.location,
            current: current ?? this.current,
            forecast: forecast ?? this.forecast,
        );

    factory Weather.fromJson(String str) => Weather.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Weather.fromMap(Map<String, dynamic> json) => Weather(
        location: Location.fromMap(json["location"]),
        current: Current.fromMap(json["current"]),
        forecast: Forecast.fromMap(json["forecast"]),
    );

    Map<String, dynamic> toMap() => {
        "location": location.toMap(),
        "current": current.toMap(),
        "forecast": forecast.toMap(),
    };
}

class Current {
    final double tempC;
    final double tempF;
    final CurrentCondition condition;
    final double windMph;
    final double windKph;
    final int windDegree;
    final String windDir;
    final double pressureMb;
    final double pressureIn;
    final double precipMm;
    final double precipIn;
    final double humidity;
    final double feelslikeC;
    final double feelslikeF;
    final double visKm;
    final double visMiles;

    Current({
        required this.tempC,
        required this.tempF,
        required this.condition,
        required this.windMph,
        required this.windKph,
        required this.windDegree,
        required this.windDir,
        required this.pressureMb,
        required this.pressureIn,
        required this.precipMm,
        required this.precipIn,
        required this.humidity,
        required this.feelslikeC,
        required this.feelslikeF,
        required this.visKm,
        required this.visMiles,
    });

    Current copyWith({
        double? tempC,
        double? tempF,
        CurrentCondition? condition,
        double? windMph,
        double? windKph,
        int? windDegree,
        String? windDir,
        double? pressureMb,
        double? pressureIn,
        double? precipMm,
        double? precipIn,
        double? humidity,
        double? feelslikeC,
        double? feelslikeF,
        double? visKm,
        double? visMiles,
    }) => 
        Current(
            tempC: tempC ?? this.tempC,
            tempF: tempF ?? this.tempF,
            condition: condition ?? this.condition,
            windMph: windMph ?? this.windMph,
            windKph: windKph ?? this.windKph,
            windDegree: windDegree ?? this.windDegree,
            windDir: windDir ?? this.windDir,
            pressureMb: pressureMb ?? this.pressureMb,
            pressureIn: pressureIn ?? this.pressureIn,
            precipMm: precipMm ?? this.precipMm,
            precipIn: precipIn ?? this.precipIn,
            humidity: humidity ?? this.humidity,
            feelslikeC: feelslikeC ?? this.feelslikeC,
            feelslikeF: feelslikeF ?? this.feelslikeF,
            visKm: visKm ?? this.visKm,
            visMiles: visMiles ?? this.visMiles,
        );

    factory Current.fromJson(String str) => Current.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Current.fromMap(Map<String, dynamic> json) => Current(
        tempC: json["temp_c"],
        tempF: json["temp_f"],
        condition: CurrentCondition.fromMap(json["condition"]),
        windMph: json["wind_mph"],
        windKph: json["wind_kph"],
        windDegree: json["wind_degree"],
        windDir: json["wind_dir"],
        pressureMb: json["pressure_mb"],
        pressureIn: json["pressure_in"],
        precipMm: json["precip_mm"],
        precipIn: json["precip_in"],
        humidity: json["humidity"].toDouble(),
        feelslikeC: json["feelslike_c"],
        feelslikeF: json["feelslike_f"],
        visKm: json["vis_km"],
        visMiles: json["vis_miles"],
    );

    Map<String, dynamic> toMap() => {
        "temp_c": tempC,
        "temp_f": tempF,
        "condition": condition.toMap(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "humidity": humidity,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "vis_km": visKm,
        "vis_miles": visMiles,
    };
}

class CurrentCondition {
    final String text;
    final String icon;
    final int code;

    CurrentCondition({
        required this.text,
        required this.icon,
        required this.code,
    });

    CurrentCondition copyWith({
        String? text,
        String? icon,
        int? code,
    }) => 
        CurrentCondition(
            text: text ?? this.text,
            icon: icon ?? this.icon,
            code: code ?? this.code,
        );

    factory CurrentCondition.fromJson(String str) => CurrentCondition.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CurrentCondition.fromMap(Map<String, dynamic> json) => CurrentCondition(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
    );

    Map<String, dynamic> toMap() => {
        "text": text,
        "icon": icon,
        "code": code,
    };
}

class Forecast {
    final List<Forecastday> forecastdays;

    Forecast({
        required this.forecastdays,
    });

    Forecast copyWith({
        List<Forecastday>? forecastdays,
    }) => 
        Forecast(
            forecastdays: forecastdays ?? this.forecastdays,
        );

    factory Forecast.fromJson(String str) => Forecast.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Forecast.fromMap(Map<String, dynamic> json) => Forecast(
        forecastdays: List<Forecastday>.from(json["forecastday"].map((x) => Forecastday.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "forecastday": List<dynamic>.from(forecastdays.map((x) => x.toMap())),
    };
}

class Forecastday {
    final DateTime date;
    final int dateEpoch;
    final Day day;
    final List<Hour> hour;

    Forecastday({
        required this.date,
        required this.dateEpoch,
        required this.day,
        required this.hour,
    });

    Forecastday copyWith({
        DateTime? date,
        int? dateEpoch,
        Day? day,
        List<Hour>? hour,
    }) => 
        Forecastday(
            date: date ?? this.date,
            dateEpoch: dateEpoch ?? this.dateEpoch,
            day: day ?? this.day,
            hour: hour ?? this.hour,
        );

    factory Forecastday.fromJson(String str) => Forecastday.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Forecastday.fromMap(Map<String, dynamic> json) => Forecastday(
        date: DateTime.parse(json["date"]),
        dateEpoch: json["date_epoch"],
        day: Day.fromMap(json["day"]),
        hour: List<Hour>.from(json["hour"].map((x) => Hour.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "date_epoch": dateEpoch,
        "day": day.toMap(),
        "hour": List<dynamic>.from(hour.map((x) => x.toMap())),
    };
}

class Day {
    final double maxtempC;
    final double maxtempF;
    final double mintempC;
    final double mintempF;
    final double avgtempC;
    final double avgtempF;
    final double maxwindMph;
    final double maxwindKph;
    final double totalprecipMm;
    final double totalprecipIn;
    final double avgvisKm;
    final double avgvisMiles;
    final double avghumidity;
    final CurrentCondition condition;

    Day({
        required this.maxtempC,
        required this.maxtempF,
        required this.mintempC,
        required this.mintempF,
        required this.avgtempC,
        required this.avgtempF,
        required this.maxwindMph,
        required this.maxwindKph,
        required this.totalprecipMm,
        required this.totalprecipIn,
        required this.avgvisKm,
        required this.avgvisMiles,
        required this.avghumidity,
        required this.condition,
    });

    Day copyWith({
        double? maxtempC,
        double? maxtempF,
        double? mintempC,
        double? mintempF,
        double? avgtempC,
        double? avgtempF,
        double? maxwindMph,
        double? maxwindKph,
        double? totalprecipMm,
        double? totalprecipIn,
        double? avgvisKm,
        double? avgvisMiles,
        double? avghumidity,
        CurrentCondition? condition,
    }) => 
        Day(
            maxtempC: maxtempC ?? this.maxtempC,
            maxtempF: maxtempF ?? this.maxtempF,
            mintempC: mintempC ?? this.mintempC,
            mintempF: mintempF ?? this.mintempF,
            avgtempC: avgtempC ?? this.avgtempC,
            avgtempF: avgtempF ?? this.avgtempF,
            maxwindMph: maxwindMph ?? this.maxwindMph,
            maxwindKph: maxwindKph ?? this.maxwindKph,
            totalprecipMm: totalprecipMm ?? this.totalprecipMm,
            totalprecipIn: totalprecipIn ?? this.totalprecipIn,
            avgvisKm: avgvisKm ?? this.avgvisKm,
            avgvisMiles: avgvisMiles ?? this.avgvisMiles,
            avghumidity: avghumidity ?? this.avghumidity,
            condition: condition ?? this.condition,
        );

    factory Day.fromJson(String str) => Day.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Day.fromMap(Map<String, dynamic> json) => Day(
        maxtempC: json["maxtemp_c"],
        maxtempF: json["maxtemp_f"],
        mintempC: json["mintemp_c"],
        mintempF: json["mintemp_f"],
        avgtempC: json["avgtemp_c"],
        avgtempF: json["avgtemp_f"],
        maxwindMph: json["maxwind_mph"],
        maxwindKph: json["maxwind_kph"],
        totalprecipMm: json["totalprecip_mm"],
        totalprecipIn: json["totalprecip_in"],
        avgvisKm: json["avgvis_km"],
        avgvisMiles: json["avgvis_miles"],
        avghumidity: json["avghumidity"].toDouble(),
        condition: CurrentCondition.fromMap(json["condition"]),
    );

    Map<String, dynamic> toMap() => {
        "maxtemp_c": maxtempC,
        "maxtemp_f": maxtempF,
        "mintemp_c": mintempC,
        "mintemp_f": mintempF,
        "avgtemp_c": avgtempC,
        "avgtemp_f": avgtempF,
        "maxwind_mph": maxwindMph,
        "maxwind_kph": maxwindKph,
        "totalprecip_mm": totalprecipMm,
        "totalprecip_in": totalprecipIn,
        "avgvis_km": avgvisKm,
        "avgvis_miles": avgvisMiles,
        "avghumidity": avghumidity,
        "condition": condition.toMap(),
    };
}

class Hour {
    final int timeEpoch;
    final String time;
    final double tempC;
    final double tempF;
    final HourCondition condition;

    Hour({
        required this.timeEpoch,
        required this.time,
        required this.tempC,
        required this.tempF,
        required this.condition,
    });

    Hour copyWith({
        int? timeEpoch,
        String? time,
        double? tempC,
        double? tempF,
        HourCondition? condition,
    }) => 
        Hour(
            timeEpoch: timeEpoch ?? this.timeEpoch,
            time: time ?? this.time,
            tempC: tempC ?? this.tempC,
            tempF: tempF ?? this.tempF,
            condition: condition ?? this.condition,
        );

    factory Hour.fromJson(String str) => Hour.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Hour.fromMap(Map<String, dynamic> json) => Hour(
        timeEpoch: json["time_epoch"],
        time: json["time"],
        tempC: json["temp_c"],
        tempF: json["temp_f"],
        condition: HourCondition.fromMap(json["condition"]),
    );

    Map<String, dynamic> toMap() => {
        "time_epoch": timeEpoch,
        "time": time,
        "temp_c": tempC,
        "temp_f": tempF,
        "condition": condition.toMap(),
    };
}

class HourCondition {
    final String icon;
    final int code;

    HourCondition({
        required this.icon,
        required this.code,
    });

    HourCondition copyWith({
        String? icon,
        int? code,
    }) => 
        HourCondition(
            icon: icon ?? this.icon,
            code: code ?? this.code,
        );

    factory HourCondition.fromJson(String str) => HourCondition.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory HourCondition.fromMap(Map<String, dynamic> json) => HourCondition(
        icon: json["icon"],
        code: json["code"],
    );

    Map<String, dynamic> toMap() => {
        "icon": icon,
        "code": code,
    };
}

class Location {
    final String name;
    final String region;
    final String country;
    final double lat;
    final double lon;
    final String tzId;
    final int localtimeEpoch;
    final String localtime;

    Location({
        required this.name,
        required this.region,
        required this.country,
        required this.lat,
        required this.lon,
        required this.tzId,
        required this.localtimeEpoch,
        required this.localtime,
    });

    Location copyWith({
        String? name,
        String? region,
        String? country,
        double? lat,
        double? lon,
        String? tzId,
        int? localtimeEpoch,
        String? localtime,
    }) => 
        Location(
            name: name ?? this.name,
            region: region ?? this.region,
            country: country ?? this.country,
            lat: lat ?? this.lat,
            lon: lon ?? this.lon,
            tzId: tzId ?? this.tzId,
            localtimeEpoch: localtimeEpoch ?? this.localtimeEpoch,
            localtime: localtime ?? this.localtime,
        );

    factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Location.fromMap(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"],
        lon: json["lon"],
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
    };
}
