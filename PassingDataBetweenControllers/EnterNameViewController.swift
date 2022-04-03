//
//  EnterNameViewController.swift
//  EnterNameViewController
//
//  Created by Nilesh Kumar on 03/04/22.
//

import UIKit

class EnterNameViewController: UIViewController {
    
    public var completion: ((String) -> Void)?
    
    private let myTextField: UITextField = {
        let textfield = UITextField()
        textfield.textAlignment = .center
        textfield.becomeFirstResponder()
        textfield.placeholder = "Enter name"
        textfield.autocorrectionType = .no
        textfield.autocapitalizationType = .none
        textfield.layer.borderWidth = 1.0
        textfield.layer.borderColor = UIColor.black.cgColor
        return textfield
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDone))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didTapCancel))
        
        view.addSubview(myTextField)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myTextField.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 50, width: 200, height: 50)
        myTextField.center = view.center
    }
    
    @objc func didTapDone(){
        guard let text = myTextField.text, !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {return}
        completion?(text)
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapCancel(){
        dismiss(animated: true, completion: nil)
    }

}
