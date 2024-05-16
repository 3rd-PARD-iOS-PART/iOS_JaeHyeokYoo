////
////  CollectionView.swift
////  6st_hw_YooJaeHyeok
////
////  Created by 유재혁 on 5/16/24.
////
//
//class CollectionView: UITableViewCell {
//    private var sectionNumber : Int?
//    
//    static let identifier = "CollectionView"
//    
//    //collection view 기본 구성을 설정. 안에 들어갈 크기도 정하고, 수평으로도 바꾸고..
//    let collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 110, height: 170)
//        layout.scrollDirection = .horizontal
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout:  layout)
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionView")
//        collectionView.backgroundColor = UIColor.black
//        return collectionView
//    }()
//    
//    func getSectionNumber(number : Int) {
//        sectionNumber = number
//    }
//    
//    
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.backgroundColor = .black
//        contentView.addSubview(collectionView)
//        
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        collectionView.frame = contentView.bounds
//    }
//    
//    
//}
//
//extension CollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionView", for: indexPath)
//        cell.backgroundColor = .green
//        
////        let imageName = MockData.modeling[indexPath.section]
//        
//        let imageName = MockData.modeling[sectionNumber ?? 0][indexPath.row].Name
////        cell.imageView?.image = UIImage(named: imageName)
//        
//            
//        let imageView = UIImageView(image: UIImage(named: imageName))
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFill
//        cell.contentView.addSubview(imageView)
//        
//        
//        
//        
//        NSLayoutConstraint.activate([
//            imageView.topAnchor.constraint(equalTo: cell.topAnchor),
//            imageView.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
//            imageView.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
//            imageView.bottomAnchor.constraint(equalTo: cell.bottomAnchor)
//        ])
//        
//        
//        
////        func configure(with data: MockData) {
////            CollectionViewTableViewCell.image = UIImage(named: data.Name)
////        }
//        
//        return cell
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return MockData.modeling[section].count
//    }
//}
