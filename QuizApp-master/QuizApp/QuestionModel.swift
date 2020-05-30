

import GameKit

struct QuestionModel {
    
    let questions = [
        Question(interrogative: "This was the city were Covid-19 originated from.", answers: ["China", "India", "USA", "Turkey"], correctAnswerIndex: 0),
        
        Question(interrogative: "How is Covid-19 transmitted.", answers: ["Respitory droplets through coughing and sneezing", "Touching surfaces contaminated with the virus and then touching your face", "All of the above", "None of the above"], correctAnswerIndex: 2),
        
        Question(interrogative: "What is the minimum percentage of  alcohol in hand rubs and disinfectants is needed to kill the coronavirus disease?", answers: ["30%", "40%", "50%", "60%"], correctAnswerIndex: 3),
            
            Question(interrogative: "For how long should you wash your hands to kill the coronavirus disease?", answers: ["20 seconds", "15 seconds", "10 seconds", "5 seconds"], correctAnswerIndex: 0),
            
            Question(interrogative: "What are the common symptoms of Covid-19?", answers: ["A new and continuous cough", "Fever", "Tiredness", "All of the above"], correctAnswerIndex: 3),
            
            Question(interrogative: "What is a virus?", answers: ["A microscopic single celled organism.", "A sub-microscopic infectious agent that replicates only inside a living cell of a different organism", "Type of bacteria", "None of the above"], correctAnswerIndex: 1),
            
            Question(interrogative: "What is the official name of the virus?", answers: ["Sars Cov-2", "Covid-19", "coronavirus", "Wuhan flu"], correctAnswerIndex: 0),
            
            Question(interrogative: " What does the 19 in Covid-19 stand for?", answers: ["19 molecules that make up the virus.", "It is the 19th virus identified since WHO began naming them.", "The year virus was first encountered.", "Days it took to identify what the virus was."], correctAnswerIndex: 2),
            
            Question(interrogative: "About what percentage of infected people recover without hospital treatment?", answers: ["60%", "70%", "80%", "90%"], correctAnswerIndex: 2),
            
            Question(interrogative: "Which of these is NOT listed as a symptom of the coronavirus?", answers: ["Fever", "Dry Cough", "Nasal Congestion", " Blurred Vision "], correctAnswerIndex: 3),
            
            Question(interrogative: " What is more effective at removing the coronavirus from your hands?", answers: ["Alcohol based hand sanitizer", "Soap and Water", "both are equal", "both can’t remove"], correctAnswerIndex: 1),
            
            Question(interrogative: "How big is the coronavirus?", answers: ["8 billionths of a meter", "80 billionths of a meter ", "800 billionths of a meter ", "8000 billionths of a meter "], correctAnswerIndex: 1),
            
            Question(interrogative: "What does the virus attach itself to when it enters the human body?", answers: ["Antigens", "Red blood cells", "Whatever it can", "Ace-receptors in the lining of the airways"], correctAnswerIndex: 3),
            
            Question(interrogative: "What does RNA sand for?", answers: ["Ribonucleic acid", "Reductone nano articulate", "Reproducing nucleic agent", "Reductone nano acid"], correctAnswerIndex: 0),
            
            Question(interrogative: " How long can the virus survive on plastic and stainless steel surfaces?", answers: ["4 to 12 hours", "24 to 60 hours", "more than 72 hours", "forever"], correctAnswerIndex: 2),
            
            Question(interrogative: "Which of these is NOT  a type of coronavirus?", answers: ["Sars", "Mers", "Covid-19", "Ebola"], correctAnswerIndex: 3),
            
            Question(interrogative: " Governments around the world have been monitoring the 'R number' to determine when to ease lockdown restrictions. What is the R number? ", answers: ["The percentage of confirmed cases that lead to death.", " The percentage of the population that has been tested ", "The average number of people to whom the person will pass on the virus.", "Percentage of the population with immunity."], correctAnswerIndex: 2),

            Question(interrogative: "Which of the organs does the virus primarily attack?", answers: ["Liver", "Lungs", "Brain", "Heart"], correctAnswerIndex: 1)
    ]
    
    var previouslyUsedNumbers: [Int] = []
    
    mutating func getRandomQuestion() -> Question {
        
        if (previouslyUsedNumbers.count == questions.count) {
            previouslyUsedNumbers = []
        }
        var randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: questions.count)
        
        
        while (previouslyUsedNumbers.contains(randomNumber)) {
            randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: questions.count)
        }
        previouslyUsedNumbers.append(randomNumber)
        
        return questions[randomNumber]
    }
}

class Question {
    
    fileprivate let interrogative: String
    fileprivate let answers: [String]
    fileprivate let correctAnswerIndex: Int
    
    init(interrogative: String, answers: [String], correctAnswerIndex: Int) {
        self.interrogative = interrogative
        self.answers = answers
        self.correctAnswerIndex = correctAnswerIndex
    }
    
    func validateAnswer(to givenAnswer: String) -> Bool {
        return (givenAnswer == answers[correctAnswerIndex])
    }
    
    func getInterrogative() -> String {
        return interrogative
    }
    
    func getAnswer() -> String {
        return answers[correctAnswerIndex]
    }
    
    func getChoices() -> [String] {
        return answers
    }
    
    func getAnswerAt(index: Int) -> String {
        return answers[index]
    }
}
