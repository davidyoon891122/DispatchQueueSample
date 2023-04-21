//
//  AppInfoResponseModel.swift
//  DispatchQueueSample
//
//  Created by jiwon Yoon on 2023/04/17.
//

import Foundation

struct AppInfoResponseEntity: Decodable {
    let resultCount: Int
    let results: [AppInfoEntity]
}

struct AppInfoEntity: Decodable, Hashable {
    let isGameCenterEnabled: Bool
    let artistViewUrl: String?
    let appletvScreenshotUrls: [String]
    let ipadScreenshotUrls: [String]
    let artworkUrl100: String
    let artworkUrl60: String
    let artworkUrl512: String
    let screenshotUrls: [String]
    let features: [String]
    let advisories: [String]
    let supportedDevices: [String]
    let kind: String
    let currency: String
    let userRatingCountForCurrentVersion: Int
    let averageUserRating: Double
    let trackViewUrl: String
    let trackContentRating: String
    let minimumOsVersion: String
    let trackCensoredName: String
    let languageCodesISO2A: [String]
    let fileSizeBytes: String?
    let sellerUrl: String?
    let formattedPrice: String?
    let contentAdvisoryRating: String
    let averageUserRatingForCurrentVersion: Double
    let currentVersionReleaseDate: String
    let artistId: Int
    let artistName: String
    let genres: [String]
    let price: Double?
    let description: String
    let isVppDeviceBasedLicensingEnabled: Bool
    let releaseDate: String
    let releaseNotes: String?
    let sellerName: String
    let primaryGenreName: String
    let primaryGenreId: Int
    let genreIds: [String]
    let trackId: Int
    let trackName: String
    let bundleId: String
    let version: String
    let wrapperType: String
    let userRatingCount: Int
}

extension AppInfoEntity {
    static let item = AppInfoEntity(
        isGameCenterEnabled: false,
        artistViewUrl: nil,
        appletvScreenshotUrls: [
            "https://www.testscreenshots.com",
            "https://www.testscreenshots.com",
            "https://www.testscreenshots.com"
        ],
        ipadScreenshotUrls: [
            "https://www.testscreenshots.com",
            "https://www.testscreenshots.com",
            "https://www.testscreenshots.com"
        ],
        artworkUrl100: "https://www.testscreenshots.com",
        artworkUrl60: "https://www.testscreenshots.com",
        artworkUrl512: "https://www.testscreenshots.com",
        screenshotUrls: [
            "https://www.testscreenshots.com",
            "https://www.testscreenshots.com",
            "https://www.testscreenshots.com"
        ],
        features: [],
        advisories: [],
        supportedDevices: [
            "iPhone5s-iPhone5s",
            "iPadAir-iPadAir",
            "iPadAirCellular-iPadAirCellular",
            "iPadMiniRetina-iPadMiniRetina",
            "iPadMiniRetinaCellular-iPadMiniRetinaCellular",
            "iPhone6-iPhone6",
            "iPhone6Plus-iPhone6Plus",
            "iPadAir2-iPadAir2",
            "iPadAir2Cellular-iPadAir2Cellular",
            "iPadMini3-iPadMini3",
            "iPadMini3Cellular-iPadMini3Cellular",
            "iPodTouchSixthGen-iPodTouchSixthGen",
            "iPhone6s-iPhone6s",
            "iPhone6sPlus-iPhone6sPlus",
            "iPadMini4-iPadMini4",
            "iPadMini4Cellular-iPadMini4Cellular",
            "iPadPro-iPadPro",
            "iPadProCellular-iPadProCellular",
            "iPadPro97-iPadPro97",
            "iPadPro97Cellular-iPadPro97Cellular",
            "iPhoneSE-iPhoneSE",
            "iPhone7-iPhone7",
            "iPhone7Plus-iPhone7Plus",
            "iPad611-iPad611",
            "iPad612-iPad612",
            "iPad71-iPad71",
            "iPad72-iPad72",
            "iPad73-iPad73",
            "iPad74-iPad74",
            "iPhone8-iPhone8",
            "iPhone8Plus-iPhone8Plus",
            "iPhoneX-iPhoneX",
            "iPad75-iPad75",
            "iPad76-iPad76",
            "iPhoneXS-iPhoneXS",
            "iPhoneXSMax-iPhoneXSMax",
            "iPhoneXR-iPhoneXR",
            "iPad812-iPad812",
            "iPad834-iPad834",
            "iPad856-iPad856",
            "iPad878-iPad878",
            "iPadMini5-iPadMini5",
            "iPadMini5Cellular-iPadMini5Cellular",
            "iPadAir3-iPadAir3",
            "iPadAir3Cellular-iPadAir3Cellular",
            "iPodTouchSeventhGen-iPodTouchSeventhGen",
            "iPhone11-iPhone11",
            "iPhone11Pro-iPhone11Pro",
            "iPadSeventhGen-iPadSeventhGen",
            "iPadSeventhGenCellular-iPadSeventhGenCellular",
            "iPhone11ProMax-iPhone11ProMax",
            "iPhoneSESecondGen-iPhoneSESecondGen",
            "iPadProSecondGen-iPadProSecondGen",
            "iPadProSecondGenCellular-iPadProSecondGenCellular",
            "iPadProFourthGen-iPadProFourthGen",
            "iPadProFourthGenCellular-iPadProFourthGenCellular",
            "iPhone12Mini-iPhone12Mini",
            "iPhone12-iPhone12",
            "iPhone12Pro-iPhone12Pro",
            "iPhone12ProMax-iPhone12ProMax",
            "iPadAir4-iPadAir4",
            "iPadAir4Cellular-iPadAir4Cellular",
            "iPadEighthGen-iPadEighthGen",
            "iPadEighthGenCellular-iPadEighthGenCellular",
            "iPadProThirdGen-iPadProThirdGen",
            "iPadProThirdGenCellular-iPadProThirdGenCellular",
            "iPadProFifthGen-iPadProFifthGen",
            "iPadProFifthGenCellular-iPadProFifthGenCellular",
            "iPhone13Pro-iPhone13Pro",
            "iPhone13ProMax-iPhone13ProMax",
            "iPhone13Mini-iPhone13Mini",
            "iPhone13-iPhone13",
            "iPadMiniSixthGen-iPadMiniSixthGen",
            "iPadMiniSixthGenCellular-iPadMiniSixthGenCellular",
            "iPadNinthGen-iPadNinthGen",
            "iPadNinthGenCellular-iPadNinthGenCellular",
            "iPhoneSEThirdGen-iPhoneSEThirdGen",
            "iPadAirFifthGen-iPadAirFifthGen",
            "iPadAirFifthGenCellular-iPadAirFifthGenCellular",
            "iPhone14-iPhone14",
            "iPhone14Plus-iPhone14Plus",
            "iPhone14Pro-iPhone14Pro",
            "iPhone14ProMax-iPhone14ProMax",
            "iPadTenthGen-iPadTenthGen",
            "iPadTenthGenCellular-iPadTenthGenCellular",
            "iPadPro11FourthGen-iPadPro11FourthGen",
            "iPadPro11FourthGenCellular-iPadPro11FourthGenCellular",
            "iPadProSixthGen-iPadProSixthGen",
            "iPadProSixthGenCellular-iPadProSixthGenCellular"
        ],
        kind: "Finance",
        currency: "USD",
        userRatingCountForCurrentVersion: 400,
        averageUserRating: 3.284482482,
        trackViewUrl: "https://www.testscreenshots.com",
        trackContentRating: "+4",
        minimumOsVersion: "iOS 13",
        trackCensoredName: "TrackMe",
        languageCodesISO2A: [
            "US",
            "KR"
        ],
        fileSizeBytes: "12484281421",
        sellerUrl: nil,
        formattedPrice: nil,
        contentAdvisoryRating: "+4",
        averageUserRatingForCurrentVersion: 3.2421412521,
        currentVersionReleaseDate: "2014-03-27T23:55:28Z",
        artistId: 421,
        artistName: "KakaoBack",
        genres: [
            "Finance"
        ],
        price: 0.0,
        description: "일상에서 더 쉽게, 더 자주 만나는\n제1금융권 은행, 카카오뱅크\n\n■ 새롭게 디자인된 은행\n• 365일 언제나 지점 방문 없이 모든 은행 업무를 모바일에서\n• 7분만에 끝나는 쉬운 계좌개설\n\n■ 쉬운 사용성\n• 공동인증서, 보안카드 없는 계좌이체\n• 계좌번호를 몰라도 카톡 친구에게 간편 송금 (상대방이 카카오뱅크 고객이 아니어도 송금 가능)\n\n■ 내 취향대로 선택\n• 카카오프렌즈 캐릭터 디자인부터 고급스러운 블랙 컬러까지, 세련된 디자인의 체크카드\n• 내 마음대로 설정하는 계좌 이름과 색상\n\n■ 눈에 보이는 혜택\n• 복잡한 가입 조건이나 우대 조건 없이, 누구에게나 경쟁력있는 금리와 혜택 제공\n• 늘어나는 이자를 실시간으로 확인할 수 있는 정기예금\n• 만 19세 이상 대한민국 국민의 90%가 신청 가능한 비상금대출(소액 마이너스대출)\n\n■ 카카오프렌즈와 함께하는 26주적금\n• 천원부터 차곡차곡 26주동안 매주 쌓는 적금\n• 카카오프렌즈 응원과 함께하면 어느덧 만기 달성이 눈앞에!\n\n■ 알아서 차곡차곡 모아주는 저금통\n• 원하는 모으기 규칙 선택으로 부담없이 저축하기\n• 평소에는 귀여운 아이템으로, 엿보기 기능으로 잔액 확인\n\n■ 함께쓰고 같이보는 모임통장\n• 손쉽게 카카오톡 친구들을 멤버로 초대 \n• 잔액과 입출금 현황을 멤버들과 함께 보기 \n• 위트있는 메시지카드로 회비 요청\n\n■ 소중한 ‘내 신용정보’ 관리\n• 제1금융권에서 안전하게 무료로 내 신용정보 확인\n• 신용 변동내역 발생 시 알림 서비스 및 신용정보 관리 꿀팁 제공\n\n■ 파격적인 수수료로 해외송금\n• 365일 언제 어디서든 이용가능한 해외송금 (보내기 및 받기)\n• 해외계좌 및 웨스턴유니온(WU)을 통해 전세계 200여 개국으로 해외송금 가능\n• 거래외국환은행 지정, 연장 업무도 지점방문없이 모바일에서 신청 가능 \n\n■ 카카오뱅크에서 만나는 제휴서비스\n• 증권사 주식계좌도 간편하게 개설 가능\n• 프렌즈 캐릭터가 함께하는 제휴 신용카드 신청 가능\n\n■ 이체수수료 및 입출금 수수료 면제\n• 타행 이체 및 자동이체 수수료 면제\n• 국내 모든 ATM(은행, 제휴 VAN사 기기) 입금/출금/이체 수수료 면제\n\n* ATM/CD기 입금/출금/이체 수수료는 향후 정책에 따라 변경될 수 있습니다. 정책이 변경되는 경우 시행 1개월 전에 카카오뱅크 앱 및 홈페이지를 통해 미리 알려드립니다.\n\n■ 고객센터 운영 시간 안내\n• 예/적금, 대출, 카드 문의 : 1599-3333 (09:00 ~ 22:00 365일)\n• 전월세 보증금 대출, 외환 문의 : 1599-3333 (09:00 ~ 18:00 평일)\n• 사고 신고 : 1599-8888 (24시간 365일)\n\n■ 챗봇 운영 시간 안내\n• 카카오톡 플러스친구 \"카카오뱅크 고객센터\" (24시간 365일)\n\n■ 카카오뱅크 앱 이용을 위한 권한 및 목적 안내\n• 카메라(선택) : 신분증 촬영 및 서류 제출, 영상통화, 프로필 사진 등록\n• 사진(선택) : 이체⁄송금⁄출금 확인증, 카드매출전표 저장\n• 위치(선택) : 부정가입방지 및 부정거래탐지\n\n * 선택 접근권한은 동의하지 않아도 서비스를 이용하실 수 있습니다.",
        isVppDeviceBasedLicensingEnabled: false,
        releaseDate: "2014-03-27T23:55:28Z",
        releaseNotes: "2.23.1\n● 사용성 개선 및 안정화 \n\n2.23.0\n● 카드 청구금액 알림\n- 내 신용카드 결제 청구 예정 금액과 계좌 잔액을 확인할 수 있어요. \n\n● 이체 시 사기계좌 여부 확인 서비스\n- 중고거래나 모르는 사람에게 이체 시, 금융사기 방지를 위해 더치트에 신고 등록된 사기계좌인지 여부를 알 수 있어요. \n\n● 내신용정보 NICE 신용점수 추가\n- NICE에서 제공하는 신용점수 확인 및 바로 신용점수 올리기가 가능해요.\n\n● 카카오뱅크 인증서 오픈\n- 10초 만에 발급하고 3년간 인증이 필요한 모든 곳에서 카카오뱅크 인증서를 이용할 수 있어요. \n\n● 사장님 홈 개선\n- 사장님 홈에서 카카오뱅크에 등록된 사업자정보를 조회하고 업데이트할 수 있어요.\n\n● 이체완료 화면 및 사용성 개선 \n- 받는 분과 보낸 금액을 더 편하게, 이체 후에 바로 '공유' 할 수 있도록 사용성을 개선했어요.",
        sellerName: "KakaoBank",
        primaryGenreName: "Finance",
        primaryGenreId: 324,
        genreIds: [
            "324",
            "523"
        ],
        trackId: 4232,
        trackName: "KakaoBank",
        bundleId: "test.kakaobank.bundle",
        version: "1.01.01",
        wrapperType: "Wrapper",
        userRatingCount: 92322
    )

}

extension TopInfoModel: Equatable {
    static func == (lhs: TopInfoModel, rhs: TopInfoModel) -> Bool {
        return lhs.title == rhs.title
    }
}

extension VersionInfoModel: Equatable {
    static func == (lhs: VersionInfoModel, rhs: VersionInfoModel) -> Bool {
        return lhs.version == rhs.version
    }
}
