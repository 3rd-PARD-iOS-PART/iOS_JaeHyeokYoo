//
//  ThirdViewController.swift
//  5st_hw_YooJaeHyeok
//
//  Created by 유재혁 on 5/1/24.
//

import UIKit


class ThirdViewController: UIViewController{
//    tableview 생성
    let tableViewUI: UITableView = {
        let tableVIew = UITableView(frame: .zero, style: .grouped)  // 이거 괄호안에 저 값 넣어서 head 안밀림
        tableVIew.backgroundColor = .black
        tableVIew.translatesAutoresizingMaskIntoConstraints = false
//        tableVIew.contentInsetAdjustmentBehavior = .never
        
        if #available(iOS 15.0, *) {
            tableVIew.sectionHeaderTopPadding = 0
        }
        
        return tableVIew
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        tableViewUI.dataSource = self
        tableViewUI.delegate = self
        tablesetUI()
        
    }
    
    
    func tablesetUI(){
        view.addSubview(tableViewUI)
        
        tableViewUI.register(ComingTableViewCell.self, forCellReuseIdentifier: "ComingTableViewCell")
        
        NSLayoutConstraint.activate([
            tableViewUI.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableViewUI.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableViewUI.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableViewUI.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    override func viewWillAppear(_ animated: Bool) {    //뷰가 뜰 때 실행되는 함수
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)      //이거hiddend을  true로 해서 움직일 때 위에 색 바뀌는거 없애줌
    }
    
    override func viewWillDisappear(_ animated: Bool) { // 뷰가 사라질 때 실행되는 함수
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    
}


extension ThirdViewController: UITableViewDataSource, UITableViewDelegate{
    
    //이거 datasource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewUI.dequeueReusableCell(withIdentifier: "ComingTableViewCell", for: indexPath) as? ComingTableViewCell else {
            return UITableViewCell()
        }

        let imageName = MockDataComing.modeling[indexPath.section][indexPath.row].name3
        cell.movieImage.image = UIImage(named: imageName)   // indexpath로 특정 cell정보 인식
        cell.Title.text = MockDataComing.modeling[indexPath.section][indexPath.row].title3
        cell.Date.text = MockDataComing.modeling[indexPath.section][indexPath.row].date
        cell.explain.text = MockDataComing.modeling[indexPath.section][indexPath.row].explain
        cell.genre.text = MockDataComing.modeling[indexPath.section][indexPath.row].genre
    
        cell.backgroundColor = .clear
    
        return cell
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    //이거 datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MockDataComing.modeling[section].count
    }
    
    //section 안에 row 크기
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400.0
    }
    
    // section 헤더 크기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }


        // section의 header 만드는 함수
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        
    
        let headerTitle = UILabel()
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        headerTitle.text = "Notifications"
        headerTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        headerTitle.textColor = .white
    
        let headerimage = UIImageView()
        headerimage.translatesAutoresizingMaskIntoConstraints = false
        headerimage.image = UIImage(named: "red")
        headerimage.contentMode = .scaleAspectFit
    
        headerView.addSubview(headerTitle)
        headerView.addSubview(headerimage)
    
        NSLayoutConstraint.activate([
            headerimage.topAnchor.constraint(equalTo: headerView.topAnchor),
            headerimage.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
            headerimage.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            
            headerTitle.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0),
            headerTitle.leadingAnchor.constraint(equalTo: headerimage.trailingAnchor, constant: 10),
//               headerTitle.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -8),
            headerTitle.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0)
        ])
    
            return headerView
        }
    
}

