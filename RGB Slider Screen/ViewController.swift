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
        sutupActionRedSlider()
        sutupActionGreenSlider()
        sutupActionBlueSlider()
        viewColor.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0)
        
    }

    @IBAction func actionRedSlider(){
        redValue.text = String(format: "%.02f", redSlider.value)
        viewColor.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func actionGreenSlider(){
        greenValue.text = String(format: "%.02f", greenSlider.value)
        viewColor.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func actionBlueSlider(){
        blueValue.text = String(format: "%.02f", blueSlider.value)
        viewColor.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
  
    private func sutupActionRedSlider(){
        redSlider.value = 0.0
        redSlider.minimumValue = 0.0
        redSlider.maximumValue = 1.0
    }
    
    private func sutupActionGreenSlider(){
        greenSlider.value = 0.0
        greenSlider.minimumValue = 0.0
        greenSlider.maximumValue = 1.0
    }
    
    private func sutupActionBlueSlider(){
        blueSlider.value = 0.0
        blueSlider.minimumValue = 0.0
        blueSlider.maximumValue = 1.0
    }
    
 
    
}
