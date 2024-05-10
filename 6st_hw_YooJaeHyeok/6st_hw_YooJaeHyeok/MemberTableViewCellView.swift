//
//  MemberTableViewCellView.swift
//  6st_hw_YooJaeHyeok
//
//  Created by 유재혁 on 5/9/24.
//
//일단 복붙해본 cell입니다.
import UIKit

class MemberTableViewCellView: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "Cell")
        setupUI()    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var partLabel: UILabel! = {
        var label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var nameLabel: UILabel! = {
        var label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupUI() {
        self.backgroundColor = UIColor.white
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(partLabel)
        
        NSLayoutConstraint.activate([
            partLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            partLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: partLabel.leadingAnchor, constant: 90),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(with memo: MemoModel) {
        print("configure 실행")
        partLabel.text = "[\(memo.part)]"
        nameLabel.text = memo.name
    }
}
