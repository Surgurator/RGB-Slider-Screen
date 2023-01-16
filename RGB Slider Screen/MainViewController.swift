//
//  MainViewController.swift
//  RGB Slider Screen
//
//  Created by Alexey on 09.01.2023.
//

import UIKit

protocol ViewContorllerDelegate {
    func setNewBackGraundForMainVC (backGround: UIColor, red: Float, green: Float, blue: Float)
}

class MainViewController: UIViewController {
    var redSliderValue: Float = 1
    var greenSliderValue: Float = 1
    var blueSliderValue: Float = 1
    @IBOutlet var mainViewColor: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? ViewController else { return }
viewController.backGround = mainViewColor.backgroundColor
        viewController.delegate = self

        viewController.redSliderValue2 = redSliderValue
        viewController.greenSliderValue2 = greenSliderValue
        viewController.blueSliderValue2 = blueSliderValue
    }
    @IBAction func settingButtonPressed(_ sender: UIBarButtonItem) {
    }
}
extension MainViewController: ViewContorllerDelegate {
    func setNewBackGraundForMainVC(backGround: UIColor, red: Float, green: Float, blue: Float) {
        mainViewColor.backgroundColor = backGround
        redSliderValue = red
        greenSliderValue = green
        blueSliderValue = blue
    }
}

    

