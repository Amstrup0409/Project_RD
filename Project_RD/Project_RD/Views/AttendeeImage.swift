//
//  UserImage.swift
//  Project_RD
//
//  Created by Christian Amstrup Petersen on 16/06/2020.
//  Copyright © 2020 Christian Amstrup Petersen. All rights reserved.
//

import UIKit


enum AttendeeRole {
    case Host
    case Attendee
    case Missing
}

class AttendeeImage: UIView {
    // Required and unused.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(attendee: User?, host: Bool = false) {
        super.init(frame: CGRect(x: 0, y: 0, width: 32, height: 32)) // TODO: Switch to non-static value
        
        insertAndAnchorChildren()
        
        guard let attendee = attendee else { setupVisuals(for: .Missing); return }
        if host { setupVisuals(for: .Host, withImage: attendee.getImage()) } else {
            setupVisuals(for: .Attendee, withImage: attendee.getImage())
        }
    }
    
    // MARK: Views/Children
    private var imageView: UIImageView = UIImageView()
    
    static func produceAttendeesIndicators(for dinner: Dinner, reciever stackView: UIStackView) {        
        dinner.hostedBy.forEach({ host in
            stackView.addArrangedSubview(AttendeeImage(attendee: host, host: true))
        })
        
        dinner.guests.forEach({ user in
            stackView.addArrangedSubview(AttendeeImage(attendee: user))
        })
        
        for _ in 0...dinner.getRemainingCapacity() {
            stackView.addArrangedSubview(AttendeeImage(attendee: nil))
        }
    }
}

extension AttendeeImage {
    private func insertAndAnchorChildren() {
        self.addSubview(imageView)
        
        imageView.snp.makeConstraints({ make in
            make.edges.equalToSuperview().inset(4)
            make.height.equalTo(imageView.snp.width)
        })
        
        self.layer.borderWidth = 2 // TODO: Switch to non-static value
        self.layer.cornerRadius = 16 // TODO: Switch to non-static value
        
    }
    
    private func setupVisuals(for role: AttendeeRole, withImage userImage: UIImage? = nil) {
        switch role {
        case .Host:
            imageView.image = userImage != nil ? userImage : UIImage(systemName: "sun.min") // TODO: Placeholder Image
            changeTintColor(to: .systemGreen)
            return
        case .Attendee:
            changeTintColor(to: .systemBlue)
            imageView.image = userImage != nil ? userImage : UIImage(systemName: "person")
            return
        case .Missing:
            changeTintColor()
            imageView.image = UIImage(systemName: "questionmark")
            return
        }
    }
    
    private func changeTintColor(to color: UIColor = .systemGray) {
        imageView.tintColor = color
        self.backgroundColor = color.adjustBrightness(by: 40)
        self.layer.borderColor = color.cgColor
    }
}

