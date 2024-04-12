//
//  SecondViewController.swift
//  3st_hw_YooJaeHyeok
//
//  Created by 유재혁 on 4/1/24.
//

import UIKit

class SecondViewController: UIViewController{
    
    // tableview 생성
    let tableViewUI1: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)  //header 안올라가게
//        tableView.backgroundColor = .blue
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.contentInsetAdjustmentBehavior = .never
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        
        return tableView
    }()
    
    // viewDidload 함수에 실행시킬 함수들 집어넣기
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        tableViewUI1.dataSource = self
        tableViewUI1.delegate = self
        setUI()
    }
    
    func setUI(){
        let searchBar = UISearchBar()
            searchBar.placeholder = "Search for a show, movie, genre, e.t.c."
            searchBar.searchBarStyle = .minimal
            searchBar.searchTextField.backgroundColor = .darkGray
            searchBar.searchTextField.textColor = .lightGray
            searchBar.searchTextField.leftView?.tintColor = .lightGray    // 이 부분이 서치바 왼쪽에 있는 저 돋보기 부분 색
            searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search for a show, movie, genre, e.t.c.", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]) // 이 부분 안에 글 색상
            searchBar.searchTextField.layer.cornerRadius = 5
            searchBar.searchTextField.clipsToBounds = true
            searchBar.layer.borderWidth = 0
            searchBar.layer.borderColor = .none
            searchBar.setImage(UIImage(named: "voice"), for: .clear, state: .normal) // 검색창 누르면 보이스버튼 나옴
            navigationItem.titleView = searchBar
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.backgroundColor = .black
            navigationController?.navigationBar.standardAppearance = navigationBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        
        view.addSubview(tableViewUI1)
        
        tableViewUI1.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
        tableViewUI1.backgroundColor = .black
        
        NSLayoutConstraint.activate([
            
            tableViewUI1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableViewUI1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableViewUI1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableViewUI1.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        

    }
}



extension SecondViewController: UITableViewDataSource, UITableViewDelegate{
    
    
    //이거 datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MockDataSearch.modeling[section].count
    }
    
    // 얘는 정체가 뭐지.? 일단 이걸로 간격을 만들긴 했음...
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            let verticalPadding: CGFloat = 5
            let maskLayer = CALayer()
            maskLayer.backgroundColor = UIColor.black.cgColor
            maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
            cell.layer.mask = maskLayer
        }
    
    
    //이거 datasource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewUI1.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        
        cell.movieTitle.text = MockDataSearch.modeling[indexPath.section][indexPath.row].title2
        cell.movieTitle.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        cell.movieTitle.textColor = .white
      
        
        let imageName = MockDataSearch.modeling[indexPath.section][indexPath.row].name2
        cell.movieImage.image = UIImage(named: imageName)
        
        // cell constraint 설정
//        cell.setConstraint()

        
        cell.backgroundColor = #colorLiteral(red: 0.2624637187, green: 0.2624637187, blue: 0.2624637187, alpha: 1)
        
        //        이거 버튼 이미지 넣는거
        let image: UIImageView = {
            let image1 = UIImageView()
            image1.translatesAutoresizingMaskIntoConstraints = false
            image1.image = UIImage(named: "play_search")
            image1.tintColor = .white
            image1.contentMode = .scaleAspectFit
            return image1
        }()
        
        cell.contentView.addSubview(image)
        
        NSLayoutConstraint.activate([
            
            image.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
            image.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -8),
        ])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return MockDataSearch.modeling.count
    }
    
    //section 안에 row 크기
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 87.0
    }
    
    // section 헤더 크기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
        // section의 header 만드는 함수
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            // 이때는 꺼야함.... 이것때문에 삽질...
//            headerView.translatesAutoresizingMaskIntoConstraints = false
            headerView.backgroundColor = .black
    
            let headerTitle = UILabel()
            headerTitle.translatesAutoresizingMaskIntoConstraints = false
            headerTitle.text = "Top Searches"
            headerTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            headerTitle.textColor = .white
    
            headerView.addSubview(headerTitle)
    
            NSLayoutConstraint.activate([
                headerTitle.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0),
                headerTitle.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 8),
                headerTitle.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -8),
                headerTitle.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0)
            ])
    
            return headerView
        }
}

