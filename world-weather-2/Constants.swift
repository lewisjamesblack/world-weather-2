//
//  Constants.swift
//  world-weather-2
//
//  Created by Lewis Black on 03/04/2016.
//  Copyright © 2016 Lewis Black. All rights reserved.
//

import Foundation

let URL_BASE = "http://api.openweathermap.org/data/2.5/forecast/city?q="

let URL_ID = "&APPID=6d6214b9a412e7f3ba24be9e9f73e21d"

let FIRST_SEGUE = "SearchBarSegue"

//http://api.openweathermap.org/data/2.5/forecast/city?q=WHITCHURCH&APPID=6d6214b9a412e7f3ba24be9e9f73e21d

let PAGES_AMMOUNT = 5

typealias DownloadComplete = () -> ()

//   0
//290.97
//   1
//289.84
//   2
//288.1
//   3
//287.67
//   4
//286.57

let WEATHER_URL = "http://openweathermap.org/img/w/"
let WEATHER_PNG = ".png"