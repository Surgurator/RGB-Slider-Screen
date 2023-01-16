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
    var redSliderValueMainVC: Float = 1
    var greenSliderValueMainVC: Float = 1
    var blueSliderValueMainVC: Float = 1
    @IBOutlet var mainViewColor: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? ViewController else { return }
viewController.backGround = mainViewColor.backgroundColor
        viewController.delegate = self

        viewController.redSliderValueVC = redSliderValueMainVC
        viewController.greenSliderValueVC = greenSliderValueMainVC
        viewController.blueSliderValueVC = blueSliderValueMainVC
    }
    
    @IBAction func settingButtonPressed(_ sender: UIBarButtonItem) {
    }
}

extension MainViewController: ViewContorllerDelegate {
    func setNewBackGraundForMainVC(backGround: UIColor, red: Float, green: Float, blue: Float) {
        mainViewColor.backgroundColor = backGround
        redSliderValueMainVC = red
        greenSliderValueMainVC = green
        blueSliderValueMainVC = blue
    }
}

    

