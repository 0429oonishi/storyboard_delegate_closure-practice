//
//  ThirdViewController.swift
//  SampleStoryboard
//
//  Created by 大西玲音 on 2021/03/17.
//

import UIKit

final class ThirdViewController: UIViewController {

    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var backButton: UIButton!
    
    var closure: ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        backButton.isEnabled = false
        backButton.layer.opacity = 0.6
    }
    
    @IBAction private func backButtonDidTapped(_ sender: Any) {
        guard let text = textField.text else { return }
        closure?(text)
        dismiss(animated: true, completion: nil)
    }
    
}

extension ThirdViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let isTextFieldEmpty = self.textField.text?.isEmpty else { return }
        if isTextFieldEmpty {
            backButton.isEnabled = false
            backButton.layer.opacity = 0.6
        } else {
            backButton.isEnabled = true
            backButton.layer.opacity = 1
        }
    }
}
