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
    
    @IBOutlet weak var indexTxt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indexTxt.text = "\(itemIndex)"
    }

}
