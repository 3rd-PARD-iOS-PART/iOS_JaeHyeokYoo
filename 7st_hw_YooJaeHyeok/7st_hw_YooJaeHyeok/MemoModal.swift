//
//  MemoModal.swift
//  7st_hw_YooJaeHyeok
//
//  Created by 유재혁 on 5/16/24.
//

import Foundation

    //json쓰려면 필요하니까 decodable(출력), encodable(입력)
struct MemoModel: Decodable, Encodable {
    // 이건 데이터 형식만 설정해주는 부분
    let id: Int?
    let name: String
    let part: String
    let age: Int
    
    //얘는 약간 초기함수처럼 쓰이는데 데이터 값 받아올 때 입력 되게 설정하는거임. id는 비어있어야하는데 값이 입력되면 안되니깐 이렇게 설정해서 nil 넣어주는거임
    init(name: String, part: String, age: Int) {
        self.id = nil // ID는 새로운 멤버를 추가할 때 nil로 설정됩니다.
        self.name = name
        self.part = part
        self.age = age
    }
}
