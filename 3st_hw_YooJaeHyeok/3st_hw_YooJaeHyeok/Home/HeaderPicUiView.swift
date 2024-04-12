//
//  HeaderPicUiView.swift
//  3st_hw_YooJaeHyeok
//
//  Created by 유재혁 on 4/4/24.
//

import UIKit

class HeaderPicUiView: UIView {

    //netflix 이미지 생성
    let netflixlogoimage: UIImageView = {
        let netfliximage = UIImageView(image: UIImage(named: "netflixLogo"))
        netfliximage.translatesAutoresizingMaskIntoConstraints = false
        netfliximage.contentMode = .scaleAspectFit
        netfliximage.backgroundColor = .clear
        return netfliximage
    }()
    
    //tvshows 버튼 생성
    let tvShows: UIButton = {
        let tvbutton = UIButton(type: .system)
        tvbutton.setTitle("TV Shows", for: .normal)
        tvbutton.translatesAutoresizingMaskIntoConstraints = false
        tvbutton.setTitleColor(.white, for: .normal)
        tvbutton.backgroundColor = .clear
        return tvbutton
    }()
    
    //movie 버튼 생성
    let Movies: UIButton = {
        let moviebutton = UIButton(type: .system)
        moviebutton.translatesAutoresizingMaskIntoConstraints = false
        moviebutton.setTitle("Movies", for: .normal)
        moviebutton.setTitleColor(.white, for: .normal)
        moviebutton.backgroundColor = .clear
        return moviebutton
    }()
    
    //mylist버튼 생성
    let Mylist: UIButton = {
        let Mylistbutton = UIButton(type: .system)
        Mylistbutton.translatesAutoresizingMaskIntoConstraints = false
        Mylistbutton.setTitle("My List", for: .normal)
        Mylistbutton.setTitleColor(.white, for: .normal)
        Mylistbutton.backgroundColor = .clear
        return Mylistbutton
    }()
    
    
    
    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "movie12")
        return imageView
    }()

    
    // 이 함수는 사진을 흐리게 cg넣어주는 효과..
//    private func addGradient() {
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [
//            UIColor.clear.cgColor,
//            UIColor.systemBackground.cgColor
//        ]
//        gradientLayer.frame = bounds
//        layer.addSublayer(gradientLayer)
//    }
    
    
    
        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(headerImageView)
  //          addGradient()   // 위에서 만든 함수 호출
            addSubview(netflixlogoimage)
            addSubview(tvShows)
            addSubview(Movies)
            addSubview(Mylist)
            applyConstraints()
        }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
                    
            netflixlogoimage.topAnchor.constraint(equalTo: topAnchor, constant: 55),
            netflixlogoimage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            netflixlogoimage.widthAnchor.constraint(equalToConstant: 50),
            netflixlogoimage.heightAnchor.constraint(equalToConstant: 50),
                   
            tvShows.centerYAnchor.constraint(equalTo: netflixlogoimage.centerYAnchor),
            tvShows.trailingAnchor.constraint(equalTo: Movies.leadingAnchor, constant:  -50),
                   
            Movies.centerYAnchor.constraint(equalTo: netflixlogoimage.centerYAnchor),
            Movies.trailingAnchor.constraint(equalTo: Mylist.leadingAnchor, constant: -45),
                   
            Mylist.centerYAnchor.constraint(equalTo: netflixlogoimage.centerYAnchor),
            Mylist.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
                ])
    }
    
    
    
    

        override func layoutSubviews() {
            super.layoutSubviews()
            headerImageView.frame = bounds
        }

        required init?(coder: NSCoder) {
            fatalError()
        }
    }

