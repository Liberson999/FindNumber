//
//  ViewController.swift
//  FindNumber
//
//  Created by Евгений Бурнос on 08.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var nextDigit: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    lazy var game = Game(countItems: buttons.count)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupScreen()
    }

    @IBAction func pressButton(_ sender: UIButton) {
        guard let buttonsIndex = buttons.firstIndex(of: sender) else {return}
        game.check(index:buttonsIndex)
        
        updateUI()
        
    }
    
    private func setupScreen() {
        
        for index in game.items.indices {
            buttons[index].setTitle(game.items[index].title, for: .normal)
            buttons[index].isHidden = false
        }
        
        nextDigit.text = game.nextItem?.title
        
        
    }
    
    private func updateUI() {
        for index in game.items.indices {
            buttons[index].isHidden = game.items[index].isFound
        }
        nextDigit.text = game.nextItem?.title
        
        if game.status == .win {
            statusLabel.text = "Вы выигралии!!"
            statusLabel.textColor = .green
        }
    }
    
}

