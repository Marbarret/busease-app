import SwiftUI

struct Notification: Identifiable {
    let id = UUID()
    let user: String
    let message: String
    let timeAgo: String
    let profileImage: String
}

let notifications: [Notification] = [
    Notification(user: "@mizajhones2020", message: "Corretíssimo", timeAgo: "há 1 dia", profileImage: "person.circle"),
    Notification(user: "@camila_dev", message: "Nova atualização disponível", timeAgo: "há 3h", profileImage: "bell.fill"),
    Notification(user: "@john_doe", message: "Seu pedido foi confirmado", timeAgo: "há 5 min", profileImage: "checkmark.circle")
]


struct Dependent: Codable, Identifiable {
    var id = UUID()
    let relationship: String
    let name: GenericUser
    let school: String
    let transPlan: TransPlan
}

let dependent: [Dependent] = [
    Dependent(relationship: "Filha",
              name: GenericUser(fullName: "",
                                genericName: "Mina",
                                address: nil,
                                photo: "photo"),
              school: "Marista",
              transPlan: TransPlan(
                planCode: "12",
                planType: "Basic",
                rota: "Rota Santa Cecilia",
                value: 125.00,
                vehicleType: "Premium",
                validityPeriod: ValidityPeriod(startDate: Date(),
                                               endDate: Calendar.current.date(byAdding: .month, value: 10, to: Date())!))),
    Dependent(relationship: "Sobrinha",
              name: GenericUser(fullName: "",
                                genericName: "Momo",
                                address: nil,
                                photo: "photo"),
              school: "Marista José Malcherhbjhbjhbjhbj",
              transPlan: TransPlan(
                planCode: "12",
                planType: "Basic",
                rota: "Rota Santa Cecilia",
                value: 125.00,
                vehicleType: "Premium",
                validityPeriod: ValidityPeriod(startDate: Date(),
                                               endDate: Calendar.current.date(byAdding: .month, value: 10, to: Date())!))),
]

struct Address: Codable {
    var street: String
    var number: String
    var zone: String
    var city: String
    var state: String
    var zip: String
}

enum DocumentTypeEnum: String, Codable {
    case cpf = "CPF"
    case cnpj = "CNPJ"
}

struct DocumentType: Codable {
    var documentType: DocumentTypeEnum
    var number: String
    
    enum CodingKeys: String, CodingKey {
        case documentType = "document_type"
        case number
    }
    
    func isValid() -> Bool {
        switch documentType {
        case .cpf:
            return number.count == 11
        case .cnpj:
            return number.count == 14
        }
    }
}

struct GenericUser: Codable {
    var fullName: String
    var genericName: String?
    var address: Address?
    var photo: String?
    
    enum CodingKeys: String, CodingKey {
        case fullName = "fullName"
        case genericName = "genericName"
        case address = "address"
        case photo = "photo"
    }
}

struct TransPlan: Codable {
    var planCode: String
    var planType: String
    var rota: String
    var value: Double
    var vehicleType: String
    var validityPeriod: ValidityPeriod
    
    enum CodingKeys: String, CodingKey {
        case planCode = "planCode"
        case planType = "plan_type"
        case rota = "rota"
        case value = "value"
        case vehicleType = "vehicle_type"
        case validityPeriod = "validity_period"
    }
}

struct ValidityPeriod: Codable {
    var startDate: Date
    var endDate: Date
}
