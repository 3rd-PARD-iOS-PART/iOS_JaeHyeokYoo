//
//  SearchViewController.swift
//  3.1st_hw_YooJaeHyeok
//
//  Created by 유재혁 on 4/4/24.
//

import UIKit


class SearchViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        setUI()
    }
    
    func setUI(){
        
        let label2: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "SUN"
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
            return label
        }()
        
        view.addSubview(label2)
        
        
        NSLayoutConstraint.activate([
            label2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}


