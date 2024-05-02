//
//  ModalTableViewCell.swift
//  5st_hw_YooJaeHyeok
//
//  Created by 유재혁 on 5/1/24.
//

import UIKit

class ModalTableViewCell: UITableViewCell {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "ModalTableViewCell")
        
        setConstraint()
    }
    
    
    
    // 이게 cell에서 쓰일 변수
    let episodeImage : UIImageView = {
        let epiImage = UIImageView()
        epiImage.clipsToBounds = true
        epiImage.translatesAutoresizingMaskIntoConstraints = false
        epiImage.contentMode = .scaleAspectFit //이미지 비율 유지
        return epiImage
    }()
    
    let episodeName : UILabel = {
        let epiName = UILabel()
        epiName.textColor = UIColor.white
        epiName.font = UIFont.systemFont(ofSize: 16, weight: .light)
        epiName.translatesAutoresizingMaskIntoConstraints = false
        return epiName
    }()

    
    let descrip : UILabel = {
        let discrep = UILabel()
        discrep.textColor = UIColor.white
        discrep.font = UIFont.systemFont(ofSize: 16, weight: .light)
        discrep.translatesAutoresizingMaskIntoConstraints = false
        discrep.textColor = .white
        discrep.numberOfLines = 3
        return discrep
    }()
    let runTime : UILabel = {
        let runTime = UILabel()
        runTime.font = UIFont.systemFont(ofSize: 16, weight: .light)
        runTime.translatesAutoresizingMaskIntoConstraints = false
        runTime.textColor = UIColor.lightGray
        return runTime
    }()
    
    
    //        이거 버튼 이미지 넣는거
    let image: UIImageView = {
        let image1 = UIImageView()
        image1.translatesAutoresizingMaskIntoConstraints = false
        image1.image = UIImage(named: "play_search")
        image1.tintColor = .white
        image1.contentMode = .scaleAspectFit
    
        return image1
    }()
    
    
    
    
    // constraint 설정
    func setConstraint(){
        // contentView에 추가. 사진, 글씨, 버튼 전부 contentview에 올려서 만들고 이걸 cell에다가 올려버리는거임
        contentView.addSubview(episodeImage)
        contentView.addSubview(episodeName)
        contentView.addSubview(image)
        contentView.addSubview(runTime)
        contentView.addSubview(descrip)
        
    
        NSLayoutConstraint.activate([
            // movie image constraint 설정
            episodeImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            episodeImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            episodeImage.widthAnchor.constraint(equalToConstant: 178),
            episodeImage.heightAnchor.constraint(equalToConstant: 100),
            
            
            // movie title constraint 설정
            episodeName.centerYAnchor.constraint(equalTo: episodeImage.centerYAnchor, constant: -10),
            episodeName.leadingAnchor.constraint(equalTo: episodeImage.trailingAnchor, constant: 20),
            episodeName.heightAnchor.constraint(equalToConstant: 20),
            
            image.centerYAnchor.constraint(equalTo: episodeImage.centerYAnchor),
            image.centerXAnchor.constraint(equalTo: episodeImage.centerXAnchor),
            
            runTime.topAnchor.constraint(equalTo: episodeName.bottomAnchor),
            runTime.leadingAnchor.constraint(equalTo: episodeName.leadingAnchor),
//            runTime.widthAnchor.constraint(equalToConstant: ),
            
            descrip.topAnchor.constraint(equalTo: episodeImage.bottomAnchor, constant: 15),
            descrip.leadingAnchor.constraint(equalTo: episodeImage.leadingAnchor),
            descrip.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
            
            
            
            
            
        ])
    }
}
