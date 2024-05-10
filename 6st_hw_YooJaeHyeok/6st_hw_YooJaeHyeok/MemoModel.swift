//
//  MemoModel.swift
//  6st_hw_YooJaeHyeok
//
//  Created by 유재혁 on 5/8/24.
//
// 이거 모름
import Foundation

struct MemoModel: Decodable, Encodable {
    let id: Int?
    let name: String
    let part: String
    let age: Int
    
    init(name: String, part: String, age: Int) {
        self.id = nil // ID는 새로운 멤버를 추가할 때 nil로 설정됩니다.
        self.name = name
        self.part = part
        self.age = age
    }
}
