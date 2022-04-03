//
//  FourthViewController.swift
//  FourthViewController
//
//  Created by Nilesh Kumar on 03/04/22.
//

import UIKit

class FourthViewController: UIViewController {

    private let tapButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tap Me", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapAdd), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    @objc func didTapAdd(){
        NotificationCenter.default.post(name: Notification.Name("MyCustomNotification"), object: ["colors": UIColor.blue])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tapButton)
        view.backgroundColor = .systemBackground
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tapButton.frame = CGRect(x: 20, y: view.safeAreaInsets.top, width: 200, height: 50)
        tapButton.center = view.center
    }
    
}
