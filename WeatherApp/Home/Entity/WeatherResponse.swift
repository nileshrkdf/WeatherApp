//
//  Weather.swift
//  WeatherApp
//
//  Created by Nilesh Malviya on 3/28/21.
//

import Foundation

struct WeatherResponse: Decodable {
    var list: [Weathers]?
    var cod: String?
    var message: Int = 0
    var cnt: Int = 0
    var city: City?
}

struct Weathers: Decodable {
    var dt: Int64 = 0
    var main: Main?
    var weather: [Weather]?
    var clouds: Cloud?
    var wind: Wind?
    var sys: Sys?
    var dt_txt: String?
}

struct Main: Decodable  {
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Int
    var sea_level: Int
    var grnd_level: Int
    var humidity: Int
    var temp_kf: Double
}

struct Weather: Decodable  {
    var id: Int64 = 0
    var main: String?
    var description: String?
    var icon: String?
}

struct Cloud: Decodable  {
    var all: Int = 0
}

struct Wind: Decodable  {
    var speed = 0.0
    var deg: Int = 0
}

struct Sys: Decodable  {
    var pod: String?
}

struct City: Decodable {
    var name: String?
}
