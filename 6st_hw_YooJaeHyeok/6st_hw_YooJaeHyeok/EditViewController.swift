////
////  EditViewController.swift
////  6st_hw_YooJaeHyeok
////
////  Created by 유재혁 on 5/11/24.
////
//
//import UIKit
//
//class EditViewController: UIViewController {
//    var memo: MemoModel?        // memo 에다가 memomodel에서 값 가져와서 넣고
//    var viewController: ViewController? // viewController에다가 ViewController 넣음
//
//    
//    //name
//    let nameLabel : UILabel = {
//        let name = UILabel()
//        name.font = UIFont.systemFont(ofSize: 40, weight: .bold)
//        name.textColor  = .black
//        name.translatesAutoresizingMaskIntoConstraints = false
//        return name
//    }()
//    
//    //part
//    let partLabel : UILabel = {
//        let part = UILabel()
//        part.font = UIFont.systemFont(ofSize: 15, weight: .medium)
//        part.textColor = .black
//        part.translatesAutoresizingMaskIntoConstraints = false
//        return part
//    }()
//    
//    //age
//    let ageLabel : UILabel = {
//        let age = UILabel()
//        age.font = UIFont.systemFont(ofSize: 15, weight: .medium)
//        age.textColor = .black
//        age.translatesAutoresizingMaskIntoConstraints = false
//        return age
//    }()
//    
//    
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        dataset()
//        setUI()
//        
//    }
//    
//    
//    
//    //데이터 눌러서 가져온거 새로 띄우는 이 창에다가 넣기
//    func dataset() {
//        guard let memo = memo else {        // 받아온 memo에 값이 있으면 memo에 값이 들어갈텐데 nil이라면 else (return)실행
//            return
//        }
//        nameLabel.text = memo.name
//        ageLabel.text = "Age : \(memo.age)"
//        partLabel.text = "Part : \(memo.part)"
//    }
//    
//    
//    
//    func setUI(){
//           view.addSubview(nameLabel)
//           view.addSubview(partLabel)
//           view.addSubview(ageLabel)
//           
//           
//           NSLayoutConstraint.activate([
// 
//            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//               
//            ageLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//            ageLabel.bottomAnchor.constraint(equalTo: partLabel.topAnchor , constant: -10),
//               
//            partLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//            partLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -50),
//           
//           ])
//       }
//    
//    
//    func makeUpdateRequest(_ memo: MemoModel) {
//        guard let url = URL(string: "http://172.17.201.143:8080/pard") else {
//            print("🚨 Invalid URL")
//            return
//        }
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "PATCH"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        do {
//            let encoder = JSONEncoder()
//            let jsonData = try encoder.encode(memo)
//            request.httpBody = jsonData
//            
//            let task = URLSession.shared.dataTask(with: request) { data, response, error in
//                if let error = error {
//                    print("🚨", error)
//                } else if let data = data {
//                    if let responseString = String(data: data, encoding: .utf8) {
//                        print("Response: \(responseString)")
//                        DispatchQueue.main.async {
//                            self.viewController?.fetchMembers()
//                        }
//                    }
//                }
//            }
//            task.resume()
//        } catch {
//            print("🚨", error)
//        }
//    }
//    
//    
//    
//    
//}
