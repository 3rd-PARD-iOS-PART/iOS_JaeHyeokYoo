//
//  MoreViewController.swift
//  3.1st_hw_YooJaeHyeok
//
//  Created by 유재혁 on 4/4/24.
//

import UIKit


class MoreViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        setUI()
    }
    
    func setUI(){
        let imageSize = UIImage.SymbolConfiguration(pointSize: 50, weight: .light)
        let image: UIImageView = {
            let image1 = UIImageView()
            image1.translatesAutoresizingMaskIntoConstraints = false
            image1.image = UIImage(systemName: "figure.surfing", withConfiguration: imageSize)
            image1.tintColor = .white
            image1.contentMode = .scaleAspectFit
            return image1
        }()
        
        view.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            image.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}



