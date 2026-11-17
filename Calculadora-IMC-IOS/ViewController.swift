//
//  ViewController.swift
//  Calculadora-IMC-IOS
//
//  Created by Mananas on 16/11/2026.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    
    var height = 160.0
    var weight = 70.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightChanged(_ sender: UISlider) {
        height = Double(sender.value).rounded()
        heightLabel.text = "\(Int(height))"
    }
    
    @IBAction func weightChanger(_ sender: UIStepper) {
        weight = sender.value
        weightLabel.text = "\(Int(weight))"
    }
    
    @IBAction func calculateBMI(_ sender: Any) {
        let heightInMeters = height / 100
        let result = weight / pow(heightInMeters, 2)
        resultLabel.text = String(format: "%.2f", result)
        
        switch result {
        case 0..<18.5:
            resultDescriptionLabel.text = "bajo peso"
            resultDescriptionLabel.textColor = UIColor.bmiBajopeso
            resultLabel.textColor = UIColor.bmiBajopeso
        case 18.5..<25:
            resultDescriptionLabel.text = "peso normal"
            resultDescriptionLabel.textColor = UIColor.bmiNormal
            resultLabel.textColor = UIColor.bmiNormal
        case 25..<30:
            resultDescriptionLabel.text = "sobrepeso"
            resultDescriptionLabel.textColor = UIColor.bmiSobrepeso
            resultLabel.textColor = UIColor.bmiSobrepeso
        case 30..<35:
            resultDescriptionLabel.text = "obesidad"
            resultDescriptionLabel.textColor = UIColor.bmiObesidad
            resultLabel.textColor = UIColor.bmiObesidad
        default:
            resultDescriptionLabel.text = "obesidad extrema"
            resultDescriptionLabel.textColor = UIColor.bmiObesidadextrema
            resultLabel.textColor = UIColor.bmiObesidadextrema
        }
    }
}

