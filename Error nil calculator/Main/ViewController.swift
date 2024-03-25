//
//  ViewController.swift
//  Error nil calculator
//
//  Created by Pavel Barto on 25.03.2024.
//

import UIKit

protocol ViewControllerDelegate{
    func setResulLabel(text: String)
}
    
class ViewController: UIViewController, ViewControllerDelegate {
    
    
    
    var delegate: ViewControllerDelegate?
    var firstNumber: String?
    var secondNumber: String?
    
    func setResulLabel(text: String) {
        print("data recieved")
    }
    
     
     
    
    lazy var resultLabel: UILabel = {
        let resultLabel = UILabel()
        resultLabel.frame.size = CGSize(width: 82, height: 19)
        resultLabel.center.x = view.center.x
        resultLabel.frame.origin.y = 214
        resultLabel.text = "Результат"
        resultLabel.textColor = .black
        resultLabel.font = UIFont.boldSystemFont(ofSize: 16)
        return resultLabel
    }()
    
    lazy var calculationLabel: UILabel = {
        let calculationLabel = UILabel()
        calculationLabel.frame.size = CGSize(width: 282, height: 56)
        calculationLabel.center.x = view.center.x
        calculationLabel.frame.origin.y = 250
        calculationLabel.text = "40 + 24 = 64"
        calculationLabel.font = UIFont.systemFont(ofSize: 46)
        calculationLabel.textAlignment = .center
        return calculationLabel
    }()
    
    lazy var calculateButton: UIButton = {
        let calculateButton = UIButton(primaryAction: secondScreenTransition)
        // ТУТ УЕЗЖАЕТ calculateButton.frame.origin.x = view.frame.origin.x
        calculateButton.frame.origin.x = 20
        calculateButton.frame.size = CGSize(width: 350, height: 56)
        calculateButton.frame.origin.y = 450
        calculateButton.backgroundColor = .systemBlue
        calculateButton.layer.cornerRadius = 28
        calculateButton.setTitle("расчитать", for: .normal)
        calculateButton.setTitleColor(.white, for: .normal)
        return calculateButton
    }()
    
    lazy var secondScreenTransition = UIAction { _ in
        let vc = SecondViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Калькулятор"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(resultLabel)
        view.addSubview(calculationLabel)
        view.addSubview(calculateButton)
    }


}

