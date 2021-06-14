import UIKit

class MessageDecryptor: NSObject {
    
    func decryptMessage(_ message: String) -> String {
        
        var countingArray: [String] = []
        var tempCountString = ""
        var repeatStringArray: [String] = []
        var result = ""
        
        if message.contains(" ") {
            return ""
        }
        
        if message.count <= 1 || message.count >= 60 {
            return ""
        }
        
        let stringArray = message.components(separatedBy: CharacterSet.decimalDigits.inverted)
        for item in stringArray {
            if let number = Int(item) {
                if !(1...300).contains(number) { return "" }
            }
        }
        
        
        for character in message {
            if character.isNumber {
                tempCountString = "\(tempCountString)\(character)"
            } else if character == "[" {
                tempCountString == "" ? countingArray.append("1") : countingArray.append(tempCountString)
                tempCountString = ""
                
                repeatStringArray.append(result)
                result = ""
            } else if character == "]" {
                var tempStr = ""
                
                if let counts = Int(countingArray.popLast() ?? "1") {
                    for _ in 0..<counts {
                        tempStr += result
                    }
                }
                guard let popLastOfRepeatString = repeatStringArray.popLast() else { return "" }
                
                result = popLastOfRepeatString + tempStr
            } else if character.isLetter {
                if ("A"..."Z").contains(character) { return "" }
                result += String(character)
            }
        }
        
        return result
    }
}
