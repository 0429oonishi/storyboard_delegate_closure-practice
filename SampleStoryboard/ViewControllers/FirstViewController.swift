//
//  FirstViewController.swift
//  SampleStoryboard
//
//  Created by 大西玲音 on 2021/03/17.
//

import UIKit

final class FirstViewController: UIViewController {
    
    @IBOutlet private weak var label: UILabel!
    
    private let showSecondVCID = "showSecondVCID"
    private let showThirdVCID = "showThirdVCID"
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showSecondVCID {
            let secondVC = segue.destination as? SecondViewController
            secondVC?.delegate = self
        } else if segue.identifier == showThirdVCID {
            let thirdVC = segue.destination as? ThirdViewController
            thirdVC?.closure = { text in
                self.label.text = text
            }
        }
    }
    
    @IBAction private func goSecondButtonDidTapped(_ sender: Any) {
        performSegue(withIdentifier: showSecondVCID, sender: nil)
    }
    
    @IBAction private func goThirdButtonDidTapped(_ sender: Any) {
        performSegue(withIdentifier: showThirdVCID, sender: nil)
    }
    
}

extension FirstViewController: SecondVCDelegate {
    func passTextToFirstVC(_ text: String) {
        label.text = text
    }
}


