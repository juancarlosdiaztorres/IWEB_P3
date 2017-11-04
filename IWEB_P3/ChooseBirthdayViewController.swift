//
//  ChooseBirthdayViewController.swift
//  IWEB_P3
//
//  Created by Juan Carlos Díaz Torres on 02/11/2017.
//  Copyright © 2017 Juan Carlos Díaz Torres. All rights reserved.
//

import UIKit

class ChooseBirthdayViewController: UIViewController {

    
    @IBOutlet weak var datePick: UIDatePicker!
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "goLove" {
            if datePick.date >= Date() {
                let alertController = UIAlertController(title: "Fecha incorrecta", message: "Fecha errónea", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Entendido", style: UIAlertActionStyle.default))
                self.present(alertController, animated: true, completion: nil)
                return false
            }
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goLove" {
            if let clvc = segue.destination as? ChooseLoveViewController {
                clvc.currentBirth = datePick.date
            }
    }
 

}

}
