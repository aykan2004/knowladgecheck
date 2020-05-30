

import Foundation

class ScoreModel {
    
    fileprivate var correctAnswers: Int = 0
    fileprivate var incorrectAnswers: Int = 0
    fileprivate var correctTotal: Int = 0
    
    func reset() {
        correctAnswers = 0
        incorrectAnswers = 0
    }

    func incrementCorrectAnswers() {
        correctAnswers += 1
    }
    
    func incrementCorrectAnswers2() -> String {
        correctTotal += 1
        return "\(correctTotal)"
    }
    
    func incrementIncorrectAnswers() {
        incorrectAnswers += 1
    }
    
    func getQuestionsAsked() -> Int {
        return correctAnswers + incorrectAnswers
    }
    
    func getScore() -> String {
        let percentaile = Double(correctAnswers) / Double(getQuestionsAsked())
        
        if (percentaile > 0.75) {
            return "Continue like this!\n You got \(correctAnswers) out of \(getQuestionsAsked()) correct answers!"
        } else if (percentaile > 0.5) {
            return "Good work!\n You got \(correctAnswers) out of \(getQuestionsAsked()) correct answers!"
        } else {
            return "You can do better.\n You got \(correctAnswers) out of \(getQuestionsAsked()) correct answers!"
        }
    }
}
