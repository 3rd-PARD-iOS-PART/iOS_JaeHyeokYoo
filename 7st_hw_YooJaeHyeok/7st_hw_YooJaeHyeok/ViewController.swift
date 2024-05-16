//
//  ViewController.swift
//  7st_hw_YooJaeHyeok
//
//  Created by 유재혁 on 5/16/24.
//


import UIKit

extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))

        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        setBackgroundImage(backgroundImage, for: state)
    }
}

class ViewController: UIViewController{
    
    
    var memos: [MemoModel] = []    // memos 배열
    static let URL_GET_MEMBERS = "https://pard-host.onrender.com/pard"  // 데이터 가져오기위한 api주소
    
    
    
    let homeTitle: UILabel =  {
        let label = UILabel()
        label.text = "UrlSession"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("추가", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapModalButton), for: .touchUpInside)
        return button
    }()
    
    let all : UIButton = {
        let label = UIButton()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setTitle("all", for: .normal)
        label.setTitleColor(.black, for: .normal)
        label.addTarget(self, action: #selector(tapAll), for: .touchUpInside)
        // labelview의 외부 데코레이션
        label.layer.cornerRadius = 20
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        return label
    }()
    
    let ios : UIButton = {
        let label = UIButton()
        //자동 오토레이징 마스크제한 팔스
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setTitle("ios", for: .normal)
        label.setTitleColor(.black, for: .normal)
        label.addTarget(self, action: #selector(tapIos), for: .touchUpInside)
        // labelview의 외부 데코레이션
        label.layer.cornerRadius = 20
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        return label
    }()
    
    let server : UIButton = {
        let label = UIButton()
        //자동 오토레이징 마스크제한 팔스
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setTitle("server", for: .normal)
        label.setTitleColor(.black, for: .normal)
        label.addTarget(self, action: #selector(tapServer), for: .touchUpInside)
        // labelview의 외부 데코레이션
        label.layer.cornerRadius = 20
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        return label
    }()
    
    let web : UIButton = {
        let label = UIButton()
        //자동 오토레이징 마스크제한 팔스
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setTitle("web", for: .normal)
        label.setTitleColor(.black, for: .normal)
        label.addTarget(self, action: #selector(tapWeb), for: .touchUpInside)
        // labelview의 외부 데코레이션
        label.layer.cornerRadius = 20
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        return label
    }()
    
    
    
    private lazy var memoTableView: UITableView = {     // lazy : 값이 계속 바뀔 수 있을 때 사용
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MemberTableViewCellView.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(all)
        view.addSubview(ios)
        view.addSubview(server)
        view.addSubview(web)

        view.addSubview(memoTableView)
        view.addSubview(addButton)
        view.addSubview(homeTitle)
        addConstraints()
        tapAll()
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            memoTableView.topAnchor.constraint(equalTo: homeTitle.topAnchor, constant: 120),
            memoTableView.widthAnchor.constraint(equalToConstant: view.frame.width),
            memoTableView.heightAnchor.constraint(equalToConstant: view.frame.height),
            memoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            homeTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            homeTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            all.topAnchor.constraint(equalTo: homeTitle.topAnchor, constant: 55),
            all.widthAnchor.constraint(equalToConstant: 50),
            all.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            ios.topAnchor.constraint(equalTo: all.topAnchor, constant: 0),
            ios.widthAnchor.constraint(equalToConstant: 50),
            ios.leadingAnchor.constraint(equalTo: all.trailingAnchor, constant: 40),
            
            server.topAnchor.constraint(equalTo: all.topAnchor, constant: 0),
            server.widthAnchor.constraint(equalToConstant: 80),
            server.leadingAnchor.constraint(equalTo: ios.trailingAnchor, constant: 40),
            
            web.topAnchor.constraint(equalTo: all.topAnchor, constant: 0),
            web.widthAnchor.constraint(equalToConstant: 50),
            web.leadingAnchor.constraint(equalTo: server.trailingAnchor, constant: 40),
            
            
            
            
        ])
    }
    
    
    //api로 데이터값 가져오는 부분
    func fetchMembers() {
        if let url = URL(string: ViewController.URL_GET_MEMBERS) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("🚨🚨🚨", error!)
                    return
                }
                if let JSONdata = data {
                    let dataString = String(data: JSONdata, encoding: .utf8)
                    print(dataString!)
                    
                    let decoder = JSONDecoder()
                    do {
                        let decodeData = try decoder.decode([MemoModel].self, from: JSONdata)
                        self.memos = decodeData
                        DispatchQueue.main.async {
                            self.memoTableView.reloadData()
                        }
                    } catch let error as NSError {
                        print("🚨🚨🚨", error)
                    }
                }
            }
            task.resume()
        }
    }
    
    //api로 데이터값 가져오는 부분
    func fetchIos() {
        if let url = URL(string: "https://pard-host.onrender.com/pard?part=iOS") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("🚨🚨🚨", error!)
                    return
                }
                if let JSONdata = data {
                    let dataString = String(data: JSONdata, encoding: .utf8)
                    print(dataString!)
                    
                    let decoder = JSONDecoder()
                    do {
                        let decodeData = try decoder.decode([MemoModel].self, from: JSONdata)
                        self.memos = decodeData
                        DispatchQueue.main.async {
                            self.memoTableView.reloadData()
                        }
                    } catch let error as NSError {
                        print("🚨🚨🚨", error)
                    }
                }
            }
            task.resume()
        }
    }
    
    //api로 데이터값 가져오는 부분
    func fetchserver() {
        if let url = URL(string: "https://pard-host.onrender.com/pard?part=server") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("🚨🚨🚨", error!)
                    return
                }
                if let JSONdata = data {
                    let dataString = String(data: JSONdata, encoding: .utf8)
                    print(dataString!)
                    
                    let decoder = JSONDecoder()
                    do {
                        let decodeData = try decoder.decode([MemoModel].self, from: JSONdata)
                        self.memos = decodeData
                        DispatchQueue.main.async {
                            self.memoTableView.reloadData()
                        }
                    } catch let error as NSError {
                        print("🚨🚨🚨", error)
                    }
                }
            }
            task.resume()
        }
    }
    
    //api로 데이터값 가져오는 부분
    func fetchweb() {
        if let url = URL(string: "https://pard-host.onrender.com/pard?part=web") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("🚨🚨🚨", error!)
                    return
                }
                if let JSONdata = data {
                    let dataString = String(data: JSONdata, encoding: .utf8)
                    print(dataString!)
                    
                    let decoder = JSONDecoder()
                    do {
                        let decodeData = try decoder.decode([MemoModel].self, from: JSONdata)
                        self.memos = decodeData
                        DispatchQueue.main.async {
                            self.memoTableView.reloadData()
                        }
                    } catch let error as NSError {
                        print("🚨🚨🚨", error)
                    }
                }
            }
            task.resume()
        }
    }
    
    
    
    @objc func tapModalButton() {
        print("추가 버튼 tapped!")
        // ModalViewController에서 viewcontriller에 있는 함수 써야해서 viewController 불러다 써야하니깐 여기서 modal로 넘어갈 때 viewController: self해서 넘겨줌
        let modalViewController = ModalViewController(viewController: self)
        // ModalViewController로 page가 present하게 해줘
        modalViewController.modalPresentationStyle = .formSheet
        self.present(modalViewController, animated: true)
    }
    
    @objc func tapAll() {
        print("all 버튼 tapped!")
        fetchMembers()
    }
    
    @objc func tapIos() {
        print("ios 버튼 tapped!")
        fetchIos()
    }
    
    @objc func tapServer() {
        print("server 버튼 tapped!")
        fetchserver()
    }
    
    @objc func tapWeb() {
        print("web 버튼 tapped!")
        fetchweb()
    }
    
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return memos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt")
        guard let cell = memoTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MemberTableViewCellView else {
            return UITableViewCell()
        }
        
        let memo = memos[indexPath.row]
        cell.configure(with: memo)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 60
        }
        
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let memo = memos[indexPath.row]
            
            let detailViewController = DetailViewController()
            detailViewController.memo = memo
            detailViewController.viewController = self
                        
            present(detailViewController, animated: true, completion: nil)
        }
    

}

