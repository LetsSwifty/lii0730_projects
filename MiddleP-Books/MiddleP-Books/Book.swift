//
//  Book.swift
//  MiddleP-Books
//
//  Created by LeeHsss on 2022/05/01.
//

import Foundation
import UIKit


struct Book {
    var title: String
    var description: String
    var imageURL: String
    var isGood: Bool
    
    init(title: String, description: String, imageURL: String, isGood: Bool) {
        self.title = title
        self.description = description
        self.imageURL = imageURL
        self.isGood = isGood
    }
    
    static func Dummy() -> [Book] {
        let books: [Book] = [
            Book(
                title: "시맨틱 에러",
                description: "‘드에러단’이라는 단어를 탄생시키며 엄청난 흥행 돌풍을 일으킨 왓챠 오리지널 드라마 <시맨틱 에러>를 대본집으로 만날 수 있게 되었다. 저수리 작가의 동명 웹소설(리디)을 원작으로 한 드라마 <시맨틱 에러>는 왓챠 종영 이후 시간이 흘러도 1위의 자리에서 좀체 내려올 줄을 모르며 기분 좋은 신드롬을 이어가고 있다.",
                imageURL: "book1",
                isGood: false
            ),
            Book(
                title: "작별인사",
                description: "누구도 도와줄 수 없는 상황, 혼자 헤쳐나가야 한다. 지켜야 할 약속, 붙잡고 싶은 온기",
                imageURL: "book2",
                isGood: false
            ),
            Book(
                title: "이상한 과자 가게 전천당 14",
                description: "이번 권에 등장하는 에피소드들에서 주목할만한 것은 과자를 올바르게 쓰지 않았다고 해서 모두가 불행해지는 건 아니라는 것이다. 14권은 과자의 힘이 어떠하든, 차곡차곡 쌓은 진심은 어떻게든 통한다는 것을 다양한 에피소드들을 통해 보여준다.",
                imageURL: "book3",
                isGood: false
            ),
            Book(
                title: "흔한 남매 10",
                description: "웃음과 공감을 자아내는 흔한남매의 활기찬 일상! 으뜸이와 에이미의 우당탕탕 다이어트 대작전, 사랑에 빠진 장민철, 에이미의 웃음 가득한 브이로그, 투명 인간이 된 으뜸이, 공포의 안내 방송, 10년 뒤 에이미와 만난 으뜸이 등 흔한남매의 일상 속엔 생기 넘치는 공감과 웃음이 가득하답니다!",
                imageURL: "book4",
                isGood: false
            ),
            Book(
                title: "불편한 편의점",
                description: "원 플러스 원의 기쁨, 삼각김밥 모양의 슬픔, 만 원에 네 번의 폭소가 터지는 곳! 힘겨운 시대를 살아가는 우리들에게 다가온 조금 특별한 편의점 이야기",
                imageURL: "book5",
                isGood: false
            ),
            Book(
                title: "나의 투자는 새벽 4시에 시작된다.",
                description: "3년 만에 30억 벌고 퇴사한 단타 투자자의 생생한 경험담을 풀어내 출간 즉시 베스트셀러에 올랐던 『나의 월급 독립 프로젝트』의 저자 유목민이 3년 만에 신작으로 돌아왔다. 주식에 관한 새로운 관점을 제시했다는 평가를 받으며 많은 개미 투자자에게 ‘가장 현실적인 입문서’로 꾸준히 사랑받는 책이다.",
                imageURL: "book6",
                isGood: false
            ),
            Book(
                title: "둥실이네 떡집",
                description: "여울이와 둥실이를 도와줄 수 있는 떡을 알려 줘! 누적 판매 100만 부(시리즈 전체)를 돌파하며 국내 창작 동화 시리즈의 새로운 기록을 써나가고 있는 「만복이네 떡집」 여섯 번째 이야기, 『둥실이네 떡집』이 비룡소에서 출간되었다.",
                imageURL: "book7",
                isGood: false
            ),
            Book(
                title: "여학교의 별 2",
                description: "전설의 1만 리트윗, SNS 화제의 그 만화 『여학교의 별』 두 번째 이야기 충격적으로 귀여운 선생님과 학생들의 지루할 틈 없는 유쾌한 티키타카! “이 학교, 다니고 싶다.”",
                imageURL: "book8",
                isGood: false
            ),
            Book(
                title: "저주토끼",
                description: "2022 부커상 최종 후보 지명작! 한국 호러 SF/판타지 대표작가 정보라 대표작",
                imageURL: "book9",
                isGood: false
            ),
            Book(
                title: "지박소년 하나코군 17",
                description: "하나코가 있는 `경계`로 통하는 단서를 찾는 네네 일행. 저주받은 【빨간 집】에서 만난 꼬마는 어린 시절의 츠카사였다. 츠카사와 함께 집에서 탈출을 시도하지만 앞이 가로막히는데…. 학원 7대 불가사의 괴이담, 【빨간 집】 편, 클라이맥스!",
                imageURL: "book10",
                isGood: false
            ),
            Book(
                title: "물고기는 존재하지 않는다.",
                description: "‘방송계의 퓰리처상’ 피버디상 수상자 룰루 밀러의 사랑과 혼돈, 과학적 집착에 관한 경이롭고도 충격적인 데뷔작!",
                imageURL: "book11",
                isGood: false
            ),
            Book(
                title: "이어령의 마지막 수업",
                description: "시대의 지성 이어령과 ‘인터스텔라’ 김지수의 ‘라스트 인터뷰’ 삶과 죽음에 대한 마지막 인생 수업",
                imageURL: "book12",
                isGood: false
            ),
            Book(
                title: "운명을 바꾸는 부동산 투자 수업 기초편",
                description: "“부동산 투자가 당신의 운명을 바꾼다” 평범한 월급쟁이를 돈 버는 투자자로! ‘부읽남’의 절대 실패하지 않는 부동산 투자 바이블",
                imageURL: "book13",
                isGood: false
            ),
            Book(
                title: "나는 대출없이 0원으로 소형 아파트를 산다",
                description: "“뜬구름 잡지 않는, 모자이크 처리 없는, 적나라하고 현실적인 부동산 투자 공략집!” 부동산 완판남 잭파시의 투자자들이 먼저 인정한 실전 투자 강의! 절대로 손해 보지 않는 투자를 하려면 이 책을 펼쳐라!",
                imageURL: "book14",
                isGood: false
            ),
            Book(
                title: "긴긴밤",
                description: "제21회 문학동네어린이문학상 대상 수상작 『긴긴밤』 세상에 마지막 하나 남은 흰바위코뿔소와 코뿔소 품에서 태어난 어린 펭귄. 그땐 기적인 줄 몰랐다, 머리부터 발끝까지 모든 것이 다른 우리에게 서로밖에 없다는 게.",
                imageURL: "book15",
                isGood: false
            ),
            Book(
                title: "보이지 않는 곳에서 애쓰고 있는 너에게",
                description: "조각난 마음을 따뜻하게 감싸 안아줄 최대호 작가의 신간 누구에게나 반복되는 평범한 일상 속, 세상과 타인에 지친 사람들의 마음을 잔잔하고 담백한 시선으로 바라보는 최대호 작가는 이번 신간을 통해 상처받은 이들을 위한 공감과 위로의 메시지를 한 권의 책에 가득 담았다.",
                imageURL: "book16",
                isGood: false
            ),
            Book(
                title: "웰씽킹",
                description: "10억 빚더미를 연매출 6,000억과 맞바꾼 부의 원리 “왜 누구는 부자로, 누구는 빈자로 사는가? 그 모든 비밀은 웰씽킹에 있다!”",
                imageURL: "book17",
                isGood: false
            )
        ]
        
        return books
    }
}
