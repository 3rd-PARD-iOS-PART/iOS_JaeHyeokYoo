//
//  FourthViewController.swift
//  3st_hw_YooJaeHyeok
//
//  Created by 유재혁 on 4/1/24.
//

import UIKit


class FourthViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        setUI()
    }
    
    func setUI(){
        let image: UIImageView = {
            let image1 = UIImageView()
            image1.translatesAutoresizingMaskIntoConstraints = false
            image1.image = UIImage(named: "Download Page")
            image1.tintColor = .white
            image1.contentMode = .scaleAspectFit
            return image1
        }()
        
        
        let Label: UILabel = {
            let label1 = UILabel()
            label1.translatesAutoresizingMaskIntoConstraints = false
            label1.text = ("Movies and TV shows that you \n download appear here.")
            label1.font = UIFont.systemFont(ofSize: 22, weight: .regular)
            label1.numberOfLines = 2        // 두줄로 나타나게 설정
            label1.textAlignment = .center // 텍스트 위치 중앙
            label1.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            return label1
        }()
        
        let button1: UIButton = {
            var configuration = UIButton.Configuration.filled()
                    configuration.background.backgroundColor = UIColor.white
                    configuration.attributedTitle = AttributedString("Find something to Download", attributes: AttributeContainer([
                        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15.0, weight: .semibold),
                        NSAttributedString.Key.foregroundColor: UIColor.black
                     ])
                 )
                 configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                 
                 let btnPlay = UIButton(configuration: configuration)
            
            btnPlay.translatesAutoresizingMaskIntoConstraints = false
            return btnPlay
        }()
        
        
        
        view.addSubview(image)
        view.addSubview(Label)
        view.addSubview(button1)
        
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            image.widthAnchor.constraint(equalToConstant: 190),
            image.heightAnchor.constraint(equalToConstant: 190),
            
            Label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 30),
            Label.widthAnchor.constraint(equalToConstant: 300),
            
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.topAnchor.constraint(equalTo: Label.bottomAnchor, constant: 150),
            button1.widthAnchor.constraint(equalToConstant: 300),
            button1.heightAnchor.constraint(equalToConstant: 45)
            
        ])
    }
}



