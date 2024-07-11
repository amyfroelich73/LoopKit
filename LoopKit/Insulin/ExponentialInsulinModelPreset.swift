//
//  ExponentialInsulinModelPreset.swift
//  LoopKit
//
//  Copyright © 2017 LoopKit Authors. All rights reserved.
//

import Foundation

public enum ExponentialInsulinModelPreset: String, Codable {
    case rapidActingAdult
    case rapidActingChild
    case fiasp
    case lyumjev
    case afrezza
}


// MARK: - Model generation
extension ExponentialInsulinModelPreset {
    public var actionDuration: TimeInterval {
        switch self {
        case .rapidActingAdult:
            return .minutes(240)
        case .rapidActingChild:
            return .minutes(240)
        case .fiasp:
            return .minutes(240)
        case .lyumjev:
            return .minutes(240)
        case .afrezza:
            return .minutes(180)
        }
    }

    public var peakActivity: TimeInterval {
        switch self {
        case .rapidActingAdult:
            return .minutes(75)
        case .rapidActingChild:
            return .minutes(65)
        case .fiasp:
            return .minutes(55)
        case .lyumjev:
            return .minutes(55)
        case.afrezza:
            return .minutes(29)
        }
    }

    public var delay: TimeInterval {
        switch self {
        case .rapidActingAdult:
            return .minutes(15)
        case .rapidActingChild:
            return .minutes(15)
        case .fiasp:
            return .minutes(15)
        case .lyumjev:
            return .minutes(15)
        case.afrezza:
            return .minutes(15)
        }
    }
    
    var model: InsulinModel {
        return ExponentialInsulinModel(actionDuration: actionDuration, peakActivityTime: peakActivity, delay: delay)
    }
}


extension ExponentialInsulinModelPreset: InsulinModel {
    public var effectDuration: TimeInterval {
        return model.effectDuration
    }

    public func percentEffectRemaining(at time: TimeInterval) -> Double {
        return model.percentEffectRemaining(at: time)
    }
}

extension ExponentialInsulinModelPreset: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "\(self.rawValue)(\(String(reflecting: model)))"
    }
}
