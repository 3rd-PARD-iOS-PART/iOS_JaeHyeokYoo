//
//  DemoCell.swift
//  3.1st_hw_YooJaeHyeok
//
//  Created by 유재혁 on 4/4/24.
//

import UIKit

class DemoCell: UITableViewCell {
    let image = UIImageView()
    let label = UILabel()
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "Cell")
        contentView.addSubview(label)
        contentView.addSubview(image)
    }
    
    func setLabel(){
        label.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
}

