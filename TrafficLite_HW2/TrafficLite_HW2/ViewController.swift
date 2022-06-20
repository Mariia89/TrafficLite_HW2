//
//  ViewController.swift
//  TrafficLite_HW2
//
//  Created by Мария Чудакова on 19.06.2022.
//

import UIKit

enum TrafficLightState {
    case red
    case yellow
    case green
    case none
}

class ViewController: UIViewController {
    @IBOutlet var startButton: UIButton!
    @IBOutlet var redCircle: UIView!
    @IBOutlet var greenCircle: UIView!
    @IBOutlet var yellowCircle: UIView!
    
    var state: TrafficLightState = .none
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        redCircle.layer.cornerRadius = 63
        yellowCircle.layer.cornerRadius = 63
        greenCircle.layer.cornerRadius = 63
        startButton.layer.cornerRadius = 10
    }

    @IBAction func buttonTapped(_: Any) {
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.title = "Next"
        buttonConfiguration.baseBackgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        buttonConfiguration.buttonSize = .large
        buttonConfiguration.cornerStyle = .large
        buttonConfiguration.attributedTitle?.font = UIFont.systemFont(ofSize: 24)

        redCircle.alpha = 1
        greenCircle.alpha = 0.1
        yellowCircle.alpha = 0.1
        
        switch state {
        case .red:
            state = .green
            redCircle.alpha = 0.1
            greenCircle.alpha = 1
            yellowCircle.alpha = 0.1
        case .yellow:
            state = .red
            redCircle.alpha = 1
            greenCircle.alpha = 0.1
            yellowCircle.alpha = 0.1
        case .green:
            state = .yellow
            redCircle.alpha = 0.1
            greenCircle.alpha = 0.1
            yellowCircle.alpha = 1
        case .none:
            state = .red
            redCircle.alpha = 1
            greenCircle.alpha = 0.1
            yellowCircle.alpha = 0.1
        }
        
        startButton.configuration = buttonConfiguration
    }
        
}

