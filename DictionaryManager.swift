//
//  DictionaryManager.swift
//  DictionaryApp
//
//  Created by Macbook Air on 23.08.2023.
//

import Foundation
protocol DictionaryManagerDelegate: AnyObject {
    func didReceiveData(veri: DictionaryModel, _ manager : DictionaryManager)
}


struct DictionaryManager  {
  
     var delegate: DictionaryManagerDelegate?
    
   
    var url  = "https://api.dictionaryapi.dev/api/v2/entries/en/"
//    if let word = .aramaTextField.text{
//        dictionaryManager.fetchData(word: word)
//    }
  
    func fetchData (word :String){
      let NewUrl = "\(url)\(word)"
        performRequest(newUrl: NewUrl)
    }
    func performRequest(newUrl : String){
       
      if let url = URL(string: newUrl){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){ (data, response, error) in
                if let error = error {
                    print(error)
                }
                if let safeData = data {
                    if let decoded =  self.parseJson(variable: safeData){ //let decodedData = try decoder.decodeArray(DictionaryData.self, from: data)
                        self.delegate?.didReceiveData(veri: decoded,self)
                       
                    }
                }
                
            }
          task.resume()
      }
    }
    
    func parseJson(variable: Data ) -> DictionaryModel? {
       let decoder  = JSONDecoder()
       
        do {
            //let decodedData = try decoder.decodeArray(DictionaryData.self, from: data)
            
          let decodedDictionary =  try decoder.decode([DictionaryData].self, from: variable )
            guard let firstEntry = decodedDictionary.first else {
                                    return nil
                                }
            let okunus = firstEntry.meanings[0].partOfSpeech
            let anlam = firstEntry.meanings[0].definitions[0].definition
            let fonetik = firstEntry.phonetic
            let kelime = firstEntry.word
            
            let veri = DictionaryModel(word: kelime, phonetic: fonetik, speech: okunus, description: anlam)
//            print(veri)
               return veri
           }
         catch  {
            print(error)
             return nil
         }
        
    }
    
}
    
    
    
    
    
    

