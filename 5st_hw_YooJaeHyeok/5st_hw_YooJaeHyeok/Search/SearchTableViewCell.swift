//
//  SearchTableViewCell.swift
//  5st_hw_YooJaeHyeok
//
//  Created by 유재혁 on 5/1/24.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    // 이게 cell에서 쓰일 변수
    let movieImage = UIImageView()
    let movieTitle = UILabel()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "SearchTableViewCell")
        
        // contentView에 추가. 사진, 글씨, 버튼 전부 contentview에 올려서 만들고 이걸 cell에다가 올려버리는거임
        contentView.addSubview(movieImage)
        contentView.addSubview(movieTitle)
        setConstraint()
    }
    
    // constraint 설정
    func setConstraint(){
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // movie image constraint 설정
            movieImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            movieImage.widthAnchor.constraint(equalToConstant: 144),
            
            // movie title constraint 설정
            movieTitle.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieTitle.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 20),
            movieTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
