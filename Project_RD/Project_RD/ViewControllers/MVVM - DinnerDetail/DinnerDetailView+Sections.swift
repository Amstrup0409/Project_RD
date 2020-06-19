//
//  DinnerDetailView.swift
//  Project_RD
//
//  Created by Christian Amstrup Petersen on 19/06/2020.
//  Copyright © 2020 Christian Amstrup Petersen. All rights reserved.
//

import SwiftUI

struct DinnerDetailView: View {
    var actionDelegate: DinnerDetailController?
    let dinnerVM: DinnerDetailViewModel
    
    init(_ dinnerVM: DinnerDetailViewModel) {
        self.dinnerVM = dinnerVM
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                DateAndDistanceSection(self.dinnerVM)
                Divider()
                TitleAndDescriptionSection(self.dinnerVM)
                Divider()
                Button("Close me") {
                    guard let delegate = self.actionDelegate else { print("No action"); return }
                    delegate.dismiss()
                }
                ThemeSection(dinnerVM)
                DietaryInfomationSection(dinnerVM)
                Spacer()
            }.padding([.horizontal, .top], 16)
        }
    }
    
}

struct DateAndDistanceSection: View {
    
    private var dateString: String
    private var distanceString: String
    
    init(_ dinnerVM: DinnerDetailViewModel) {
        self.dateString = dinnerVM.getLocalizedDateString()
        self.distanceString = dinnerVM.getLocalizedDistanceString()
    }
    
    var body: some View {
        HStack {
            Text(dateString)
            Spacer()
            Text(distanceString)
        }
    }
}

struct TitleAndDescriptionSection: View {
    private var title: String
    private var description: String?
    
    init(_ dinnerVM: DinnerDetailViewModel) {
        self.title = dinnerVM.getTitle()
        self.description = dinnerVM.getDescription()
    }
    
    var body: some View {
        VStack {
            Text(title)
                .frame(width: UIScreen.main.bounds.width-32, alignment: .leading)
                .font(.largeTitle)
                .background(Color.yellow)
            Text(description)
                .font(.body)
                .lineLimit(nil)
        }
    }
}

struct ThemeSection: View {
    private var theme: DinnerEnums.Theme
    
    private init(_ theme: DinnerEnums.Theme) {
        self.theme = theme
    }
    
    init?(_ dinnerVM: DinnerDetailViewModel) {
        guard let theme = dinnerVM.getTheme() else { return nil }
        self.init(theme)
    }
    
    var body: some View {
        VStack {
            Divider()
            Text(self.theme.rawValue)
        }
    }
}

struct DietaryInfomationSection: View {
    private var allergies: [Allergies?]?
    private var lifestyles: [Lifestyle?]?
    
    private init(_ restrictions: DietaryRestrictions) {
        self.allergies = restrictions.allergies
        self.lifestyles = restrictions.lifestyles
    }
    
    init?(_ dinnerVM: DinnerDetailViewModel) {
        guard let res = dinnerVM.getRestrictions() else { return nil }
        self.init(res)
    }
    
    var body: some View {
        VStack {
            subsection(allergies)
            subsection(lifestyles)
        }
    }
    
    struct subsection: View {
        
        private var typesWrapped: [TypeWrapper]
        
        private init(_ v: [RestrictionValue]) {
            typesWrapped = v.map { v -> TypeWrapper in
                TypeWrapper(value: v)
            }
        }
        
        init?(_ v: [RestrictionValue?]?) {
            guard let v = v, let vUnpacked = v as? [RestrictionValue] else { return nil }
            self.init(vUnpacked)
        }
        
        var body: some View {
            VStack {
                Divider()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(typesWrapped, id: \.self.id, content: { t in
                            self.createIcon(RestrictionHandler.identifyAndFetchInfo(of: t.value))
                        })
                    }
                    Spacer()
                }
            }
        }
        
        func createIcon(_ res: (image: UIImage, text: String)) -> some View {
            VStack {
                Circle()
                    .fill(Color.green.opacity(0.2))
                    .overlay(
                        Image(uiImage: res.image)
                )
                Text(res.text)
            }.frame(width: 50, height: 70, alignment: .center)
        }
    }
}

