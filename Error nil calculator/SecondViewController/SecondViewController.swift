//
//  SecondViewController.swift
//  Error nil calculator
//
//  Created by Pavel Barto on 25.03.2024.
//

import UIKit

  


class SecondViewController: UIViewController {
    
    
    var delegate: ViewControllerDelegate?
    
    var firstNumberField: String?
    var secondNumberField: String?

    func createCalcButton(label: String, position: CGPoint, size: CGSize, action: UIAction) -> UIButton {
         {
            let calcButton = UIButton(primaryAction: action)
            calcButton.setTitle(label, for: .normal)
            calcButton.setTitleColor(.white, for: .normal)
            calcButton.frame.origin = position
            calcButton.backgroundColor = .systemBlue
            calcButton.frame.size = size
            calcButton.layer.cornerRadius = size.width / 2
            calcButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
             return calcButton
        }()
    }
    
    
     
    func createTextField(position: CGRect, placeholder: String) -> UITextField {
         {
            let textField = UITextField()
            textField.frame = position
            textField.placeholder = placeholder
            textField.backgroundColor = .systemGray6
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 1))
            textField.leftViewMode = .always
            return textField
        }()
    }
    
    lazy var firstTextField = createTextField(position: CGRect(x: view.frame.origin.x + 20, y: 222, width: 162, height: 55), placeholder: "число 1")
    lazy var secondTextField = createTextField(position: CGRect(x: firstTextField.frame.origin.x + 192, y: 222, width: 162, height: 55), placeholder: "число 2")
    
    lazy var cannotDivideLabel: UILabel = {
        let cannotDivideLabel = UILabel()
        cannotDivideLabel.text = ""
        cannotDivideLabel.textAlignment = .center
        cannotDivideLabel.frame.size = CGSize(width: view.frame.width - 40, height: 112)
        cannotDivideLabel.center.x = view.center.x
        cannotDivideLabel.frame.origin.y = 450
        cannotDivideLabel.font = UIFont.systemFont(ofSize: 30)
        return cannotDivideLabel

    }()
   
    
    lazy var plusAction = UIAction { _ in
        let firstNumber = self.firstTextField.text ?? "0"
        let secondNumber = self.secondTextField.text ?? "0"
        let result = (Double(firstNumber) ?? 0) + (Double(secondNumber) ?? 0)
        self.navigationController?.popViewController(animated: true)
        self.delegate?.setResulLabel(text: firstNumber + " + " + secondNumber + " = \(result)")
        self.delegate?.getFirstNumber(firstNumberText: firstNumber)
        self.delegate?.getSecondNumber(secondNumberText: secondNumber)
    }
    lazy var minusAction = UIAction { _ in
        let firstNumber = self.firstTextField.text ?? "0"
        let secondNumber = self.secondTextField.text ?? "0"
        let result = (Double(firstNumber) ?? 0) - (Double(secondNumber) ?? 0)
        self.navigationController?.popViewController(animated: true)
        self.delegate?.setResulLabel(text: firstNumber + " - " + secondNumber + " = \(result)")
        self.delegate?.getFirstNumber(firstNumberText: firstNumber)
        self.delegate?.getSecondNumber(secondNumberText: secondNumber)
    }
    lazy var divAction = UIAction { _ in
        let firstNumber = self.firstTextField.text ?? "0"
        let secondNumber = self.secondTextField.text ?? "0"
        if Double(secondNumber) == 0 {
            self.cannotDivideLabel.text = "На 0 делить нельзя!"
        }else{
            let result = (Double(firstNumber) ?? 0) / (Double(secondNumber) ?? 0)
            let roundedResult = round(result * 10000) / 10000
            self.navigationController?.popViewController(animated: true)
            self.delegate?.setResulLabel(text: firstNumber + " / " + secondNumber + " = \(roundedResult)")
            self.delegate?.getFirstNumber(firstNumberText: firstNumber)
            self.delegate?.getSecondNumber(secondNumberText: secondNumber)
            
        }
    }
    lazy var multiAction = UIAction { _ in
        let firstNumber = self.firstTextField.text ?? "0"
        let secondNumber = self.secondTextField.text ?? "0"
        let result = (Double(firstNumber) ?? 0 ) * (Double(secondNumber) ?? 0)
        self.navigationController?.popViewController(animated: true)
        self.delegate?.setResulLabel(text: firstNumber + " * " + secondNumber + " = \(result)")
        self.delegate?.getFirstNumber(firstNumberText: firstNumber)
        self.delegate?.getSecondNumber(secondNumberText: secondNumber)
    }
    
    
    
     
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Ввести данные"

        firstTextField.text = firstNumberField
        secondTextField.text = secondNumberField
        
        let plusButton = createCalcButton(label: "+", position: CGPoint(x: 30, y: 340), size: CGSize(width: 65, height: 65), action: plusAction)
        let minusButton = createCalcButton(label: "-", position: CGPoint(x: 120, y: 340), size: CGSize(width: 65, height: 65), action: minusAction)
        let divButton = createCalcButton(label: "/", position: CGPoint(x: 210, y: 340), size: CGSize(width: 65, height: 65), action: divAction)
        let multiButton = createCalcButton(label: "*", position: CGPoint(x: 300, y: 340), size: CGSize(width: 65, height: 65), action: multiAction)
     
        
        view.addSubview(plusButton)
        view.addSubview(minusButton)
        view.addSubview(divButton)
        view.addSubview(multiButton)
        view.addSubview(firstTextField)
        view.addSubview(secondTextField)
        view.addSubview(cannotDivideLabel)
        
        
    } //viewDidLoad
    
     
   
} // UIViewController
