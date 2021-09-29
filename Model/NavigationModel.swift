import Foundation
import SwiftUI

final class NavigationModel: ObservableObject {
    enum TabSelection: Hashable {
        case watchNow, subscriptions, popular, trending, playlists, channel(String), playlist(String), recentlyOpened(String), search
    }

    @Published var tabSelection: TabSelection! = .watchNow

    @Published var showingVideo = false
    @Published var video: Video?

    @Published var returnToDetails = false

    @Published var presentingAddToPlaylist = false
    @Published var videoToAddToPlaylist: Video!

    @Published var presentingPlaylistForm = false
    @Published var editedPlaylist: Playlist!

    @Published var presentingUnsubscribeAlert = false
    @Published var channelToUnsubscribe: Channel!

    @Published var isChannelOpen = false
    @Published var sidebarSectionChanged = false

    @Published var presentingSettings = false

    func playVideo(_ video: Video) {
        self.video = video
        showingVideo = true
    }

    var tabSelectionBinding: Binding<TabSelection> {
        Binding<TabSelection>(
            get: {
                self.tabSelection ?? .watchNow
            },
            set: { newValue in
                self.tabSelection = newValue
            }
        )
    }

    func presentAddToPlaylist(_ video: Video) {
        videoToAddToPlaylist = video
        presentingAddToPlaylist = true
    }

    func presentEditPlaylistForm(_ playlist: Playlist?) {
        editedPlaylist = playlist
        presentingPlaylistForm = editedPlaylist != nil
    }

    func presentNewPlaylistForm() {
        editedPlaylist = nil
        presentingPlaylistForm = true
    }

    func presentUnsubscribeAlert(_ channel: Channel?) {
        channelToUnsubscribe = channel
        presentingUnsubscribeAlert = channelToUnsubscribe != nil
    }
}

typealias TabSelection = NavigationModel.TabSelection