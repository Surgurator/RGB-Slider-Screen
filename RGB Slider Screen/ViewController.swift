//
//  ViewController.swift
//  RGB Slider Screen
//
//  Created by Alexey on 17.11.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var viewColor: UIView!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewColor.layer.cornerRadius = 20
        sliderSwitch(slider: redSlider, greenSlider, blueSlider)
        startViewColor()
    }
    
    @IBAction func uniteIBActionForSlider(){
        sliderSwitch(slider: redSlider, greenSlider, blueSlider)
        startViewColor()
    }
    
    private func sliderSwitch(slider: UISlider...){
        for colorSlider in slider{
            switch colorSlider {
                    case redSlider:
                        redValue.text = String(format: "%.02f", redSlider.value)
                    case greenSlider:
                        greenValue.text = String(format: "%.02f", greenSlider.value)
                    default:
                        blueValue.text = String(format: "%.02f", blueSlider.value)
                    }
        }
    }
    
    private func startViewColor (){
        viewColor.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}
