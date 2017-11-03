//
//  CumpleViewController.swift
//  IWEB_P3
//
//  Created by Juan Carlos Díaz Torres on 01/11/2017.
//  Copyright © 2017 Juan Carlos Díaz Torres. All rights reserved.
//

import UIKit

class CumpleViewController: UIViewController {

    @IBOutlet weak var cDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        if let date = defaults.object(forKey: "fechNac") as? Date {
            cDate.date = date
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "VeAAmor" {
            
            if let ivc = segue.destination as? InfoViewController {
                
                ivc.birthday = birdthdayPicker.date
            }
        }
    }

}
