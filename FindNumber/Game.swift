//
//  Game.swift
//  FindNumber
//
//  Created by Евгений Бурнос on 08.11.2022.
//

import Foundation

enum StatusGame {
    case start
    case win
}

class Game {
    
    struct Item {
        var title: String
        var isFound:Bool = false
        
    }
    
    private let data = Array(1...99)
    
    public var items:[Item] = []
    
    public var countItems: Int
    
    var nextItem:Item?
    
    var status:StatusGame = .start
    
    init(countItems: Int) {
        self.countItems = countItems
        setupGame()
    }
    
    private func setupGame() {
        var digits = data.shuffled()
        
        while items.count < countItems {
            let item = Item(title: String(digits.removeFirst()))
            items.append(item)
        }
        
        nextItem = items.shuffled().first
    }
    
    func check(index:Int) {
        if items[index].title == nextItem?.title {
            items[index].isFound = true
            nextItem = items.shuffled().first(where: {(item) -> Bool in
                item.isFound == false
            })
        }
        if nextItem == nil {
            status = .win
        }
        
    }
    
}
