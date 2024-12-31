import SwiftUI

class AuthenticationViewModel: ObservableObject {
    @AppStorage ("authToken") private var authToken: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var isRegistered = false
    @Published var errorMessage: String?
    
    func login(document: String, password: String) {
        guard let url = URL(string: "http://localhost:3000/busease-api/v1/auth/login") else { return }
        
        let body: [String: String] = ["document": document, "password": password]
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                print("Erro na requisição:", error?.localizedDescription ?? "Erro desconhecido")
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let token = json["token"] as? String {
                    DispatchQueue.main.async {
                        self?.authToken = token
                        self?.isLoggedIn = true
                    }
                } else {
                    self?.errorMessage = "Erro ao fazer login, usuário não encontrado"
                }
            } catch {
                self?.errorMessage = "Erro ao fazer login \(error.localizedDescription)"
            }
        }.resume()
    }
    
    func registerUser(role: String, fullName: String, documentType: String, documentNumber: String, password: String) {
        guard let url = URL(string: "http://localhost:3000/busease-api/v1/users") else {
            self.errorMessage = "URL inválida"
            return
        }
        
        let payload: [String: Any] = [
            "role": role,
            "responsible": [
                "fullName": fullName,
                "document": [
                    "document_type": documentType,
                    "number": documentNumber
                ]
            ],
            "password": password
        ]
        print(payload)
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: payload)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    if let error = error {
                        self.errorMessage = "Erro: \(error.localizedDescription)"
                        return
                    }
                    
                    guard let response = response as? HTTPURLResponse, response.statusCode == 201 else {
                        self.errorMessage = "Erro no servidor ou payload inválido"
                        return
                    }
                    
                    self.isRegistered = true
                }
            }.resume()
        } catch {
            self.errorMessage = "Erro ao criar usuário: \(error.localizedDescription)"
        }
    }
    
    func logout() {
        authToken = ""
        isLoggedIn = false
    }
    
    func checkLoginStatus() {
        isLoggedIn = !authToken.isEmpty
    }
}

