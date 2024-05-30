//
//  ViewController.swift
//  Counter
//
//  Created by Owi Lover on 5/26/24.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var counterUILabel: UILabel!
    
    @IBOutlet private weak var buttonPlusUIButton: UIButton!
    
    @IBOutlet private weak var buttonMinusUIButton: UIButton!
    
    @IBOutlet private weak var buttonResetUIButton: UIButton!
    
    @IBOutlet private weak var historyUITextView: UITextView!
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterUILabel.text = "0"
        counterUILabel.font = .boldSystemFont(ofSize: 28)
        
        historyUITextView.text = "История изменений:\n"
        
        buttonPlusUIButton.tintColor = .red
        
        buttonMinusUIButton.tintColor = .blue
    }
    
    private func counterCheck() -> Int? {
        guard let count = Int(counterUILabel.text ?? "0") else {
            historyUITextView.text += "\(dateFormatter.string(from: Date())): упс, что-то пошло не так!\n"
            return nil
        }
        return count
    }
        
    @IBAction private func buttonPlusTouchUpInside(_ sender: Any) {
        if let count = counterCheck() {
            historyUITextView.text += "\(dateFormatter.string(from: Date())): значение изменено на +1\n"
            
            counterUILabel.text = String(count+1)
        }
    }
    
    @IBAction private func buttonMinusTouchUpInside(_ sender: Any) {
        if let count = counterCheck() {
            if (count - 1 >= 0) {
                historyUITextView.text += "\(dateFormatter.string(from: Date())): значение изменено на -1\n"
                
                counterUILabel.text = String(count-1)
            }
            else {
                historyUITextView.text += "\(dateFormatter.string(from: Date())): попытка уменьшить значение счётчика ниже 0\n"
            }
        }
    }
    
    @IBAction private func resetButtonTouchUpInside(_ sender: Any) {
        counterUILabel.text = "0"
        
        historyUITextView.text += "\(dateFormatter.string(from: Date())): значение сброшено\n"
    }
}

