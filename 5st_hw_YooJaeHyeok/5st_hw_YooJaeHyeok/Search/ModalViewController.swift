//
//  ModalViewController.swift
//  5st_hw_YooJaeHyeok
//
//  Created by 유재혁 on 5/1/24.
//

import UIKit

class ModalViewController: UIViewController {

    let tableViewUI2: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.contentInsetAdjustmentBehavior = .never   //전체화면사용
        
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        
        return tableView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        tableViewUI2.dataSource = self
        tableViewUI2.delegate = self
        setUI()
        
    }
    
    func setUI() {
        view.addSubview(tableViewUI2)
        
        tableViewUI2.register(ModalTableViewCell.self, forCellReuseIdentifier: "ModalTableViewCell")
        tableViewUI2.backgroundColor = .black
        
        NSLayoutConstraint.activate([
            
            tableViewUI2.topAnchor.constraint(equalTo: view.topAnchor),
            tableViewUI2.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor),
            tableViewUI2.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor),
            tableViewUI2.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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



extension ModalViewController: UITableViewDataSource, UITableViewDelegate {
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewUI2.dequeueReusableCell(withIdentifier: "ModalTableViewCell", for: indexPath) as? ModalTableViewCell else {
            return UITableViewCell()
        }
        
        cell.episodeName.text = MockDataModal.modeling[indexPath.section][indexPath.row].title3
       
        let imageName = MockDataModal.modeling[indexPath.section][indexPath.row].name3
        cell.episodeImage.image = UIImage(named: imageName)
        
        cell.runTime.text = MockDataModal.modeling[indexPath.section][indexPath.row].runnig
        cell.descrip.text = MockDataModal.modeling[indexPath.section][indexPath.row].descrip
        
        


        cell.backgroundColor = .black
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MockDataModal.modeling[section].count
    }
 
    //section 안에 row 크기
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
    // section 헤더 크기
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 650
    }
    
    
    //여기서 헤더를 만든다.
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        
        //가운데 하얀 버튼
        let white_play : UIButton = {
            var config = UIButton.Configuration.filled()
            config.baseBackgroundColor = .clear
            if let image = UIImage(named: "whiteplay"){
                let size = CGSize(width: 30, height: 30)
                UIGraphicsBeginImageContextWithOptions(size, false, 0.0) // 그래픽 컨텍스트 생성
                image.draw(in: CGRect(origin: .zero, size: size))
                let scaledImage = UIGraphicsGetImageFromCurrentImageContext() // 그래픽 컨텍스트에서 UIImage 객체 생성
                UIGraphicsEndImageContext() // 그래픽 컨텍스트 종료
                config.image = scaledImage
            }
            
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.configuration = config
            button.layer.masksToBounds = true // bond 밖으로 나가지않게 조절
            button.layer.cornerRadius = 30
            button.layer.borderWidth = 1
            button.layer.borderColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            return button
        }()
        
        
        // mirror button
        let mirror_button: UIButton = {
            
            var config = UIButton.Configuration.filled()
            
            config.baseBackgroundColor = #colorLiteral(red: 0.1607843041, green: 0.1607843041, blue: 0.1607843041, alpha: 1) // 어두운 배경색 설정
            
            if let image = UIImage(named: "mirror"){
                let size = CGSize(width: 18, height: 18)
                UIGraphicsBeginImageContextWithOptions(size, false, 0.0) // 그래픽 컨텍스트 생성
                image.draw(in: CGRect(origin: .zero, size: size))
                let scaledImage = UIGraphicsGetImageFromCurrentImageContext() // 그래픽 컨텍스트에서 UIImage 객체 생성
                UIGraphicsEndImageContext() // 그래픽 컨텍스트 종료
                config.image = scaledImage
            }
            
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.configuration = config
            button.layer.masksToBounds = true // bond 밖으로 나가지않게 조절
            button.layer.cornerRadius = 16
            return button
        }()
        
        // close button
        let close_button: UIButton = {
            var config = UIButton.Configuration.filled()
            config.baseBackgroundColor = #colorLiteral(red: 0.1607843041, green: 0.1607843041, blue: 0.1607843041, alpha: 1)  // 어두운 배경색 설정
        
            if let image = UIImage(named: "close"){
                let size = CGSize(width: 18, height: 18)
                UIGraphicsBeginImageContextWithOptions(size, false, 0.0) // 그래픽 컨텍스트 생성
                image.draw(in: CGRect(origin: .zero, size: size))
                let scaledImage = UIGraphicsGetImageFromCurrentImageContext() // 그래픽 컨텍스트에서 UIImage 객체 생성
                UIGraphicsEndImageContext() // 그래픽 컨텍스트 종료
                config.image = scaledImage
            }
            
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.configuration = config
            button.layer.masksToBounds = true
            button.layer.cornerRadius = 16
            return button
        }()
        
        
        //가장 큰 이미지
        let headerimage : UIImageView = {
            let headerimage = UIImageView()
            headerimage.translatesAutoresizingMaskIntoConstraints = false
            headerimage.image = UIImage(named: "jjang")
            headerimage.contentMode = .scaleAspectFit
            return headerimage
        }()
        
        //영화제목
        let title_label : UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 18, weight: .bold)
            label.text = "짱구는 못말려"
            label.textColor = .white
            return label
        }()
        
        //넷플릭스 로고
        let logoimage : UIImageView = {
            let logoimage = UIImageView()
            logoimage.translatesAutoresizingMaskIntoConstraints = false
            logoimage.image = UIImage(named: "netflixLogo")
            logoimage.contentMode = .scaleAspectFit
            return logoimage
        }()
        
        //series
        let series_image : UIImageView = {
            let series = UIImageView()
            series.translatesAutoresizingMaskIntoConstraints = false
            series.image = UIImage(named: "series")
            series.contentMode = .scaleAspectFit
            return series
        }()
        
        //년도
        let year : UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 13, weight: .regular)
            label.text = "2022"
            label.textColor = .white
            return label
        }()
        
        //tv-ma
        let tv_ma : UIImageView = {
            let tvma = UIImageView()
            tvma.translatesAutoresizingMaskIntoConstraints = false
            tvma.image = UIImage(named: "tv-ma")
            tvma.contentMode = .scaleAspectFit
            return tvma
        }()
        
        //seasons
        let season : UILabel = {
            let season = UILabel()
            season.translatesAutoresizingMaskIntoConstraints = false
            season.font = .systemFont(ofSize: 13, weight: .regular)
            season.text = "5 Seasons"
            season.textColor = .white
            return season
        }()
        
        //vision
        let vision : UIImageView = {
            let vision = UIImageView()
            vision.translatesAutoresizingMaskIntoConstraints = false
            vision.image = UIImage(named: "vision")
            vision.contentMode = .scaleAspectFit
            return vision
        }()
        
        //hd
        let hd : UIImageView = {
            let hd = UIImageView()
            hd.translatesAutoresizingMaskIntoConstraints = false
            hd.image = UIImage(named: "hd")
            hd.contentMode = .scaleAspectFit
            return hd
        }()
        
        // ad
        let ad : UIImageView = {
            let ad = UIImageView()
            ad.translatesAutoresizingMaskIntoConstraints = false
            ad.image = UIImage(named: "ad")
            ad.contentMode = .scaleAspectFit
            return ad
        }()
        
        // play button
            let play_button: UIButton = {
                var config = UIButton.Configuration.filled()
                config.background.backgroundColor = .white
                if let image = UIImage(named: "Vector") {
                    let size = CGSize(width: 14, height: 15)
                    UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
                    image.draw(in: CGRect(origin: .zero, size: size))
                    let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
                    UIGraphicsEndImageContext()
                    config.image = scaledImage
                }
                config.imagePadding = 15
                config.imagePlacement = .leading
                config.baseForegroundColor = .black
                
                var titleAttr = AttributedString.init("Play")
                titleAttr.font = .systemFont(ofSize: 15.0, weight: .semibold)
                config.attributedTitle = titleAttr
                
                let button = UIButton(configuration: config)
                button.translatesAutoresizingMaskIntoConstraints = false
                
                return button
            }()
        
        
        // download button
            let download_button: UIButton = {
                var config = UIButton.Configuration.filled()
                config.background.backgroundColor = #colorLiteral(red: 0.1262081265, green: 0.1262081265, blue: 0.1262081265, alpha: 1)
                if let image = UIImage(named: "down") {
                    let size = CGSize(width: 14, height: 15)
                    UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
                    image.draw(in: CGRect(origin: .zero, size: size))
                    let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
                    UIGraphicsEndImageContext()
                    config.image = scaledImage
                }
                config.imagePadding = 15
                config.imagePlacement = .leading
                config.baseForegroundColor = .lightGray
                
                var titleAttr = AttributedString.init("Download")
                titleAttr.font = .systemFont(ofSize: 15.0, weight: .semibold)
                config.attributedTitle = titleAttr
                
                let button = UIButton(configuration: config)
                button.translatesAutoresizingMaskIntoConstraints = false
                
                return button
            }()
        
        //description
        let episode_description : UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 12, weight: .bold)
            label.textColor = .white
            label.text = ("S5:E10 Nothing Remains The Same")
            return label
        }()
        
        //description
        let description : UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 12)
            label.textColor = .white
            label.text = ("Hearts flip as Heather weds Tarek. Jason and Mary grapple with being ghosted. Go solo or take the next step: The agents face life-changing decisions.")
            label.numberOfLines = 3
            return label
        }()
    
        //mylist 버튼
        let MylistButton : UIButton = {
            var config = UIButton.Configuration.filled()
            config.baseBackgroundColor = .clear
            config.imagePadding = 6
            config.imagePlacement = .top
            
            //이미지삽입
            if let image = UIImage(named: "plus"){
                let size = CGSize(width: 26, height: 26)
                UIGraphicsBeginImageContextWithOptions(size, false, 0.0) // 그래픽 컨텍스트 생성
                image.draw(in: CGRect(origin: .zero, size: size))
                let scaledImage = UIGraphicsGetImageFromCurrentImageContext() // 그래픽 컨텍스트에서 UIImage 객체 생성
                UIGraphicsEndImageContext() // 그래픽 컨텍스트 종료
                            
                config.image = scaledImage
                    
            }
                        
            // 라벨 추가
            var text = AttributedString.init("My List")
            text.foregroundColor = #colorLiteral(red: 0.4509803653, green: 0.4509803653, blue: 0.4509803653, alpha: 1)
            text.font = UIFont.systemFont(ofSize: 12 , weight: .light)
            config.attributedTitle = text
                        
            // config 버튼에 합치기
            let button = UIButton(configuration: config)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
                        
        }()
        
        //rate 버튼
        let rateButton : UIButton = {
            var config = UIButton.Configuration.filled()
            config.background.backgroundColor = .clear
            config.imagePadding = 6
            config.imagePlacement = .top
                        
                        
            // 이미지 추가
            
            if let image = UIImage(named: "rate"){
                let size = CGSize(width: 26, height: 26)
                UIGraphicsBeginImageContextWithOptions(size, false, 0.0) // 그래픽 컨텍스트 생성
                image.draw(in: CGRect(origin: .zero, size: size))
                let scaledImage = UIGraphicsGetImageFromCurrentImageContext() // 그래픽 컨텍스트에서 UIImage 객체 생성
                UIGraphicsEndImageContext() // 그래픽 컨텍스트 종료
                            
                config.image = scaledImage
                    
            }
                        
            // 라벨 추가
            var text = AttributedString.init("Rate")
            text.foregroundColor = #colorLiteral(red: 0.4509803653, green: 0.4509803653, blue: 0.4509803653, alpha: 1)
            text.font = UIFont.systemFont(ofSize: 12 , weight: .light)
            config.attributedTitle = text
                        
            // config 버튼에 합치기
            let button = UIButton(configuration: config)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
                        
        }()
        
        
        //share 버튼
        let shareButton : UIButton = {
            var config = UIButton.Configuration.filled()
            config.background.backgroundColor = .clear
            config.imagePadding = 6
            config.imagePlacement = .top
                        
                        
            // 이미지 추가
            
            if let image = UIImage(named: "sharem"){
                let size = CGSize(width: 26, height: 26)
                UIGraphicsBeginImageContextWithOptions(size, false, 0.0) // 그래픽 컨텍스트 생성
                image.draw(in: CGRect(origin: .zero, size: size))
                let scaledImage = UIGraphicsGetImageFromCurrentImageContext() // 그래픽 컨텍스트에서 UIImage 객체 생성
                UIGraphicsEndImageContext() // 그래픽 컨텍스트 종료
                            
                config.image = scaledImage
                    
            }
                        
            // 라벨 추가
            var text = AttributedString.init("Share")
            text.foregroundColor = #colorLiteral(red: 0.4509803653, green: 0.4509803653, blue: 0.4509803653, alpha: 1)
            text.font = UIFont.systemFont(ofSize: 12 , weight: .light)
            config.attributedTitle = text
                        
            // config 버튼에 합치기
            let button = UIButton(configuration: config)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
                        
        }()
        
        // tabbar
        let tabbar_image : UIImageView = {
            let ad = UIImageView()
            ad.translatesAutoresizingMaskIntoConstraints = false
            ad.image = UIImage(named: "tabbar")
            ad.contentMode = .scaleAspectFit
            return ad
        }()
        
        //series category
        let category : UIButton = {
            var config = UIButton.Configuration.filled()
            config.baseBackgroundColor = .clear
            config.imagePadding = 6
            config.imagePlacement = .trailing
            
            //이미지삽입
            if let image = UIImage(named: "label_under"){
                let size = CGSize(width: 10, height: 10)
                UIGraphicsBeginImageContextWithOptions(size, false, 0.0) // 그래픽 컨텍스트 생성
                image.draw(in: CGRect(origin: .zero, size: size))
                let scaledImage = UIGraphicsGetImageFromCurrentImageContext() // 그래픽 컨텍스트에서 UIImage 객체 생성
                UIGraphicsEndImageContext() // 그래픽 컨텍스트 종료
                            
                config.image = scaledImage
                    
            }
                        
            // 라벨 추가
            var text = AttributedString.init("Season 5")
            text.foregroundColor = .white
            text.font = UIFont.systemFont(ofSize: 12 , weight: .light)
            config.attributedTitle = text
                        
            // config 버튼에 합치기
            let button = UIButton(configuration: config)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
                        
        }()
        
        
        
        
        headerView.addSubview(headerimage)
        headerView.addSubview(close_button)
        headerView.addSubview(mirror_button)
        headerView.addSubview(white_play)
        headerView.addSubview(title_label)
        headerView.addSubview(logoimage)
        headerView.addSubview(series_image)
        headerView.addSubview(year)
        headerView.addSubview(tv_ma)
        headerView.addSubview(season)
        headerView.addSubview(vision)
        headerView.addSubview(hd)
        headerView.addSubview(ad)
        headerView.addSubview(play_button)
        headerView.addSubview(download_button)
        headerView.addSubview(episode_description)
        headerView.addSubview(description)
        headerView.addSubview(MylistButton)
        headerView.addSubview(rateButton)
        headerView.addSubview(shareButton)
        headerView.addSubview(tabbar_image)
        headerView.addSubview(category)
        
    
        NSLayoutConstraint.activate([
            headerimage.topAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.topAnchor),
            headerimage.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            headerimage.widthAnchor.constraint(equalTo: headerView.widthAnchor),
            headerimage.heightAnchor.constraint(equalToConstant: 230),
            
            
            close_button.topAnchor.constraint(equalTo: headerimage.topAnchor, constant: 15),
            close_button.leadingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -42),
            close_button.widthAnchor.constraint(equalToConstant: 32),
            close_button.heightAnchor.constraint(equalToConstant: 32),
            
            mirror_button.topAnchor.constraint(equalTo: headerimage.topAnchor, constant: 15),
            mirror_button.leadingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -90),
            mirror_button.widthAnchor.constraint(equalToConstant: 32),
            mirror_button.heightAnchor.constraint(equalToConstant: 32),
            
            white_play.centerYAnchor.constraint(equalTo: headerimage.centerYAnchor),
            white_play.centerXAnchor.constraint(equalTo: headerimage.centerXAnchor),
            white_play.widthAnchor.constraint(equalToConstant: 60),
            white_play.heightAnchor.constraint(equalToConstant: 60),
            
            title_label.topAnchor.constraint(equalTo: logoimage.bottomAnchor, constant: 0),
            title_label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 5),
            
            logoimage.topAnchor.constraint(equalTo: headerimage.bottomAnchor, constant: 0),
            logoimage.leadingAnchor.constraint(equalTo: headerimage.leadingAnchor, constant: 0),
            logoimage.heightAnchor.constraint(equalToConstant: 25),
            logoimage.widthAnchor.constraint(equalToConstant: 25),
            
            series_image.centerYAnchor.constraint(equalTo: logoimage.centerYAnchor),
            series_image.leadingAnchor.constraint(equalTo: logoimage.trailingAnchor, constant: 0),
            series_image.widthAnchor.constraint(equalToConstant: 60),
            
            year.topAnchor.constraint(equalTo: title_label.bottomAnchor, constant: 8),
            year.leadingAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            
            tv_ma.centerYAnchor.constraint(equalTo: year.centerYAnchor),
            tv_ma.leadingAnchor.constraint(equalTo: year.trailingAnchor, constant: 5),
            tv_ma.heightAnchor.constraint(equalToConstant: 20),
            tv_ma.widthAnchor.constraint(equalToConstant: 40),
            
            season.centerYAnchor.constraint(equalTo: year.centerYAnchor),
            season.leadingAnchor.constraint(equalTo: tv_ma.trailingAnchor, constant: 5),
            
            vision.centerYAnchor.constraint(equalTo: year.centerYAnchor),
            vision.leadingAnchor.constraint(equalTo: season.trailingAnchor, constant: 5),
            vision.heightAnchor.constraint(equalToConstant: 20),
            vision.widthAnchor.constraint(equalToConstant: 60),
            
            hd.centerYAnchor.constraint(equalTo: year.centerYAnchor),
            hd.leadingAnchor.constraint(equalTo: vision.trailingAnchor, constant: 5),
            hd.heightAnchor.constraint(equalToConstant: 20),
            hd.widthAnchor.constraint(equalToConstant: 20),
            
            ad.centerYAnchor.constraint(equalTo: year.centerYAnchor),
            ad.leadingAnchor.constraint(equalTo: hd.trailingAnchor, constant: 5),
            ad.heightAnchor.constraint(equalToConstant: 20),
            ad.widthAnchor.constraint(equalToConstant: 25),
            
            play_button.topAnchor.constraint(equalTo: year.bottomAnchor, constant: 10),
            play_button.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 5),
            play_button.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -5),
            play_button.heightAnchor.constraint(equalToConstant: 35),
            
            download_button.topAnchor.constraint(equalTo: play_button.bottomAnchor, constant: 10),
            download_button.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 5),
            download_button.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -5),
            download_button.heightAnchor.constraint(equalToConstant: 35),
            
            episode_description.topAnchor.constraint(equalTo: download_button.bottomAnchor, constant: 9),
            episode_description.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 5),
            
            description.topAnchor.constraint(equalTo: episode_description.bottomAnchor, constant: 5),
            description.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 5),
            description.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -5),
            
            MylistButton.topAnchor.constraint(equalTo: description.bottomAnchor, constant: 15),
            MylistButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 13),
            
            rateButton.topAnchor.constraint(equalTo: description.bottomAnchor, constant: 18),
            rateButton.leadingAnchor.constraint(equalTo: MylistButton.leadingAnchor, constant: 100),
            
            shareButton.topAnchor.constraint(equalTo: description.bottomAnchor, constant: 18),
            shareButton.leadingAnchor.constraint(equalTo: rateButton.leadingAnchor, constant: 100),
            
            tabbar_image.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -50),
            tabbar_image.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
            tabbar_image.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
            tabbar_image.heightAnchor.constraint(equalToConstant: 50),
            
            category.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            category.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,constant: 0),
            
        ])
    
            return headerView
        }
    
    
    
    
    
}
