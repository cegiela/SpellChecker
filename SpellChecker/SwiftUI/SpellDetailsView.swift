//
//  SpellDetailsView.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/17/22.
//

import SwiftUI

struct SpellDetailsView: View {
    @ObservedObject var adapter: SpellDetailsViewModelAdapter
    
    var body: some View {
        Text(adapter.spellItem?.name ?? "")
    }
}

struct SpellDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let example = SpellDetailsViewModelAdapter.example()
        SpellDetailsView(adapter: example)
    }
}
