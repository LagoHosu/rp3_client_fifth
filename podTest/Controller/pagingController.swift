//
//  pagingController.swift
//  podTest
//
//  Created by Lago on 2021/08/10.
//

import UIKit
import Tabman
import Pageboy

import KakaoSDKUser

class TabViewController: TabmanViewController {
    
    var agePassing = AgeRange(rawValue: "")
    var birthdayPassing  = ""
    
    var centerPassing = [] as Array
    var addressPassing = [] as Array
    var numberPassing = [] as Array
    
    var date = ""
    
    private var viewControllers: Array<UIViewController> = []
    
    func settingTabBar (ctBar : TMBar.ButtonBar) {
        ctBar.layout.transitionStyle = .snap
        // 왼쪽 여백주기
        ctBar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 23.0, bottom: 0.0, right: 23.0)
        
        // 간격
        ctBar.layout.interButtonSpacing = 20
        
        ctBar.backgroundView.style = .blur(style: .light)
        
        // 선택 / 안선택 색 + font size
        ctBar.buttons.customize { (button) in
            //button.
            button.tintColor = .systemGray2
            button.selectedTintColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
            button.font = UIFont.systemFont(ofSize: 16)
            button.selectedFont = UIFont.systemFont(ofSize: 16, weight: .medium)
        }
        
        // 인디케이터 (영상에서 주황색 아래 바 부분)
        ctBar.indicator.weight = .custom(value: 2)
        ctBar.indicator.tintColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc2 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "dateVC") as! dateController
        let vc3 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "centerVC") as! centerController
        
        viewControllers.append(vc2)
        viewControllers.append(vc3)
        
        //print("passed age is \(agePassing!) and birthday is \(birthdayPassing)")
        print("num of passed name is \(centerPassing.count)")

        vc2.userBirthday = self.birthdayPassing
        vc2.userAge = self.agePassing
        
        vc3.nameData = self.centerPassing
        vc3.addressData = self.addressPassing
        vc3.phoneData = self.numberPassing

        
        self.dataSource = self
        
        // Create bar
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap // Customize
        
        // Add to view
        addBar(bar, dataSource: self, at: .top)
        
        settingTabBar(ctBar: bar)
        
        
    }
}

extension TabViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    //the num of tab
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    //text that will shown on each tab
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "When can I book my vaccine?")
        case 1:
            return TMBarItem(title: "Vaccine centers location")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
    }
}

