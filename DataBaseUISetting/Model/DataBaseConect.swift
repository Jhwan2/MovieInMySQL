
import Foundation

//MARK: - 네트워크에서 발생할 수 있는 에러 정의

enum NetworkError: Error {
    case networkingError
    case dataError
    case parseError
}

//MARK: - Networking (서버와 통신하는) 클래스 모델

final class dbManager {
    // 여러화면에서 통신을 한다면, 일반적으로 싱글톤으로 만듦
    static let shared = dbManager()
    // 여러객체를 추가적으로 생성하지 못하도록 설정
    private init() {}
    
    typealias NetworkCompletion = (Result<[Any], NetworkError>) -> Void

    // 네트워킹 요청하는 함수
    func fetchUser(searchTerm: String, completion: @escaping NetworkCompletion) {
        let urlString = searchTerm
        print(urlString)
        performRequest(with: urlString) { result in
            completion(result)
        }
    }
    
    // 실제 Request하는 함수 (비동기적 실행 ===> 클로저 방식으로 끝난 시점을 전달 받도록 설계)
    private func performRequest(with urlString: String, completion: @escaping NetworkCompletion) {
        //print(#function)
        var typed: Any
        if urlString.contains("movie") {
            typed = Movies.self
        } else if urlString.contains("service") {
            typed = Users.self
        } else if urlString.contains("cinema") {
            typed = Cinemas.self
        } else if urlString.contains("scedule") {
            typed = Times.self
        } else {
            return
        }
//        print(typed)
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                completion(.failure(.networkingError))
                return
            }
            guard let safeData = data else {
                completion(.failure(.dataError))
                return
            }
            dump(safeData)
            // 데이터 분석하기
            if type(of: typed) == Users.Type.self {
                if let musics = self.parseJSON(safeData,typed: typed) as? Users {
                    print("Parse 실행")
                    completion(.success(musics))
                } else {
                    print("Parse 실패")
                    completion(.failure(.parseError))
                }
            } else if type(of: typed) == Movies.Type.self {
                if let musics = self.parseJSON(safeData,typed: typed) as? Movies {
                    print("Parse 실행")
                    completion(.success(musics))
                } else {
                    print("Parse 실패")
                    completion(.failure(.parseError))
                }
            } else if type(of: typed) == Cinemas.Type.self {
                if let musics = self.parseJSON(safeData,typed: typed) as? Cinemas {
                    print("Parse 실행")
                    completion(.success(musics))
                } else {
                    print("Parse 실패")
                    completion(.failure(.parseError))
                }
            } else if type(of: typed) == Times.Type.self {
                if let musics = self.parseJSON(safeData,typed: typed) as? Times {
                    print("Parse 실행")
                    completion(.success(musics))
                } else {
                    print("Parse 실패")
                    completion(.failure(.parseError))
                }
            } else {
                return
            }
        }
        task.resume()
    }
    
    // 받아본 데이터 분석하는 함수 (동기적 실행)
    private func parseJSON(_ userData: Data, typed: Any) -> [Any]? {
        //print(#function)
        // 성공
        if type(of: typed) == Users.Type.self {
            print("Users 타입 확인 완료")
            do {
                // 우리가 만들어 놓은 구조체(클래스 등)로 변환하는 객체와 메서드
                let UData = try JSONDecoder().decode(Users.self, from: userData)
                return UData
            // 실패
            } catch {
                print(error.localizedDescription)
                return nil
            }
        } else if type(of: typed) == Movies.Type.self {
            print("Movie 타입 확인완료")
            dump(userData)
            do {
                // 우리가 만들어 놓은 구조체(클래스 등)로 변환하는 객체와 메서드
                let UData = try JSONDecoder().decode(Movies.self, from: userData)
                return UData
            // 실패
            } catch {
                print(error.localizedDescription)
                return nil
            }
        } else if type(of: typed) == Cinemas.Type.self {
            print("Cinema 타입 확인완료")
            dump(userData)
            do {
                // 우리가 만들어 놓은 구조체(클래스 등)로 변환하는 객체와 메서드
                let UData = try JSONDecoder().decode(Cinemas.self, from: userData)
                return UData
            // 실패
            } catch {
                print(error.localizedDescription)
                return nil
            }
            
        } else if type(of: typed) == Times.Type.self {
            print("Time 타입 확인완료")
            dump(userData)
            do {
                // 우리가 만들어 놓은 구조체(클래스 등)로 변환하는 객체와 메서드
                let UData = try JSONDecoder().decode(Times.self, from: userData)
                return UData
            // 실패
            } catch {
                print(error.localizedDescription)
                return nil
            }
        } else {
            print("모든 타입 확인 실패")
            return nil
        }
    }
    
}

