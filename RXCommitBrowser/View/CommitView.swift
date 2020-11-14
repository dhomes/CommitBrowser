//
//  CommitView.swift
//  RXCommitBrowser
//
//  Created by dhomes on 11/13/20.
//

import SwiftUI
import SwURL

struct CommitView: View {
    var commit : Commit
    private let avatarSize : CGFloat = 50
    private let appearance = CommitAppearance()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Text(commit.message)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(appearance.titleColor))
            Text(commit.hash)
                .font(.body)
                .foregroundColor(.gray).lineLimit(1)
            HStack(alignment: .center, spacing: 5, content: {
                ZStack {
                    if commit.authorImageUrl != nil {
                        RemoteImageView(
                            url: commit.authorImageUrl!,
                                        placeholderImage: Image(systemName: "person.crop.circle.fill"),
                                        transition: .custom(transition: .opacity, animation: .easeOut(duration: 0.5))
                                    ).imageProcessing({ image in
                                        return image
                                            .resizable()
                                            .renderingMode(.original)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: avatarSize, height: avatarSize)
                                            .clipShape(Circle())
                                            .overlay(Circle().stroke(Color(appearance.borderColor), lineWidth: 2))
                                            
                                    })
                    } else {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.gray)
                            .frame(width: avatarSize, height: avatarSize)
                    }
                }
                
                VStack(alignment: .leading, spacing: 5, content: {
                    Text(commit.authorName)
                        .font(.body)
                    Text(commit.email)
                        .font(.caption2)
                    Text(commit.date.commitFormat)
                        .font(.caption2)
                        .foregroundColor(.gray)
                })
            })
            
                
        }.padding()
    }
    

}

struct CommitView_Previews: PreviewProvider {
    static var previews: some View {
        CommitView(commit: MockCommit())
        
    }
}
