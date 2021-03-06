//
//  Error'.swift
//  JuiceMaker
//
//  Created by κ°κ²½, Ryan on 2021/03/11.
//

import Foundation

enum FruitError: Error, CustomStringConvertible {
  case nilHasOccurredWhileSubtracting
  case nilHasOccurredWhileAdding
  case nilHasOccurredWhileCheckingStock
  case nilHasOccurredWhileCountingStock
  
  var description: String {
    switch self {
    case .nilHasOccurredWhileSubtracting:
      return "π₯ μ₯¬μ€ μ¬κ³  μ°¨κ° μ€ stock[fruit] = nilμ΄ λ°μνμμ΅λλ€."
    case .nilHasOccurredWhileAdding:
      return "π₯ μ₯¬μ€ μ¬κ³  μΆκ° μ€ stock[fruit] = nilμ΄ λ°μνμμ΅λλ€."
    case .nilHasOccurredWhileCheckingStock:
      return "π₯ μ₯¬μ€ μ¬κ³  νμΈ μ€ stock[fruit] = nilμ΄ λ°μνμμ΅λλ€."
    case .nilHasOccurredWhileCountingStock:
      return "π₯ μ₯¬μ€ μ¬κ³  λ°ν μ€ stock[fruit] = nilμ΄ λ°μνμμ΅λλ€."
    }
  }
}

enum JuiceError: Error, CustomStringConvertible {
  case nilHasOccurredWhileCheckingRequiredFruits
  
  var description: String {
    switch self {
    case .nilHasOccurredWhileCheckingRequiredFruits:
      return "π₯ μ°λ¦¬ κ°κ²μ μλ μ₯¬μ€κ΅°μ."
    }
  }
}

enum RecipeError: Error, CustomStringConvertible {
  case jsonDecodingFailed
  case nilHasOccurredWhileUnwrappingRecipe
  
  var description: String {
    switch self {
    case .jsonDecodingFailed:
      return "JSON λμ½λ© μμμ μ€ν¨νμ¬ λ μνΌλ₯Ό μ½μ΄ λ€μ΄μ§ λͺ»νμ΅λλ€."
    case .nilHasOccurredWhileUnwrappingRecipe:
      return "λ μνΌλ₯Ό κ°μ Έμ€λ κ³Όμ μμ μ΅μλ ν΄μ μ μ€ν¨νμ΅λλ€."
    }
  }
}
