import Combine
import Foundation

class Validations {
    static let shared = Validations()
    
    struct ValidationError: Error {
        let reason: String
        init(_ reason: String) {
            self.reason = reason
        }
    }

    func validatePublisher(_ text: AnyPublisher<String, Never>, type: ValidationType) -> AnyPublisher<String?, Never> {
        return text
            .map { text in
                do {
                    try self.validate(text, type: type)
                    return nil
                } catch let error as ValidationError {
                    return error.reason
                } catch {
                    return "Erro desconhecido"
                }
            }
            .eraseToAnyPublisher()
    }
    
    func validate(_ text: String, type: ValidationType) throws {
        guard !text.isEmpty else { throw ValidationError("\(type.description) é obrigatório") }
        guard text.range(of: type.pattern, options: .regularExpression) != nil else {
            throw handleError(of: type)
        }
    }
    
    private func handleError(of type: ValidationType) -> ValidationError {
        switch type {
        case .email(_):
            return ValidationError("Email inválido")
        case .password(_):
            return ValidationError("A senha deve ter pelo menos 8 caracteres. Para torná-la mais forte, use letras maiúsculas e minúsculas, números e símbolos como ! @ # $ % & * =")
        case .name(_):
            return ValidationError("O nome inválido.")
        case .lastName(_):
            return ValidationError("O sobrenome inválido.")
        case .phone(_):
            return ValidationError("O telefone inválido.")
        case .passMatch(_):
            return ValidationError("As senhas devem ser idênticas")
        }
    }
}

extension Validations {
    enum ValidationType: CustomStringConvertible {
        case name(Pattern)
        case lastName(Pattern)
        case phone(Pattern)
        case password(Pattern)
        case email(Pattern)
        case passMatch(Pattern)
        
        enum Pattern {
            case `default`
            case custom(String)
        }
        
        var pattern: String {
            switch self {
            case .email(let pattern):
                switch pattern {
                case .default:
                    return "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$"
                case .custom(let string):
                    return string
                }
            case .password(let pattern):
                switch pattern {
                case .default:
                    return "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[$@$#!%*?&]).{8,}$"
                case .custom(let string):
                    return string
                }
            case .name(let pattern):
                switch pattern {
                case .default:
                    return "^[A-Za-z]{3,}.*+$"
                case .custom(let string):
                    return string
                }
            case .lastName(let pattern):
                switch pattern {
                case .default:
                    return "^[A-Za-z]{3,16}.*+$"
                case .custom(let string):
                    return string
                }
            case .phone(let pattern):
                switch pattern {
                case .default:
                    return "^[0-9]{2}.*[0-9]{5}.*[0-9]{4}$"
                case .custom(let string):
                    return string
                }
            case .passMatch(let pattern):
                switch pattern {
                case .default:
                    return "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[$@$#!%*?&]).{8,}$"
                case .custom(let string):
                    return string
                }
            }
        }
        
        var description: String {
            switch self {
            case .email(_):
                return "Campo"
            case .password(_):
                return "Campo"
            case .name(_):
                return "Nome"
            case .lastName(_):
                return "Sobrenome"
            case .phone(_):
                return "Telefone"
            case .passMatch(_):
                return "Campo"
            }
        }
    }
}
