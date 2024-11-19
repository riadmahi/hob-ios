//
//  OriginsView.swift
//  Hob
//
//  Created by Riad on 15/11/2024.
//

import SwiftUI

struct OriginsView: View {
    @Binding var selectedOrigins: [String]
    @State private var search: String = ""
    @State private var countries = [Country]()
    
    let next: () -> Void
    let back: () -> Void
    
    var body: some View {
        VStack(spacing: 48) {
            VStack(spacing: 12) {
                HStack {
                    Button(action: back) {
                        Image("ArrowLeftIcon")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                    Spacer()
                }
                AuthStepHeader(
                    screenName: "Général",
                    displayName: "Indique tes origines (\(selectedOrigins.count)/2)"
                )
            }
            VStack  {
                HobTextField(hint: "Rechercher un pays", text: $search)
                
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 0) {
                        ForEach(countries.filter { search.isEmpty || $0.pays.lowercased().contains(search.lowercased()) }, id: \.id) { country in
                            HStack {
                                Text("\(country.emoji) \(country.pays)")
                                    .brSonomaFont(.medium, 15)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(selectedOrigins.contains(country.pays) ? .white : .white)
                                if selectedOrigins.contains(country.pays) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.accent)
                                        .padding(.trailing, 12)
                                }
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 20)
                            .background(selectedOrigins.contains(country.pays) ? Color("ContainerColor") : Color("SecondaryContainerColor"))
                            .onTapGesture {
                                if selectedOrigins.contains(country.pays) {
                                    selectedOrigins.removeAll { $0 == country.pays }
                                } else {
                                    if selectedOrigins.count < 2 {
                                        selectedOrigins.append(country.pays)
                                    }
                                }
                            }
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                }
                
            }
            
            HobButton(text: "Suivant", width: .infinity, disabled: selectedOrigins.count < 1) {
                next()
            }
            Spacer()
        }
        .padding(.horizontal, 12)
        .onAppear {
            loadCountries()
        }
    }
    
    func loadCountries() {
        if let url = Bundle.main.url(forResource: "fr_countries", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decodedCountries = try JSONDecoder().decode([Country].self, from: data)
                self.countries = decodedCountries
            } catch {
                print("Erreur de chargement des pays : \(error)")
            }
        } else {
            print("Fichier countries.json non trouvé.")
        }
    }
}

#Preview {
    OriginsView(selectedOrigins: .constant([]),next: { }, back: { })
        .preferredColorScheme(.dark)
}
