//
//  SightingListItemView.swift
//  FlowrSpot
//
//  Created by Alen Sebalj on 12.11.2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import Foundation
import SwiftUI

struct SightingListItemView: View {
    let sighting: Sighting

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            SightingImageView(url: sighting.picture, flower: sighting.flower)
                .frame(height: 280)
            VStack(spacing: 20) {
                SightingInfoView(sightingName: sighting.name, userName: sighting.user.fullName)
                Text(sighting.description)
                    .font(Font(UIFont.custom(type: .regular, size: 13)))
                    .foregroundStyle(Color(.flowrDarkGray))
                Divider()
                    .frame(height: 1)
                    .background(Color(.flowrDarkGray))
                LikesCommentsView(
                    commentsCount: sighting.commentsCount,
                    likesCount: sighting.likesCount,
                    onCommentsTapped: {},
                    onLikesTapped: {}
                )
            }
            .padding([.leading, .trailing], 27)
        }
        .padding(.bottom, 20)
    }
}

struct SightingImageView: View {
    let url: URL?
    let flower: Sighting.Flower

    var body: some View {
        ZStack(alignment: .bottom) {
            RemoteImage(url: url)
            VStack(spacing: 7) {
                Text(flower.name)
                    .font(Font(UIFont.custom(type: .regular, size: 20)))
                Text(flower.latinName)
                    .font(Font(UIFont.custom(type: .italic, size: 12)))
            }
            .padding(.bottom, 30)
        }
    }
}

struct SightingInfoView: View {
    let sightingName: String
    let userName: String

    var body: some View {
        HStack(spacing: 40) {
            RemoteImage(url: nil, placeholderImage: placeholderImage)
                .frame(width: 40, height: 40)
            VStack(alignment: .leading, spacing: 5) {
                Text(sightingName)
                    .font(Font(UIFont.custom(type: .regular, size: 15)))
                    .foregroundStyle(Color(.flowrGray))
                Text("authored".localized(userName))
                    .font(Font(UIFont.custom(type: .italic, size: 12)))
                    .foregroundStyle(Color(.flowrDarkGray))
            }
            Spacer()
        }
    }

    @ViewBuilder
    private var placeholderImage: some View {
        Image(systemName: "person.circle.fill")
            .resizable()
            .foregroundStyle(Color(.flowrGray))
    }
}

struct LikesCommentsView: View {
    let commentsCount: Int
    let likesCount: Int
    let onCommentsTapped: () -> Void
    let onLikesTapped: () -> Void

    var body: some View {
        HStack(spacing: 48) {
            HStack(spacing: 10) {
                Image(systemName: "ellipsis.message.fill")
                Text("comments_count".localized(commentsCount))
                    .font(Font(UIFont.custom(type: .regular, size: 12)))
            }
            .onTapGesture(perform: onCommentsTapped)
            HStack(spacing: 10) {
                Image(systemName: "heart.fill")
                Text("favorites_count".localized(likesCount))
                    .font(Font(UIFont.custom(type: .regular, size: 12)))
            }
            .onTapGesture(perform: onLikesTapped)
            Spacer()
        }
        .foregroundStyle(Color(.flowrDarkGray))
    }
}
