//
//  SecondViewController.swift
//  SecondViewController
//
//  Created by Nilesh Kumar on 03/04/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    private var selectedItem: String
    private var itemsList: [String]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let label = UILabel(frame: view.bounds)
        
        label.textAlignment = .center
        label.numberOfLines = 0
        view.addSubview(label)
        
        for items in itemsList {
            label.text = (label.text ?? "") + " " + items
        }
        
    }
    
    init(selectedItem: String, itemsList: [String]){
        self.selectedItem = selectedItem
        self.itemsList = itemsList
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
