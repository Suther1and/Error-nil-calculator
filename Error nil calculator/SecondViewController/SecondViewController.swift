//
//  SecondViewController.swift
//  Error nil calculator
//
//  Created by Pavel Barto on 25.03.2024.
//

import UIKit

  


class SecondViewController: UIViewController {
    
    
   
    
    
    
    func createCalcButton(label: String, position: CGPoint, size: CGSize, action: UIAction) -> UIButton {
         var calcButton: UIButton = {
             
            let calcButton = UIButton(primaryAction: action)
            calcButton.setTitle(label, for: .normal)
            calcButton.setTitleColor(.white, for: .normal)
            calcButton.frame.origin = position
            calcButton.backgroundColor = .systemBlue
            calcButton.frame.size = size
            calcButton.layer.cornerRadius = size.width / 2
            calcButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
             return calcButton//не совсем тут понял, нужно ли 2 return,  но без них не работает
        }()
        return calcButton
    }
    
    
     
    func createTextField(position: CGRect, placeholder: String) -> UITextField {
        lazy var textField: UITextField = {
            let textField = UITextField()
            textField.frame = position
            textField.placeholder = placeholder
            textField.backgroundColor = .systemGray6
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 1))
            textField.leftViewMode = .always
            return textField
        }()
        return textField
    }
    
    lazy var plusAction = UIAction { _ in
        let firstNumber = self.firstTextField.text ?? ""
        let secondNumber = self.secondTextField.text ?? ""
        let sum = Int(firstNumber + secondNumber)
        self.delegate?.setResulLabel(text: "\(sum)")
        self.navigationController?.popViewController(animated: true)
    }
    lazy var minusAction = UIAction { _ in
        print("minus")
    }
    lazy var divAction = UIAction { _ in
        print("divided")
    }
    lazy var multiAction = UIAction { _ in
        print("multiplied")
    }
    
    
     
     
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Ввести данные"

        let plusButton = createCalcButton(label: "+", position: CGPoint(x: 30, y: 340), size: CGSize(width: 65, height: 65), action: plusAction)
        let minusButton = createCalcButton(label: "-", position: CGPoint(x: 120, y: 340), size: CGSize(width: 65, height: 65), action: minusAction)
        let divButton = createCalcButton(label: "/", position: CGPoint(x: 210, y: 340), size: CGSize(width: 65, height: 65), action: divAction)
        let multiButton = createCalcButton(label: "*", position: CGPoint(x: 300, y: 340), size: CGSize(width: 65, height: 65), action: multiAction)
        let firstTextField = createTextField(position: CGRect(x: view.frame.origin.x + 20, y: 222, width: 162, height: 55), placeholder: "число 1")
        let secondTextField = createTextField(position: CGRect(x: firstTextField.frame.origin.x + 192, y: 222, width: 162, height: 55), placeholder: "число 2")
        
        view.addSubview(plusButton)
        view.addSubview(minusButton)
        view.addSubview(divButton)
        view.addSubview(multiButton)
        view.addSubview(firstTextField)
        view.addSubview(secondTextField)
    } //viewDidLoad
    
     
   
} // UIViewController
