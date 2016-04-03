//
//  ViewController.swift
//  world-weather-2
//
//  Created by Lewis Black on 03/04/2016.
//  Copyright © 2016 Lewis Black. All rights reserved.
//

import UIKit

class StartViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self

        searchBar.returnKeyType = UIReturnKeyType.Done

    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        let place = searchBar.text!.uppercaseString
        performSegueWithIdentifier(FIRST_SEGUE, sender: place)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == FIRST_SEGUE {
            if let ViewController = segue.destinationViewController as? ViewController {
                if let place = sender as? String {
                    ViewController.placeName = place
                }
            }
        }
    }
    
}

