//
//  HistroyListTableViewCell.swift
//  test
//
//  Created by 熊盛 on 2020/11/8.
//

import UIKit

class HistroyListTableViewCell: UITableViewCell {
    let keyLabel = UILabel()
    let valueLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    func setupUI() {
        keyLabel.numberOfLines = 0
        keyLabel.font = .systemFont(ofSize: 16)
        keyLabel.lineBreakMode = .byCharWrapping
        contentView.addSubview(keyLabel)
        
        valueLabel.numberOfLines = 0
        valueLabel.font = .systemFont(ofSize: 14)
        valueLabel.lineBreakMode = .byCharWrapping
        contentView.addSubview(valueLabel)
        
        keyLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(15)
            $0.top.equalToSuperview().offset(5)
            $0.bottom.equalToSuperview().offset(-5)
            $0.right.equalTo(self.contentView.snp.centerX).offset(-20)
        }
        
        valueLabel.snp.makeConstraints {
            $0.left.equalTo(self.contentView.snp.centerX)
            $0.top.equalToSuperview().offset(5)
            $0.bottom.equalToSuperview().offset(-5)
            $0.right.equalToSuperview().offset(-15)
        }
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
