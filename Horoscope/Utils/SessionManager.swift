//
//  SessionManager.swift
//  Horoscope
//
//  Created by Tardes on 17/12/2024.
//

import Foundation

class SessionManager {
    let defaults = UserDefaults.standard
    
    func setFavorite(horoscopeId: String) {
        defaults.set(horoscopeId, forKey: "favorite_horoscope")
    }

    func getFavorite() -> String {
        return defaults.string(forKey: "favorite_horoscope") ?? ""
    }

    func isFavorite(horoscopeId: String) -> Bool {
        return horoscopeId == getFavorite()
    }
}
