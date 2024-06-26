//
//  DetailViewController.swift
//  6st_hw_YooJaeHyeok
//
//  Created by 유재혁 on 5/10/24.
//

import UIKit

class DetailViewController: UIViewController {
    var memo: MemoModel?        // memo 에다가 memomodel에서 값 가져와서 넣고
    var viewController: ViewController? // viewController에다가 ViewController 넣음
    
    //delete
    let deleteButton : UIButton = {
        let button = UIButton(type: .system) // 여기 안에 type: .system 하면 아래에서 .tintColor = 이렇게 바로
        button.setTitle("Delete", for: .normal)
        button.tintColor = .red
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //edit
    let editButton : UIButton = {
        let button = UIButton()     // 여기에 없으면
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)     // 얘처럼 해주면 됨
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //name
    let nameLabel : UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        name.textColor  = .black
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    //part
    let partLabel : UILabel = {
        let part = UILabel()
        part.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        part.textColor = .black
        part.translatesAutoresizingMaskIntoConstraints = false
        return part
    }()
    
    //age
    let ageLabel : UILabel = {
        let age = UILabel()
        age.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        age.textColor = .black
        age.translatesAutoresizingMaskIntoConstraints = false
        return age
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        dataset()
        setUI()
    }
    
    //데이터 눌러서 가져온거 새로 띄우는 이 창에다가 넣기
    func dataset() {
        guard let memo = memo else {        // 받아온 memo에 값이 있으면 memo에 값이 들어갈텐데 nil이라면 else (return)실행
            return
        }
        nameLabel.text = memo.name
        ageLabel.text = "Age : \(memo.age)"
        partLabel.text = "Part : \(memo.part)"
    }
    
    func setUI(){
           view.addSubview(deleteButton)
           view.addSubview(editButton)
           view.addSubview(nameLabel)
           view.addSubview(partLabel)
           view.addSubview(ageLabel)
           
           
           NSLayoutConstraint.activate([
            deleteButton.bottomAnchor.constraint(equalTo: editButton.bottomAnchor),
            deleteButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor , constant: 20),
           
               
            editButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 20),
            editButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor , constant: -20),
               
               
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
               
            ageLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            ageLabel.bottomAnchor.constraint(equalTo: partLabel.topAnchor , constant: -10),
               
            partLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            partLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -50),
           
           ])
       }
    
    // Delete 버튼이 눌렸을 때
    @objc private func deleteButtonTapped() {
        print("Delete button tapped!")
        
        //UIAlertController이용해서 alert만들기. 값 넣어주고
        let alertController = UIAlertController(title: "정말로 삭제하시겠습니까?", message: "삭제한 내용은 다시 되돌릴 수 없습니다.", preferredStyle: .alert)
        
        // alert에 추가할 액션 만들기
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "확인", style: .destructive) { _ in

            if let memo = self.memo {
                self.deleteRequest(memo)
            }
            self.dismiss(animated: true)
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        
        present(alertController, animated: true)
    }
    
    // Edit 버튼이 눌렸을 때
    @objc private func editButtonTapped() {
        print("Edit button tapped!")
        
        let alert = UIAlertController(title: "데이터를 수정하시겠습니까?", message: nil, preferredStyle: .alert)
        alert.addTextField { abc in
            abc.placeholder = "이름을 입력하세요."
            abc.text = self.memo?.name
        }
        alert.addTextField { (textField) in
            textField.placeholder = "나이를 입력하세요."
            textField.text = String(self.memo?.age ?? 0)
        }
        alert.addTextField { (textField) in
            textField.placeholder = "파트를 입력하세요."
            textField.text = self.memo?.part
        }
        
        alert.addAction(UIAlertAction(title: "확인", style: .default) { _ in
            guard
                let name = alert.textFields?[0].text, !name.isEmpty,    // 얘는 빈값이면 안된다
                let ageString = alert.textFields?[1].text, let age = Int(ageString),        // int로 바꿔주기
                let part = alert.textFields?[2].text, !part.isEmpty
            else {
                print("텍스트 입력에 오류가 발생했습니다.")
                return
            }
            do {
                self.makeUpdateRequest(self.memo!)
                
            } catch let error {
                print("Error updating in Realm: \(error)")
            }
        })
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        self.present(alert, animated: true)
        
        

    }
    
    
        
    //여기가 데이터 삭제하는 곳
    func deleteRequest(_ memo: MemoModel) {
        
        guard let id = memo.id else { return }  //  아이디가 뭐 어떻게 돌아가는 거시여
            
        // 1. url 만들기
        let urlString = "https://pard-host.onrender.com/pard/\(id)"
        guard let url = URL(string: urlString) else {       //urLString에 주소가 잘 있는지 보는거임
            print("🚨 Invalid URL")
            return
        }
        // 2. url session 만들기
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
            
        
        // 3. url session task 만들고 처리하기
            // 여기서 dataTask설정  //서버에서 받아온 데이터네
       
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            //여기서부턴 에러체크. 에러 아니면 뭐 띄울지 해주고 이런 구문 작성
            if let error = error {
                print("🚨🚨 Error : \(error.localizedDescription)")
            } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200{
                print("✅ Delete success ")
                   //print("✅ Delete success : \(httpResponse)")
                // 다시 getData()로 서버에 있는 데이터 불러오기
                DispatchQueue.main.async {      //
                    self.viewController?.fetchMembers()
                }
            } else {
                print("🚨 Error: No data returned or invalid response")
            }
        }
        //여기서 task설정
        task.resume()
    }
    
    
    func makeUpdateRequest(_ memo: MemoModel) {
        
        guard let id = memo.id else { return }  //  아이디가 뭐 어떻게 돌아가는 거시여


        guard let url = URL(string: "https://pard-host.onrender.com/pard/update/\(id)") else {
            print("🚨 Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(memo)
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("🚨", error)
                } else if let data = data {
                    if let responseString = String(data: data, encoding: .utf8) {
                        print("Response: \(responseString)")
                        DispatchQueue.main.async {
                            self.viewController?.fetchMembers()
                        }
                    }
                }
            }
            task.resume()
        } catch {
            print("🚨", error)
        }
    }
    
    
    
    
    
    
}
