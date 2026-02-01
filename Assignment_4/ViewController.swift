//
//  ViewController.swift
//  Assignment_4
//
//  Created by Jeremy Douds on 2/1/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moodLabel:  UILabel!
    @IBOutlet weak var savedEntryLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var moodSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        savedEntryLabel.numberOfLines = 0
        
        updateMoodUI(for: Int(moodSlider.value))
        savedEntryLabel.text = ""
    }
    @IBAction func sliderChanged(_ sender: UISlider) {
        let moodValue =  Int(sender.value.rounded())
        sender.value = Float(moodValue)
        updateMoodUI(for: moodValue)
    }
    @IBAction func saveMoodTapped(_ sender: UIButton) {
        let moodValue = Int(moodSlider.value)
        let mood = moodDescriptionAndEmoji(for: moodValue)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d"
        
        let dateText = formatter.string(from: datePicker.date)
        savedEntryLabel.text = "On \(dateText), you felt \(mood.emoji)"
    }
    private func updateMoodUI(for value : Int) {
        let mood = moodDescriptionAndEmoji(for : value)
        moodLabel.text = "\(mood.description) \(mood.emoji) (\(value))"
    }
    private func moodDescriptionAndEmoji(for value : Int) -> (description : String, emoji : String) {
        switch value {
        case 0...20:
            return ("Very Sad", "😢")
        case 21...40:
            return ("Sad", "🙁")
        case 41...60:
            return ("Neutral", "😐")
        case 61...80:
            return ("Happy", "🙂")
        case 81...100:
            return ("Very Happy", "😄")
            
        default:
            return ("Neutral","😐")
        }
    }
    
}

