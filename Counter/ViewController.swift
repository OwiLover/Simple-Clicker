//
//  ViewController.swift
//  Counter
//
//  Created by Owi Lover on 5/26/24.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var CounterUILabel: UILabel!
    
    @IBOutlet weak var ButtonPlusUIButton: UIButton!
    
    @IBOutlet weak var ButtonMinusUIButton: UIButton!
    
    @IBOutlet weak var ButtonResetUIButton: UIButton!
    
    @IBOutlet weak var HistoryUITextView: UITextView!
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    private func CounterCheck() -> Int? {
        guard let count = Int(CounterUILabel.text ?? "0") else {
            HistoryUITextView.text += "\(dateFormatter.string(from: Date())): упс, что-то пошло не так!\n"
            return nil
        }
        return count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CounterUILabel.text = "0"
        CounterUILabel.font = .boldSystemFont(ofSize: 28)
        
        HistoryUITextView.text = "История изменений:\n"
        
        ButtonPlusUIButton.tintColor = .red
        
        ButtonMinusUIButton.tintColor = .blue
    }
    
    @IBAction func ButtonPlusTouchUpInside(_ sender: Any) {
        if let count = CounterCheck() {
            HistoryUITextView.text += "\(dateFormatter.string(from: Date())): значение изменено на +1\n"
            
            CounterUILabel.text = String(count+1)
        }
    }
    
    @IBAction func ButtonMinusTouchUpInside(_ sender: Any) {
        if let count = CounterCheck() {
            if (count - 1 >= 0) {
                HistoryUITextView.text += "\(dateFormatter.string(from: Date())): значение изменено на -1\n"
                
                CounterUILabel.text = String(count-1)
            }
            else {
                HistoryUITextView.text += "\(dateFormatter.string(from: Date())): попытка уменьшить значение счётчика ниже 0\n"
            }
        }
    }
    
    @IBAction func ResetButtonTouchUpInside(_ sender: Any) {
        CounterUILabel.text = "0"
        
        HistoryUITextView.text += "\(dateFormatter.string(from: Date())): значение сброшено\n"
    }
}

