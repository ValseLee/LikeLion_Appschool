//
//  ViewController.swift
//  HelloiOS
//
//  Created by 이승준 on 2022/10/13.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let speakSynth = AVSpeechSynthesizer()
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        let str = mainTextField.text ?? "Hello World"
        
        mainLabel.text = str
        let utterance = AVSpeechUtterance(string: str)
        speakSynth.speak(utterance)
    }
}

