//
//  InstructionList.swift
//  LoopKitUI
//
//  Created by Nathaniel Hamming on 2020-02-20.
//  Copyright © 2020 LoopKit Authors. All rights reserved.
//

import SwiftUI

public struct InstructionList: View {
    let instructions: [LocalizedStringKey]
    
    public init(instructions: [LocalizedStringKey]) {
        self.instructions = instructions
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(instructions.indices, id: \.self) { index in
                HStack(alignment: .top) {
                    Text("\(index+1)")
                        .padding(6)
                        .background(Circle().fill(Color.accentColor))
                        .foregroundColor(.white)
                        .font(.caption)
                        .accessibility(label: Text("\(index+1), ")) // Adds a pause after the number
                    Text(self.instructions[index])
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(2)
                }
                .accessibilityElement(children: .combine)
            }
        }
    }
}

struct InstructionList_Previews: PreviewProvider {
    static var previews: some View {
        let instructions: [LocalizedStringKey] = [
            "This is the first step.",
            "This second step is a bit more tricky and needs more description to support the user, albeit it could be more concise.",
            "With this final step, the task will be accomplished."
        ]
        return InstructionList(instructions: instructions)
    }
}
