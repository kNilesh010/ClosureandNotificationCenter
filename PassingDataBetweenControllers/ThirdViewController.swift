//
//  ThirdViewController.swift
//  ThirdViewController
//
//  Created by Nilesh Kumar on 03/04/22.
//

import UIKit

class ThirdViewController: UIViewController {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Name: "
        return label
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.backgroundColor = .systemBackground
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapAdd), for: .touchUpInside)
        return button
    }()
    
    @objc func didTapAdd(){
        print("Button Tapped")
        let vc = EnterNameViewController()
        vc.completion = {[weak self] text in
            DispatchQueue.main.async {
                self?.nameLabel.text = text
            }
        }
        vc.title = "Add Name"
        present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
    
    var observer: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        view.addSubview(nameLabel)
        view.addSubview(addButton)
        
       observer = NotificationCenter.default.addObserver(forName: Notification.Name("MyCustomNotification"), object: nil, queue: .main) {[weak self] notification in
           guard let object = notification.object as? [String: UIColor] else {return}
           guard let color = object["colors"] else {return}
           self?.view.backgroundColor = color
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let size = view.bounds.width / 2
        nameLabel.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 50, width: view.bounds.size.width - 40, height: 100)
        addButton.frame = CGRect(x: 20, y: ( size) / 2, width: size, height: size)
        addButton.center = view.center
    }
    


}
