//
//  FirstViewController.swift
//  5st_hw_YooJaeHyeok
//
//  Created by 유재혁 on 5/1/24.
//

import UIKit

class FirstViewController: UIViewController {
    
    // MARK: - 1. tableView 인스턴스 생성
    let tableViewUI: UITableView = {
        let tableVIew = UITableView(frame: .zero, style: .grouped)  // 이거 괄호안에 저 값 넣어서 head 안밀림
        tableVIew.backgroundColor = .clear
        tableVIew.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)    // 이거 collectionview 불러다가 넣는거
        tableVIew.translatesAutoresizingMaskIntoConstraints = false
        tableVIew.contentInsetAdjustmentBehavior = .never
        
        if #available(iOS 15.0, *) {
            tableVIew.sectionHeaderTopPadding = 0
        }
        
        return tableVIew
    }()
    
    
    let btnMyList: UIButton = {
                    // configuration: Button안 image, title 공존 및 기타 설정을 위함
    var configuration = UIButton.Configuration.filled()
        configuration.background.backgroundColor = .clear
        configuration.title = "MyList"
        configuration.image = UIImage(named: "plus")
        configuration.imagePadding = 1
        configuration.titlePadding = 1
        configuration.imagePlacement = .top // image가 title보다 위로 오게 및 verticle 정렬
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                        
        let btnMyList = UIButton(configuration: configuration)
        btnMyList.setTitleColor(.white, for: .normal)
        btnMyList.titleLabel?.font = UIFont.systemFont(ofSize: 13.64, weight: .regular)
                       
        btnMyList.translatesAutoresizingMaskIntoConstraints = false
        return btnMyList
    }()
    
    
    let btnPlay: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.background.backgroundColor = UIColor.lightGray
        configuration.title = "Play"
        configuration.image = UIImage(named: "Vector")
        configuration.imagePadding = 15
        configuration.titlePadding = 15
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                       
        let btnPlay = UIButton(configuration: configuration)
        btnPlay.setTitleColor(.black, for: .normal)
        btnPlay.titleLabel?.font = UIFont.systemFont(ofSize: 13.64, weight: .regular)
//        btnPlay.titleLabel?.textColor = .black
//        btnPlay.titleLabel?.tintColor = .black
        btnPlay.translatesAutoresizingMaskIntoConstraints = false
        return btnPlay
    }()
               
    let btnInfo: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.background.backgroundColor = .clear
        configuration.title = "Info"
        configuration.image = UIImage(named: "info")
        configuration.imagePadding = 1
        configuration.titlePadding = 1
        configuration.imagePlacement = .top
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                   
    let btnInfo = UIButton(configuration: configuration)
        btnInfo.setTitleColor(.white, for: .normal)
        btnInfo.titleLabel?.font = UIFont.systemFont(ofSize: 13.64, weight: .regular)
    
        btnInfo.translatesAutoresizingMaskIntoConstraints = false
    return btnInfo
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        tableViewUI.sectionHeaderTopPadding = 0
        // MARK: - 3. dataSource, delegate 생성
        tableViewUI.dataSource = self
        tableViewUI.delegate = self
        

    
        // 내가 만든 tableview의 헤더 부분을 만드는 것임. 공간 만들기위해
        tableViewUI.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 480))
        
        
        //headerview라는 변수에 HeaderPicUiView 값을 넣어줌과 동시에 사이즈 지정까지
        let headerview = HeaderPicUiView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 420))
        tableViewUI.tableHeaderView?.addSubview(headerview)
        
        tableViewUI.tableHeaderView?.addSubview(btnMyList)
        tableViewUI.tableHeaderView?.addSubview(btnPlay)
        tableViewUI.tableHeaderView?.addSubview(btnInfo)

        setUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {    //뷰가 뜰 때 실행되는 함수
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)      //이거hiddend을  true로 해서 움직일 때 위에 색 바뀌는거 없애줌
    }
    
    override func viewWillDisappear(_ animated: Bool) { // 뷰가 사라질 때 실행되는 함수
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    
    
    func setUI(){

        view.addSubview(tableViewUI)

        
        // MARK: - 4. cell 등록하기
        tableViewUI.register(DemoCell.self, forCellReuseIdentifier: "Cell")
        tableViewUI.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: "CollectionViewTableViewCell")
        tableViewUI.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        tableViewUI.tableFooterView = UIView(frame: .zero)
        tableViewUI.sectionFooterHeight = 0
    
        NSLayoutConstraint.activate([

            tableViewUI.topAnchor.constraint(equalTo: view.topAnchor),
            tableViewUI.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableViewUI.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableViewUI.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            btnMyList.topAnchor.constraint(equalTo: btnPlay.topAnchor),
            btnMyList.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            btnMyList.widthAnchor.constraint(equalToConstant: 60),
            btnMyList.heightAnchor.constraint(equalToConstant: 50),

            btnPlay.topAnchor.constraint(equalTo: tableViewUI.bottomAnchor, constant: 428),
            btnPlay.widthAnchor.constraint(equalToConstant: 110.62),
            btnPlay.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            btnPlay.heightAnchor.constraint(equalToConstant: 45),
            
            btnInfo.topAnchor.constraint(equalTo: btnPlay.topAnchor),
            btnInfo.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30),
            btnInfo.widthAnchor.constraint(equalToConstant: 60),
            btnInfo.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        
    }
    
    //cell들의 section 배열로 이름 설정
    let sections = ["Popular on Netflix", "Trending Now", "Top 10 Nigeria Today", "My List", "African Movies", "Nollywood Movies & TV"]
    
    
}




// MARK: - 2. tableView extension 생성
extension FirstViewController: UITableViewDelegate, UITableViewDataSource{
    
    // tableview section 갯수 정하는 함수
    func numberOfSections(in tableView: UITableView) -> Int {
        return MockData.modeling.count
    }
    
    //해당 테이블 뷰 섹션에 대한 행의 수에 관한 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //UITableViewDelegate 쪽임
    // cellforrowat 을 통해 각 셀의 내용 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionViewTableViewCell", for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
            }
        
             switch indexPath.section {
             case 0 :
                 cell.getSectionNumber(number: indexPath.section)
             case 1:
                 cell.getSectionNumber(number: indexPath.section)
             case 2:
                 cell.getSectionNumber(number: indexPath.section)
             case 3:
                 cell.getSectionNumber(number: indexPath.section)
             case 4:
                 cell.getSectionNumber(number: indexPath.section)
             case 5:
                 cell.getSectionNumber(number: indexPath.section)
             default:
                 cell.getSectionNumber(number: indexPath.section)
             }
        
        return cell
        
        
        }
    
    //section 안에 row 크기
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 170
    }
    //section header크기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return 70
    }
    
    // section의 header 만드는 함수
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        // 이때는 꺼야함.... 이것때문에 삽질...
        //            headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = .black
        
        let headerTitle = UILabel()
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        headerTitle.text = sections[section]
        headerTitle.font = UIFont.systemFont(ofSize: 22, weight: .bold)
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
