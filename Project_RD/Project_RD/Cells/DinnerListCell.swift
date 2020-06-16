//
//  DinnerListCell.swift
//  Project_RD
//
//  Created by Christian Amstrup Petersen on 16/06/2020.
//  Copyright © 2020 Christian Amstrup Petersen. All rights reserved.
//

import UIKit
import SnapKit

class DinnerListCell: UITableViewCell { // SnapKit usage only.
    // Required and unused.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        // CellStyle overriden as the cell will use customized design.
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        initializeSelf()
    }
    
    convenience init(reuseIdentifier: String) {
        // Forced use of overriden init.
        self.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    // MARK: Views/Children
    private var containerView: UIView = UIView() // For easier constraining against border.
    
    private var titleLabel: UILabel = UILabel()
    private var descriptionLabel: UILabel = UILabel()
    
    private var dateLabel: UILabel = UILabel()
    
    // MARK: Static values
    static let identifier: String = "dinnerListIdentifier"
    
    private func initializeSelf() {
        
        self.insertAndAnchorChildren()
    }
    
    public func configureFrom(dinner: Dinner) {
        self.titleLabel.text = dinner.title
        self.descriptionLabel.text = dinner.description
        self.dateLabel.text = "16/6 - 2020" // TODO: Switch to non-static value
    }
}


// MARK: SnapKit
extension DinnerListCell {
    private func insertAndAnchorChildren() {
        contentView.addSubview(containerView)
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        
        containerView.addSubview(dateLabel)
        
        containerView.snp.makeConstraints({ make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
        })
        
        titleLabel.snp.makeConstraints({ make in
            make.top.equalToSuperview().inset(16)
            make.leading.equalToSuperview().inset(8)
            make.trailing.equalTo(dateLabel.snp.leading).inset(8)
        })
        
        descriptionLabel.snp.makeConstraints({ make in
            make.top.equalTo(titleLabel.snp.bottom).inset(16)
            make.leading.equalToSuperview().inset(8)
            make.trailing.equalToSuperview().inset(8)
        })
        
        dateLabel.snp.makeConstraints({ make in
            make.top.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(8)
        })
    }
}
