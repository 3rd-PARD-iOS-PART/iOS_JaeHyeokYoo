//
//  ComingTableViewCell.swift
//  5st_hw_YooJaeHyeok
//
//  Created by 유재혁 on 5/1/24.
//

import UIKit


class ComingTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "ComingTableViewCell")
        contentView.backgroundColor = .black
        // contentView에 추가. 사진, 글씨, 버튼 전부 contentview에 올려서 만들고 이걸 cell에다가 올려버리는거임
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//      영화사진
    let movieImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill    // 이미지 비율 유지
        return image
    }()
//     개봉날짜
    let Date: UILabel = {
        let date = UILabel()
        date.textColor = UIColor.white
        date.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()
    // 제목
    let Title: UILabel = {
        let title = UILabel()
        title.textColor = UIColor.white
        title.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
//    구체적 설명
    let explain: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.lineBreakMode = .byTruncatingTail
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
//    장르들
    let genre: UILabel = {
        let genres = UILabel()
        genres.textColor = UIColor.white
        genres.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        genres.translatesAutoresizingMaskIntoConstraints = false
        return genres
    }()
//    종모양
    let remind: UIImageView = {
        let reminds = UIImageView()
        reminds.clipsToBounds = true
        reminds.translatesAutoresizingMaskIntoConstraints = false
        reminds.image = UIImage(named: "ring")
        reminds.contentMode = .scaleAspectFill
        
        return reminds
    }()
//    share버튼
        let share: UIImageView = {
            let shares = UIImageView()
            shares.clipsToBounds = true
            shares.translatesAutoresizingMaskIntoConstraints = false
            shares.image = UIImage(named: "share")
            shares.contentMode = .scaleAspectFill
            return shares
        }()
    
    
    // constraint 설정
    func setConstraint() {
        contentView.addSubview(movieImage)
        contentView.addSubview(Date)
        contentView.addSubview(Title)
        contentView.addSubview(explain)
        contentView.addSubview(genre)
        contentView.addSubview(remind)
        contentView.addSubview(share)
        
        
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieImage.heightAnchor.constraint(equalToConstant: 100),
            movieImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),

            remind.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 10),
            remind.trailingAnchor.constraint(equalTo: share.trailingAnchor, constant: -75),
            
            share.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 10),
            share.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            Date.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 65),
            Date.leadingAnchor.constraint(equalTo: movieImage.leadingAnchor, constant: 0),
            Date.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            Date.heightAnchor.constraint(equalToConstant: 10),
            
            Title.topAnchor.constraint(equalTo: Date.bottomAnchor, constant: 12),
            Title.leadingAnchor.constraint(equalTo: Date.leadingAnchor),
            Title.trailingAnchor.constraint(equalTo: Date.trailingAnchor),
            Title.heightAnchor.constraint(equalToConstant: 20),
            
            explain.topAnchor.constraint(equalTo: Title.bottomAnchor, constant: 12),
            explain.leadingAnchor.constraint(equalTo: Title.leadingAnchor),
            explain.trailingAnchor.constraint(equalTo: Title.trailingAnchor),
            explain.heightAnchor.constraint(equalToConstant: 40),
            
            genre.topAnchor.constraint(equalTo: explain.bottomAnchor, constant: 10),
            genre.leadingAnchor.constraint(equalTo: explain.leadingAnchor),
            genre.trailingAnchor.constraint(equalTo: explain.trailingAnchor),
            genre.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            genre.heightAnchor.constraint(equalToConstant: 15),
        ])
    }
}
