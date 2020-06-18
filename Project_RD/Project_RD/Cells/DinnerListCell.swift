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
    private var shadowView: UIView = UIView() // Container for shadows.
    private var containerView: UIView = UIView() // For easier constraining against border.
    
    private var titleLabel: UILabel = UILabel()
    private var descriptionLabel: UILabel = UILabel()
    
    private var dateLabel: UILabel = UILabel()
    
    private var attendeesSeperator: UIView = UIView()
    private var hostsStackView: UIStackView = UIStackView()
    private var hostsLabel: UILabel = UILabel()
    private var attendeesIndicators: UIStackView = UIStackView()
    
    // MARK: Static values
    static let identifier: String = "dinnerListIdentifier"
    
    private func initializeSelf() {
        
        
        insertAndAnchorChildren()
        setupVisuals()
        
    }
    
    private func setupVisuals() {
        containerView.layer.cornerRadius = 8
        shadowView.backgroundColor = .systemBackground
//        shadowView.layer.shadowColor = UIColor.green.cgColor
        shadowView.layer.cornerRadius = containerView.layer.cornerRadius
        shadowView.layer.shadowRadius = 2
        shadowView.layer.shadowOpacity = 0.3
        shadowView.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        titleLabel.font = titleLabel.font.withSize(20)
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = descriptionLabel.textColor.adjustBrightness(by: 40)
        
        
        // Attendees section
        attendeesSeperator.backgroundColor = .systemGray
        attendeesSeperator.alpha = 0.2
        
        hostsStackView.alignment = .trailing
        hostsStackView.spacing = -8
        
        attendeesIndicators.spacing = -8
        
        
    }
    
    public func configureFrom(dinner: Dinner) {
        self.titleLabel.text = dinner.title
        self.descriptionLabel.text = dinner.description
        self.dateLabel.text = "Tirsdag d. 16/6 - 2020" // TODO: Switch to non-static value
        
        AttendeeImage.produceAttendeesIndicators(for: dinner, attendeesReciever: attendeesIndicators, hostsReciever: hostsStackView)
        
        self.hostsLabel.text = dinner.hostedBy.count == 1 ? dinner.hostedBy[0]?.firstName : {
            var text = dinner.hostedBy[0]?.firstName ?? ""
            for index in 1..<dinner.hostedBy.count {
                if index + 1 == dinner.hostedBy.count {
                    text += " & " + dinner.hostedBy[index]!.firstName
//                    break
                } else {
                    text += ", " + dinner.hostedBy[index]!.firstName
                }
            }
            return text
        }()
        print("Host label:", self.hostsLabel.text)
//        hostsStackView.addSubview(hostsLabel)
    }
    
    override func prepareForReuse() {
        self.attendeesIndicators.arrangedSubviews.forEach({ view in
            view.removeFromSuperview()
        })
    }
}


// MARK: SnapKit
extension DinnerListCell {
    private func insertAndAnchorChildren() {
        contentView.addSubview(shadowView)
        contentView.addSubview(containerView)
        
        containerView.addSubview(dateLabel)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        
        containerView.snp.makeConstraints({ make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
        })
        
        shadowView.snp.makeConstraints({ make in
            make.edges.equalTo(containerView)
        })
        
        // Information section
        dateLabel.snp.makeConstraints({ make in
            make.top.equalToSuperview().inset(8)
            make.trailing.equalToSuperview().inset(8)
            make.leading.equalToSuperview().inset(8)
        })
        
        titleLabel.snp.makeConstraints({ make in
            make.top.equalTo(dateLabel.snp.bottom).inset(-4)
            make.leading.equalToSuperview().inset(8)
//            make.trailing.equalTo(dateLabel.snp.leading).inset(-8)
            make.trailing.equalToSuperview().inset(8)
            make.height.equalTo(20)
        })
        
        descriptionLabel.snp.makeConstraints({ make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.equalToSuperview().inset(8)
            make.trailing.equalToSuperview().inset(8)
            make.height.equalTo(60)
        })
        
        
        
        // Attendees section
        containerView.addSubview(attendeesSeperator)
        containerView.addSubview(hostsLabel)
        containerView.addSubview(hostsStackView)
        containerView.addSubview(attendeesIndicators)
        
        attendeesSeperator.snp.makeConstraints({ make in
            make.top.equalTo(descriptionLabel.snp.bottom).inset(-8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(1)
        })
        
        hostsStackView.snp.makeConstraints({ make in
            make.top.equalTo(attendeesSeperator.snp.bottom).inset(-8)
            make.trailing.equalToSuperview().inset(8)
            make.leading.equalTo(hostsLabel).inset(8).priority(950)
            make.height.equalTo(32)
        })
        
        hostsLabel.snp.makeConstraints({ make in
            make.height.equalTo(32)
            make.top.equalTo(attendeesSeperator.snp.bottom).inset(-8)
            make.leading.equalToSuperview().inset(8)
        })
        
        attendeesIndicators.snp.makeConstraints({ make in
            make.top.equalTo(hostsStackView.snp.bottom).inset(-8)
            make.height.equalTo(32)
            make.leading.equalToSuperview().inset(8)
//            make.trailing.equalToSuperview().inset(8)
        })
    }
}
