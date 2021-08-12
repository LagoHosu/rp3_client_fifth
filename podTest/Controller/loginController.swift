//
//  ViewController.swift
//  podTest
//
//  Created by Lago on 2021/08/07.
//

import UIKit
import Foundation
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class loginController: UIViewController {
    //let AuthApi = AuthApi()

    //MARK: - Properties
    
    var tabViewController = TabViewController()
    
    var age = AgeRange(rawValue: "")
    var birthday  = ""  //need to change the value
    
    var nameArray = [] as Array
    var addressArray = [] as Array
    var phoneArray = [] as Array

    var sido = ""
    var sigungu = ""
    var facilityName = ""
    var address = ""
    var centerType = ""
    var phoneNumber = ""

    
    //MARK: - Actions
    
    
    func didTapKakaoLogin() {
        /// 카카오 간편 로그인
        // 카카오톡 설치 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                    
                }
            }
        } else {
          // 카카오 계정으로 로그인
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("loginWithKakaoAccount() success.")

                        //do something
                        _ = oauthToken
                        
                        UserApi.shared.me() {(user, error) in
                            if let error = error {
                                print(error)
                            }
                            else {
                                print("me() success.")

                                //do something
                                _ = user
                                self.age = user?.kakaoAccount?.ageRange
                                self.birthday = (user?.kakaoAccount?.birthday)!
                            }
                            print(self.birthday, "is birthday in loginController")  //0503
                            print(self.age!, "is age in loginController")  //Age20_29


                            //if login success, move to paging Controller
                            guard let vcName = self.storyboard?.instantiateViewController(withIdentifier: "TabViewController") as? TabViewController else { return }
                            vcName.agePassing = self.age
                            vcName.birthdayPassing = self.birthday
                            
                            vcName.centerPassing = self.nameArray
                            vcName.addressPassing = self.addressArray
                            vcName.numberPassing = self.phoneArray
                            
                            print(self.nameArray, "is namearray in loginController")

                            
                            //self.navigationController?.pushViewController(vcName, animated: true)
                            self.present(vcName, animated: true, completion: nil)
                        }
                    }
                }
        }
      }
    
    
    @IBAction func kakaoLogin(_ sender: Any) {
        print(self.nameArray, "is nameArray in kakaologin()")
        didTapKakaoLogin()
    }
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        centerRequest().getCenterData(self)
              //success to get API data
        //need to datapass array to pagingController/centerController
        
        
    }
    
    //MARK: - Helper



}


extension loginController {
    func didSuccess(_ response: dataResponse) {
        for i in 0...response.data.count-1 {
//            tabViewController.centerPassing.append(response.data[i].facilityName)
//            tabViewController.addressPassing.append(response.data[i].address)
//            tabViewController.numberPassing.append(response.data[i].phoneNumber)
         
            nameArray.append(response.data[i].facilityName)
            addressArray.append(response.data[i].address)
            phoneArray.append(response.data[i].phoneNumber)
            
//            addressArray.append(response.data[i].address)
//            phoneArray.append(response.data[i].phoneNumber)
            
            
        }
        //print(tabViewController.centerPassing, "in didSuccess()")
        print(nameArray, "is name array in didSuccess()")
    }
   
}
