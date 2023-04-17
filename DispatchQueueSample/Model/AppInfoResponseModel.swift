//
//  AppInfoResponseModel.swift
//  DispatchQueueSample
//
//  Created by jiwon Yoon on 2023/04/17.
//

import Foundation

struct AppInfoResponseModel: Decodable {
    let resultCount: Int
    let results: [AppInfoModel]
}

struct AppInfoModel: Decodable, Hashable {
    let isGameCenterEnabled: Bool
    let supportedDevices: [String]
    let advisories: [String]
    let features: [String]
    let appletvScreenshotUrls: [String]
    let screenshotUrls: [String]
    let ipadScreenshotUrls: [String]
    let artworkUrl512: String
    let kind: String
    let artworkUrl60: String
    let artworkUrl100: String
    let artistViewUrl: String
    let trackCensoredName: String
    let trackViewUrl: String
    let releaseNotes: String
    let artistId: Int
    let artistName: String
    let genres: [String]
    let price: Double
    let description: String
    let bundleId: String
    let sellerName: String
    let primaryGenreName: String
    let primaryGenreId: Int
    let trackId: Int
    let trackName: String
    let genreIds: [String]
    let releaseDate: String
    let isVppDeviceBasedLicensingEnabled: Bool
    let currentVersionReleaseDate: String
    let averageUserRatingForCurrentVersion: Double
    let userRatingCountForCurrentVersion: Int
    let fileSizeBytes: String
    let sellerUrl: String
    let formattedPrice: String
    let trackContentRating: String
    let languageCodesISO2A: [String]
    let minimumOsVersion: String
    let version: String
    let wrapperType: String
    let contentAdvisoryRating: String
    let averageUserRating: Double
    let currency: String
    let userRatingCount: Int
}
