//
//  ViewController.swift
//  RGB Slider Screen
//
//  Created by Alexey on 17.11.2022.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet var viewColor: UIView!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    
    @IBOutlet var redValueTF: UITextField!
    @IBOutlet var greenValueTF: UITextField!
    @IBOutlet var blueValueTF: UITextField!
    
    
    @IBOutlet var doneButton: UIButton!
    
    var backGround: UIColor!
    var delegate: ViewContorllerDelegate!
    
    var redSliderValue2: Float!
    var greenSliderValue2: Float!
    var blueSliderValue2: Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderViewColor()
        doneButton.layer.cornerRadius = 10
        viewColor.backgroundColor = backGround
        viewColor.layer.cornerRadius = 20
        sliderSwitch(slider: redSlider, greenSlider, blueSlider)
        navigationItem.setHidesBackButton(true, animated: false)
        redValueTF.delegate = self
        greenValueTF.delegate = self
        blueValueTF.delegate = self
        redValueTF.keyboardType = .numberPad
        greenValueTF.keyboardType = .numberPad
        blueValueTF.keyboardType = .numberPad
        
        
        
    }
    
    
    @IBAction func doneButton(_ sender: UIButton) {
        delegate.setNewBackGraundForMainVC(
            backGround: UIColor(
                red: CGFloat(redSlider.value),
                green: CGFloat(greenSlider.value),
                blue: CGFloat(blueSlider.value),
                alpha: 1),
            red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
        
        dismiss(animated: true)
    }
    
    @IBAction func uniteIBActionForSlider(_ sender: UISlider){
        sliderSwitch(slider: sender)
        sliderViewColor()
        
    }
    
    
    
    private func sliderSwitch(slider: UISlider...){
        for colorSlider in slider{
            switch colorSlider {
            case redSlider:
                redValue.text = String(format: "%.02f", redSlider.value)
                redSliderValue2 = redSlider.value
            case greenSlider:
                greenValue.text = String(format: "%.02f", greenSlider.value)
                greenSliderValue2 = greenSlider.value
            default:
                blueValue.text = String(format: "%.02f", blueSlider.value)
                blueSliderValue2 = blueSlider.value
            }
        }
    }
    
    private func sliderViewColor() {
        viewColor.backgroundColor = UIColor(
            red: CGFloat(redSliderValue2),
            green: CGFloat(greenSliderValue2),
            blue: CGFloat(blueSliderValue2),
            alpha: 1
        )
        redSlider.value = redSliderValue2
        greenSlider.value = greenSliderValue2
        blueSlider.value = blueSliderValue2
    }
    private func sliderTransfer() {
        viewColor.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: (1))
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        redValueTF.becomeFirstResponder()
//        redValueTF.keyboardType = .numberPad
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case redValueTF:
            let valueTF = Float(redValueTF.text ?? String(redSlider.value))
            redSlider.value  = valueTF ?? redSlider.value
            redValue.text = String(format: "%.02f", redSlider.value)
            sliderTransfer()
        case greenValueTF:
            let valueTF = Float(greenValueTF.text ?? String(greenSlider.value))
            greenSlider.value = valueTF ?? greenSlider.value
            greenValue.text = String(format: "%.02f", greenSlider.value)
            sliderTransfer()
        default:
            let valueTF = Float(blueValueTF.text ?? String(blueSlider.value))
            blueSlider.value = valueTF ?? blueSlider.value
            greenValue.text = String(format: "%.02f", blueSlider.value)
           sliderTransfer()
        }
    }
     
}

