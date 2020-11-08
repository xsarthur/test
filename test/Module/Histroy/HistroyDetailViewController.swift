//
//  ViewController.swift
//  test
//
//  Created by 熊盛 on 2020/11/8.
//

import UIKit

class HistroyDetailViewController: UIViewController {
    
    let textView = UITextView()
    var dataSource = [String:String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "详情"
        view.backgroundColor = .white
        
        textView.isEditable = false
        view.addSubview(textView)
        
        textView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(15)
            $0.right.equalToSuperview().offset(-15)
            $0.top.equalToSuperview().offset(5)
            $0.bottom.equalToSuperview()
        }
        
        textView.text = dataSource.toJsonString()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
