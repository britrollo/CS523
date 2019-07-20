//
//  ViewController.swift
//  ML
//
//  Created by Brianne Trollo on 3/7/19.
//  Copyright © 2019 Brianne Trollo. All rights reserved.
//

// I pledge my honor that I have abided by the Stevens Honor System.
// Brianne Trollo

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var alcoholLabel: UILabel!
    @IBOutlet weak var alcoholSlider: UISlider!
    @IBOutlet weak var malicAcidLabel: UILabel!
    @IBOutlet weak var malicAcidSlider: UISlider!
    @IBOutlet weak var ashLabel: UILabel!
    @IBOutlet weak var ashSlider: UISlider!
    @IBOutlet weak var alkalinityAshLabel: UILabel!
    @IBOutlet weak var alkalinityAshSlider: UISlider!
    @IBOutlet weak var magnesiumLabel: UILabel!
    @IBOutlet weak var magnesiumSlider: UISlider!
    @IBOutlet weak var totalPhenolsLabel: UILabel!
    @IBOutlet weak var totalPhenolsSlider: UISlider!
    @IBOutlet weak var cultivarLabel: UILabel!
    
    let model = wine()
    
    let numberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stackView.setCustomSpacing(30, after: totalPhenolsSlider)
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        updateValues()
    }
    
    func updateLabels() {
        alcoholLabel.text = "Alcohol: \(numberFormatter.string(for: alcoholSlider.value) ?? "0")"
        malicAcidLabel.text = "Malic Acid: \(numberFormatter.string(for: malicAcidSlider.value) ?? "0")"
        ashLabel.text = "Ash: \(numberFormatter.string(for: ashSlider.value) ?? "0")"
        alkalinityAshLabel.text = "Alkalinity Ash: \(numberFormatter.string(for: alkalinityAshSlider.value) ?? "0")"
        magnesiumLabel.text = "Magnesium: \(numberFormatter.string(for: magnesiumSlider.value) ?? "0")"
        totalPhenolsLabel.text = "Total Phenols: \(numberFormatter.string(for: totalPhenolsSlider.value) ?? "0")"
    }
    
    func predictCultivar() {
        if let prediction = try?model.prediction(alcohol: Double(alcoholSlider.value), malicAcid: Double(malicAcidSlider.value), ash: Double(ashSlider.value), alkalinityAsh: Double(alkalinityAshSlider.value), magnesium: Double(magnesiumSlider.value), totalPhenols: Double(totalPhenolsSlider.value)){
            cultivarLabel.text = "Cultivar \(prediction.classLabel) (\(prediction.classProbability[prediction.classLabel] ?? 0))"
        }
    }

    @IBAction func updateValues() {
        DispatchQueue.main.async {
            self.updateLabels();
            self.predictCultivar();
        }
    }
    
}

