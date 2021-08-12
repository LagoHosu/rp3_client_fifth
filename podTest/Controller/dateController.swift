//
//  dateController.swift
//  podTest
//
//  Created by Lago on 2021/08/10.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class dateController : UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var textLable1: UILabel?
    @IBOutlet weak var textLabel2: UILabel!
    @IBOutlet weak var textLabel3: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    
    var vaccineDay = 0
    var availability = false
    var month = ""
    var day = ""
    
    //MARK: - Actions
    var userAge = AgeRange(rawValue: "")
    var userBirthday = ""
    
    var onAugust = ["20~29", "30~39", "40~49"]
    
    func divideBirthday() {
        let monthFirst = userBirthday.index(userBirthday.startIndex, offsetBy: 0)
        let monthLast = userBirthday.index(userBirthday.startIndex, offsetBy: 2)
        month = "\(userBirthday[monthFirst..<monthLast])"
        
        let dayFirst = userBirthday.index(userBirthday.startIndex, offsetBy: 2)
        let dayLast = userBirthday.index(userBirthday.startIndex, offsetBy: 4 )
        day = "\(userBirthday[dayFirst..<dayLast])"
    }
    
    func switchVaccineDay() {
        switch day.last {
        case "1":
            vaccineDay = 11
        case "2":
            vaccineDay = 12
        case "3":
            vaccineDay = 13
        case "4":
            vaccineDay = 14
        case "5":
            vaccineDay = 15
        case "6":
            vaccineDay = 16
        case "7":
            vaccineDay = 17
        case "8":
            vaccineDay = 18
        case "9":
            vaccineDay = 9
        case "0":
            vaccineDay = 10
        default:
            vaccineDay = 0000
        }
    }
    
    func ageRange() {
        if !(onAugust.contains(userAge!.rawValue))  {
            textLabel2.text = "8월 청장년층 접종 대상이 아닙니다."
            textLabel3.text = "접종 시기를 다시 확인해보세요!"
        }
    }
   
    
    
    //MARK: - Life cycle
    
    
    //MARK: - Helper
    

    override func viewDidLoad() {
        
        print(userAge!.rawValue, "is your age in bookingPage")
        print(userBirthday, "is your birthday in bookingPage")

        divideBirthday()
        switchVaccineDay()
        
        textLable1?.text = "\(month)월 \(day)일"
        textLabel2.text = "21년 8월 \(vaccineDay)일 20시부터"
        textLabel3.text = "8월 \(vaccineDay+1)일까지 예약하세요!"
        ageRange()
        
        backgroundView.layer.cornerRadius = 20
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("date view appeared")

    }
}
