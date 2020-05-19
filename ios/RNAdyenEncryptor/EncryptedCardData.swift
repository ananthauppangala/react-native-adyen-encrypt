//
//  VoomEncryptedCardData.swift
//  Voom
//
//  Created by Voom Pair on 8/13/19.
//  Copyright © 2019 Voom. All rights reserved.
//

import Foundation
import Adyen

public struct EncryptedCardData {
  let cardNumber: String?
  let expiryMonth: String?
  let expiryYear: String?
  let securityCode: String?
  let publicKey: String
  var json: [String: String] = [:]

  var toJSON: [String: String] {
    do {
      let card = CardEncryptor.Card(number: cardNumber, securityCode: securityCode, expiryMonth: expiryMonth, expiryYear: expiryYear)
      let encryptedCard = try CardEncryptor.encryptedCard(for: card, publicKey: publicKey)

      if cardNumber != nil { json["encryptedCardNumber"] = encryptedCard.number }
      if expiryMonth != nil { json["encryptedExpiryMonth"] = encryptedCard.expiryMonth }
      if expiryYear != nil { json["encryptedExpiryYear"] = encryptedCard.expiryYear }
      if securityCode != nil { json["encryptedSecurityCode"] = encryptedCard.securityCode }

      return json
    } catch {
      return json
    }
  }
}
