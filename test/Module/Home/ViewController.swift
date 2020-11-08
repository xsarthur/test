//
//  ViewController.swift
//  test
//
//  Created by 熊盛 on 2020/11/6.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    
    let textView = UITextView()
    var dataSrouce:Dictionary<String,String> = ["":""] {
        willSet {
            textView.text = newValue.toJsonString()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNoti()
        configNavi()
        setupUI()
        initData()
    }
    
    func configNavi() {
        self.title = "首页"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "历史记录", style: .plain, target: self, action: #selector(pushToHistroy))
    }
    
    func setupNoti() {
        NotificationCenter.default.addObserver(self, selector: #selector(receiveNoti), name: NSNotification.Name(rawValue: GITNOTIFICATION), object: nil)
    }
    
    func setupUI() {
        textView.isEditable = false
        view.addSubview(textView)
        
        textView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(15)
            $0.right.equalToSuperview().offset(-15)
            $0.top.equalToSuperview().offset(5)
            $0.bottom.equalToSuperview()
        }
    }
    
    @objc func initData() {
        if let array = UserDefaults.standard.object(forKey: GITDATA) as? Array<Dictionary<String,String>>, array.count > 0{
            dataSrouce = array.first ?? ["":""]
        }
        else {
            textView.text = "稍等，暂无数据"
        }
    }
    
    @objc func receiveNoti(noti:Notification) {
        if let dic = noti.userInfo as? [String:String] {
            dataSrouce = dic
        }
    }
    
    @objc func pushToHistroy() {
        navigationController?.pushViewController(HistroyListViewController(), animated: true)
    }
    
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

