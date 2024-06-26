//
//  ViewController.swift
//  Error nil calculator
//
//  Created by Pavel Barto on 25.03.2024.
//

import UIKit

protocol ViewControllerDelegate{
    func setResulLabel(text: String)
    func getFirstNumber(firstNumberText: String)
    func getSecondNumber(secondNumberText: String)
}
    
class ViewController: UIViewController, ViewControllerDelegate {
    
    
    func getFirstNumber(firstNumberText: String) {
        firstNumber = firstNumberText
    }
    
    func getSecondNumber(secondNumberText: String) {
        secondNumber = secondNumberText
    }
    
    func setResulLabel(text: String) {
        calculationLabel.text = text
    }
    
    
    var firstNumber: String?
    var secondNumber: String?
    
     
    
     
     
    
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
        calculationLabel.frame.size = CGSize(width: view.frame.width - 40, height: 180)
        calculationLabel.center.x = view.center.x
        calculationLabel.frame.origin.y = 250
        calculationLabel.text = ""
        calculationLabel.numberOfLines = 0
        calculationLabel.font = UIFont.systemFont(ofSize: 46)
        calculationLabel.textAlignment = .center
        return calculationLabel
    }()
    
    lazy var calculateButton: UIButton = {
        let calculateButton = UIButton(primaryAction: secondScreenTransition)
        calculateButton.frame.origin.x = 20
        calculateButton.frame.size = CGSize(width: view.frame.width - 40 , height: 56)
        calculateButton.frame.origin.y = 450
        calculateButton.backgroundColor = .systemBlue
        calculateButton.layer.cornerRadius = 28
        calculateButton.setTitle("расчитать", for: .normal)
        calculateButton.setTitleColor(.white, for: .normal)
        return calculateButton
    }()
    
    lazy var secondScreenTransition = UIAction { _ in
        let vc = SecondViewController()
        vc.delegate = self
        vc.firstNumberField = self.firstNumber
        vc.secondNumberField = self.secondNumber
        
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

