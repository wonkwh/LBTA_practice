import UIKit


class ViewController {
    
    func fetchSometing(completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        
        guard let dummyURL = URL(string: "https://www.google.com") else { return }
        
        URLSession.shared.dataTask(with: dummyURL) { (data, res, err) in
            completion(data, res, err)
        }.resume()
    }
}

func example(of description: String, action: () -> Void) {
    print("\n--- Example of:", description, "---")
    action()
}

let vc = ViewController()
vc.fetchSometing { (d, r, e) in
    vc.fetchSometing{ (d, r, e) in
        vc.fetchSometing{ (d, r, e) in
            print("finally completed my fetches")
        }
    }
}

//async - await


