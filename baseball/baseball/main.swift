//
//  main.swift
//  baseball
//
//  Created by t2023-m0149 on 11/6/24.
//
import Foundation

// 야구 게임 만들기 lv1

//class BaseballGame {
//    
//    func start() {
//        var array = Array(1...9) // 1부터 9까지의 숫자로 배열을 초기화
//        array.shuffle() // 섞는다는 표현을 shuffle로 표현할 수 있어서 shuffle로 섞는다
//        array.removeSubrange(3...8) // 야구 게임은 3자리 숫자가 나오기에 index 0번째 부터 2번째까지만 필요하기에
//                                    // 3번째부터 8번째까지는 removeSubrange를 이용해 해당 index값을 삭제한다
//        print(array)
//    }
//    
//}
//
//let game = BaseballGame()
//game.start()

// 야구 게임 만들기 lv2

class BaseballGame {
    // 정답을 생성하는 함수
    // makeAnswer 함수는 1부터 9까지의 숫자 중 임의의 3개의 숫자를 선택하여 배열로 반환합니다.
   private func makeAnswer() -> [Int] {
        var array = Array(1...9)  // 1부터 9까지 숫자를 배열로 생성
        array.shuffle()            // 배열을 무작위로 섞음
        array.removeSubrange(3...8) // 섞인 배열에서 앞의 3개만 남기고 나머지를 삭제
        return array               // 3개의 숫자를 가진 배열을 반환
    }
    
    // 게임을 시작하는 함수
    func start() {
        let answer = makeAnswer()  // 임의의 정답 배열을 생성
        print("게임을 시작합니다.") // 게임 안내 메시지 출력
        
        // 무한 반복문을 통해 사용자가 정답을 맞출 때까지 게임을 계속 진행
        while true {
            print("3자리 숫자를 입력하세요: ", terminator: "") // 사용자 입력 요청
            
           
            // readLine() 함수로 입력값을 받고, 값이 없거나 세 자리가 아닌 경우 오류 메시지 출력
            guard let input = readLine(), input.count == 3 else {
                print("잘못 입력하셨습니다. 세 자리 숫자를 입력하세요.")
                continue  // 유효하지 않은 입력일 경우 반복문의 처음으로 돌아감
            }
            
          
            // 입력된 문자열의 각 문자를 숫자로 변환하고 중복 여부를 검사
            let userGuess = input.compactMap { Int(String($0)) } // 입력을 개별 숫자로 변환
            if userGuess.count != 3 || Set(userGuess).count != 3 { // 중복되지 않은 3자리 숫자인지 확인
                print("잘못 입력하셨습니다. 중복되지 않는 세 자리 숫자를 입력하세요.")
                continue  // 유효하지 않은 입력일 경우 반복문의 처음으로 돌아감
            }
            
            
            var strikes = 0 // 스트라이크 횟수를 저장할 변수
            var balls = 0   // 볼 횟수를 저장할 변수
            // 정답과 사용자의 숫자를 비교하여 스트라이크와 볼을 계산
            for i in 0..<3 {
                if userGuess[i] == answer[i] { // 위치와 숫자가 같으면 스트라이크
                    strikes += 1
                } else if answer.contains(userGuess[i]) { // 위치는 다르지만 숫자가 같으면 볼
                    balls += 1
                }
            }
            
            // 스트라이크가 3이면 정답을 맞췄으므로 게임 종료
            if strikes == 3 {
                print("정답입니다! 게임을 종료합니다.")
                break
            } else if strikes == 0 && balls == 0 {
                // 스트라이크와 볼이 모두 0이면 "아웃" 출력
                print("아웃")
            } else {
                // 그렇지 않으면 스트라이크와 볼 개수를 출력
                print("\(strikes) 스트라이크, \(balls) 볼")
            }
        }
    }
}

// BaseballGame 인스턴스를 생성하고 게임을 시작
let game = BaseballGame()
game.start()
