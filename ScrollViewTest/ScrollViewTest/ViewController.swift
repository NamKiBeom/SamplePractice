//
//  ViewController.swift
//  ScrollViewTest
//
//  Created by 남기범 on 2021/09/27.
//

import UIKit

class ViewController: UIViewController {
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.setTitle("next", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func buttonAction() {
        let viewController = NextViewController()
        viewController.modalPresentationStyle = .overFullScreen
        present(viewController, animated: true, completion: nil)
    }
}

