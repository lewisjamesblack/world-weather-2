//
//  Place.swift
//  world-weather-2
//
//  Created by Lewis Black on 03/04/2016.
//  Copyright © 2016 Lewis Black. All rights reserved.
//

import Foundation
import Alamofire

class Place {
    private var _placeName: String!
    private var _placeUrl: String!
    private var _name:String!
    private var _dt:String!
    private var _day:String!
    private var _time:String!
    private var _temp:Double!
    private var _maxTemp:Double!
    private var _minTemp:Double!
    private var _iconUrl:String!
    private var _desc:String!
//    private var _windSpeed:Double!
//    private var _windDirection:Double!
//    

    var placeName: String {
        return _placeName
    }
    
    var placeUrl:String {
        return _placeUrl
    }
    
    var name:String {
        if _name == nil {
            return ""
        }
        return _name
    }
    
    var dt:String {
        if _name == nil {
            return ""
        }
        return _dt
    }
    var day:String {
        if _name == nil {
            return ""
        }
        return _day
    }
    var time:String {
        if _name == nil {
            return ""
        }
        return _time
    }
    
    var temp:Double {
        if _temp == nil {
            return 0
        }
        return _temp
    }
    
    var maxTemp:Double {
        if _maxTemp == nil {
            return 0
        }
        return _maxTemp
    }
    
    var minTemp:Double {
        if _minTemp == nil {
            return 0
        }
        return _minTemp
    }
    
    var iconUrl:String {
        if _iconUrl == nil {
            return ""
        }
        return _iconUrl
    }
    
    var desc:String {
        if _desc == nil {
            return ""
        }
        return _desc
    }
    
//    var windSpeed:Double {
//        if _windSpeed == nil {
//            return 0
//        }
//        return _windSpeed
//    }
//    
//    var windDirection:Double {
//        if _windDirection == nil {
//            return 0
//        }
//        return _windDirection
//    }
    
    required init(name: String){
        self._placeName = name
        _placeUrl = "\(URL_BASE)\(placeName.uppercaseString)\(URL_ID)"
    }
    
    func downloadWeatherDetails(index:Int, completed: DownloadComplete) {
        // why do I have to do this below
        let url = NSURL(string: _placeUrl)!
        Alamofire.request(.GET, url).responseJSON { response in
           
           
            if let dict = response.result.value as? Dictionary<String, AnyObject>{
                let name = dict["city"]?["name"] as? String
                self._name = name
                
                let date = dict["list"]?[index]?["dt"] as? Double
                // print (date)
                let dt = NSDate(timeIntervalSince1970: date!)
                let dayFormatter = NSDateFormatter()
                let timeFormatter = NSDateFormatter()
                let dateFormatter = NSDateFormatter()
                dayFormatter.dateFormat = "E"
                timeFormatter.dateFormat = "HH:mm"
                dateFormatter.dateFormat = "MMM d, yyy"
                self._dt = dateFormatter.stringFromDate(dt)
                self._day = dayFormatter.stringFromDate(dt)
                self._time = timeFormatter.stringFromDate(dt)
                
                let temp = dict["list"]?[index]?["main"]?!["temp"] as? Double
                // print (temp)
                self._temp = temp
                
                let minTemp = dict["list"]?[index]?["main"]?!["temp_min"] as? Double
                // print (minTemp)
                self._minTemp = minTemp
                
                let maxTemp = dict["list"]?[index]?["main"]?!["temp_max"] as? Double
                // print (maxTemp)
                self._maxTemp = maxTemp
                
                let iconUrl = dict["list"]?[index]?["weather"]?![0]["icon"] as! String
                self._iconUrl = "\(WEATHER_URL)\(iconUrl)\(WEATHER_PNG)"
                //print(icon)
                
                let desc = dict["list"]?[index]?["weather"]?![0]["description"] as? String
                self._desc = desc?.capitalizedString
                //print(desc)
                
//                let windSpeed = dict["list"]?[index]?["wind"]?!["speed"] as? Double
//                self._windSpeed = windSpeed
//                //print(windSpeed)
//                
//                let windDirection = dict["list"]?[index]?["wind"]?!["deg"] as? Double
//                self._windDirection = windDirection
//                //print(windDirection)
                
            } else {
                print ("shit")
                
            }
            completed()
        }
        
        

    }
}
