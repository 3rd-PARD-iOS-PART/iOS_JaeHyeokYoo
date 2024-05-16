//
//  ModalViewController.swift
//  7st_hw_YooJaeHyeok
//
//  Created by 유재혁 on 5/16/24.
//

import UIKit

class ModalViewController: UIViewController {
        
   private let submitButton: UIButton = {
       let button = UIButton(type: .system) // type: .system 이 뭐지
        button.setTitle("추가하기", for: .normal)
        button.tintColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        return button
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력하세요"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var partTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "파트를 입력하세요"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var ageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "나이를 입력하세요"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // 이거 하는 이유가 ViewController을 불러와서 안에 있는 함수 쓰려고 하는건가?
    private let viewController: ViewController
    
    init(viewController: ViewController) {
        self.viewController = viewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
    }
    
    private func setUI() {
        view.addSubview(nameTextField)
        view.addSubview(partTextField)
        view.addSubview(ageTextField)
        view.addSubview(submitButton)
        
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 75),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            partTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            partTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            partTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            ageTextField.topAnchor.constraint(equalTo: partTextField.bottomAnchor, constant: 16),
            ageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            ageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            submitButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            submitButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    // 추가하기 버튼을 눌렀을 때 함수. 변수에다가 입력값의 text넣어주고
    @objc private func dismissViewController() {
        guard let name = nameTextField.text, !name.isEmpty,
              let part = partTextField.text, !part.isEmpty,
              let ageString = ageTextField.text, !ageString.isEmpty,
              let age = Int(ageString) else {
            showAlert(title: "입력 오류", message: "모든 필드를 올바르게 입력해주세요.")
            return
        }
        //MemoModel 이용해서 newMemo에 값 넣어주고 그걸 이용해서 makePostRequest라는 put하는 함수 시작.
        let newMember = MemoModel(name: name, part: part, age: age)
        makePostRequest(newMember)
        dismiss(animated: true) // 현재 뷰 컨트롤러를 dimiss(닫기)
    }
    
    private func showAlert(title: String, message: String) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
//        present(alert, animated: true, completion: nil)
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert) // 여기가 alert창 만드는 부분
        let check = UIAlertAction(title: "확인", style: .default, handler: nil)   // 이건 alert창에 넣을 값 만들어 주는 곳
//        let close = UIAlertAction(title: "닫기", style: .destructive, handler: nil)     // 이건 닫기버튼 만들기.
        
        alert.addAction(check)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    // Post request 보내는 함수
       func makePostRequest(_ memo: MemoModel) {
           guard let url = URL(string: "https://pard-host.onrender.com/pard") else {
               print("🚨 Invalid URL")
               return
           }
           
           var request = URLRequest(url: url)
           request.httpMethod = "POST"
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
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
                               self.viewController.fetchMembers()
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


