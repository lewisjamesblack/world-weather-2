//
//  PageItemController.swift
//  world-weather-2
//
//  Created by Lewis Black on 03/04/2016.
//  Copyright © 2016 Lewis Black. All rights reserved.
//

import UIKit

class PageItemController: UIViewController {

    var itemIndex:Int = 0
    var placeName:String = ""
    var location: Place!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        location = Place(name: placeName)
        location.downloadWeatherDetails(itemIndex, completed: { () -> () in
            self.updateUI()
            })
        }
    
    
    func updateUI() {
    }
    

    

}
