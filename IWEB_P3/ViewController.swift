//
//  ViewController.swift
//  IWEB_P3
//
//  Created by Juan Carlos Díaz Torres on 23/10/2017.
//  Copyright © 2017 Juan Carlos Díaz Torres. All rights reserved.
//

import UIKit			

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var deathLabel: UILabel! //oculta
    var birthDate : Date?
    var loveDate : Date?
    var result : Date!
    //private let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Cargo VC")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*UNWIND*/
    
    // Now, time to catch both vars from LoveVC
    @IBAction func goMain (_ segue: UIStoryboardSegue) {
        if segue.identifier == "goMain" {
            if let vc = segue.source as? ChooseLoveViewController {
                birthDate = vc.currentBirth
                loveDate = vc.lovePick.date
                if let bDate = birthDate, let lDate = loveDate {
                    let deathDate = bDate - 2*lDate.timeIntervalSince(bDate)
                    let calendar = Calendar.current
                    let year = calendar.component(.year, from: deathDate)
                    let month = calendar.component(.month, from: deathDate)
                    let day = calendar.component(.day, from: deathDate)
                    let ageComponents = calendar.dateComponents([.year], from: bDate, to:deathDate)
                    let deathAge = ageComponents.year!
                    deathLabel.text = "Moriras el \(day)/\(month)/\(year) con \(deathAge)años"
                }
            }
        }
    }
    
    /*
 /*RESULTS*/
    private func deathDate(_ birth: Date, _ love: Date) {
        if (birth >= love) {
            let alert = UIAlertController(title: "Error", message: "No puedes haberte enamorado antes de nacer", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Entendido", style: .default))
            present(alert,animated: true)
        } else {
            let time = love.timeIntervalSince(birth)
            result = love.addingTimeInterval(time)
            textLabel.text = "La fecha de tu muerte es:"
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "es_ES")
            dateFormatter.setLocalizedDateFormatFromTemplate("MMMMdY")
            let dateStg = dateFormatter.string(from: result)
            deathDate.text = dateStg
            
        }
    }*/
}

