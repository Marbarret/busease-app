import Foundation

class Utils {
    func greeting() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        switch hour {
        case 6..<12:
            return "Bom dia"
        case 12..<18:
            return "Boa tarde"
        default:
            return "Boa noite"
        }
    }
    
    func formatDate(date: String) -> String {
        let instance = DateFormatter()
        instance.dateFormat = "yyyy-MM-dd"
        guard let date = instance.date(from: date) else {fatalError("format date")}
        instance.dateFormat = "yyyy"
        return instance.string(from: date)
    }
}
