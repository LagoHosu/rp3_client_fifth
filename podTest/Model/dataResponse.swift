//
//  dataStruct.swift
//  podTest
//
//  Created by Lago on 2021/08/09.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct dataResponse: Codable {
    let currentCount: Int
    let data: [Datum]
    let matchCount, page, perPage, totalCount: Int
}

// MARK: - Datum
struct Datum: Codable {
    let address, centerName: String
    let centerType: CenterType
    let createdAt, facilityName: String
    let id: Int
    let lat, lng: String
    let org: Org
    let phoneNumber, sido, sigungu, updatedAt: String
    let zipCode: String
}

enum CenterType: String, Codable {
    case 중앙권역 = "중앙/권역"
    case 지역 = "지역"
}

enum Org: String, Codable {
    case empty = ""
    case 국립중앙의료원 = "국립중앙의료원"
    case 순천향대천안병원 = "순천향대 천안병원"
    case 양산부산대병원 = "양산 부산대병원"
    case 조선대병원 = "조선대병원"
}
