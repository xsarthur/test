//
//  HistroyListViewController.swift
//  test
//
//  Created by 熊盛 on 2020/11/8.
//

import UIKit
import MJRefresh

class HistroyListViewController: UIViewController {
    let tableView = UITableView.init(frame: .zero, style: .plain)
    var dataSource:Array<Dictionary<String,String>> = [Dictionary<String,String>()]
    var pageNum = 1
    let pageSize = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "历史记录"
        setupTableView()
        initData()
        tableView.reloadData()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        tableView.register(HistroyListTableViewCell.self, forCellReuseIdentifier: HISTROYCELLID)
        
        tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock:{[weak self] in
            self?.tableView.mj_header?.endRefreshing()
            self?.tableView.mj_footer?.endRefreshing()
            self?.initData()
            self?.pageNum = 1
            
            if (self?.pageNum ?? 0)*(self?.pageSize ?? 10) > self?.dataSource.count ?? 0 {
                self?.tableView.mj_footer?.endRefreshingWithNoMoreData()
            }
            
            self?.tableView.reloadData()
        })
        
        tableView.mj_footer = MJRefreshBackNormalFooter.init(refreshingBlock: {[weak self] in
            self?.tableView.mj_footer?.endRefreshing()
            self?.pageNum += 1
            if (self?.pageNum ?? 0)*(self?.pageSize ?? 10) > self?.dataSource.count ?? 0 {
                self?.tableView.mj_footer?.endRefreshingWithNoMoreData()
            }
            self?.tableView.reloadData()
        })

    }
    
    func initData() {
        if let array = UserDefaults.standard.object(forKey: GITDATA) as? Array<Dictionary<String,String>> {
            dataSource = array
            self.title = "历史记录(\(dataSource.count))"
        }
    }

}

extension HistroyListViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataSource.count > pageNum*pageSize {
            return pageNum*pageSize
        }
        else {
            return dataSource.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HISTROYCELLID) as! HistroyListTableViewCell
        let model = dataSource[indexPath.row]
        if let key = model.keys.first {
            cell.keyLabel.text = "\(indexPath.row).\(model[GITDATATIME] ?? "") \(key))"
            cell.valueLabel.text = "\(model[key] ?? "")"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = HistroyDetailViewController.init()
        vc.dataSource = dataSource[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
