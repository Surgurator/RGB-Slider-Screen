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
    
    @IBOutlet var toolBar: UIToolbar!
    
    @IBOutlet var doneButton: UIButton!
    
    var backGround: UIColor!
    var delegate: ViewContorllerDelegate!
    
    var redSliderValueVC: Float!
    var greenSliderValueVC: Float!
    var blueSliderValueVC: Float!
    
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
        
        texFieldsSettings()
    }

 
   
    // MARK: IBActions
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
    
    @IBAction func toolBarDoneButton(_ sender: UIBarButtonItem) {
        textFieldDidEndEditing(redValueTF)
        textFieldDidEndEditing(greenValueTF)
        textFieldDidEndEditing(blueValueTF)
        toolBar.isHidden = true
        redValueTF.resignFirstResponder()
        greenValueTF.resignFirstResponder()
        blueValueTF.resignFirstResponder()
    }
    // MARK: Private funcs
    private func texFieldsSettings() {
        redValueTF.keyboardType = .decimalPad
        greenValueTF.keyboardType = .decimalPad
        blueValueTF.keyboardType = .decimalPad
        
        redValueTF.inputAccessoryView = toolBar
        greenValueTF.inputAccessoryView = toolBar
        blueValueTF.inputAccessoryView = toolBar
        
        redValueTF.adjustsFontSizeToFitWidth = true
        redValueTF.minimumFontSize = 12
        greenValueTF.adjustsFontSizeToFitWidth = true
        greenValueTF.minimumFontSize = 12
        blueValueTF.adjustsFontSizeToFitWidth = true
        blueValueTF.minimumFontSize = 12
        
    }
    private func sliderSwitch(slider: UISlider...){
        for colorSlider in slider{
            switch colorSlider {
            case redSlider:
                redValue.text = String(format: "%.02f", redSlider.value)
                redSliderValueVC = redSlider.value
            case greenSlider:
                greenValue.text = String(format: "%.02f", greenSlider.value)
                greenSliderValueVC = greenSlider.value
            default:
                blueValue.text = String(format: "%.02f", blueSlider.value)
                blueSliderValueVC = blueSlider.value
            }
        }
    }
    
    private func sliderViewColor() {
        viewColor.backgroundColor = UIColor(
            red: CGFloat(redSliderValueVC),
            green: CGFloat(greenSliderValueVC),
            blue: CGFloat(blueSliderValueVC),
            alpha: 1
        )
        redSlider.value = redSliderValueVC
        greenSlider.value = greenSliderValueVC
        blueSlider.value = blueSliderValueVC
    }
    
    private func sliderTransfer() {
        viewColor.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: (1))
    }
    // MARK: Text field
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
      toolBar.isHidden = false
        return true
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

