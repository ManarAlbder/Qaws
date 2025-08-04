//
//  ContentView.swift
//  User Profile
//
//  Created by Manar Albader on 10/02/1447 AH.
//

import SwiftUI

struct ContentView: View {
    // Values for the form; assuming that they're already filled
    @State private var fullName = "Layla al"
    @State private var graduationYear = "2025"
    @State private var selectedMajor = "Computer Science"
    @State private var selectedField = "Artificial Intelligence"
    @State private var showAlert = false

    let majors = ["Computer Science", "Information Technology", "Information Security", "Cyber Security"]
    let fields = ["Artificial Intelligence", "Software Engineering", "Data Science", "Game Development"]
    
    var body: some View {
        ZStack {
            // Background color
            Color(red: 0x55/255, green: 0x76/255, blue: 0x57/255)
                .ignoresSafeArea()
            
            VStack {
                // Navigation Bar
                HStack {
                    // Profile icon
                    Image(systemName: "person.circle.fill")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    
                    Text("User Profile")
                        .foregroundColor(.white)
                        .font(.headline)
                        .bold()
                    
                    Spacer()
                    
                    // X button
                    Button(action: {
                        // Close action
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .background(
                    LinearGradient(
                        colors: [
                            Color(red: 0x52/255, green: 0x6E/255, blue: 0x5B/255),
                            Color(red: 0x9E/255, green: 0xD4/255, blue: 0xAF/255)
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                
                // Form Fields
                VStack(spacing: 20) {
                    // Full Name field
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Full Name")
                            .foregroundColor(.white)
                            .font(.subheadline)
                        
                        TextField("Enter full name", text: $fullName)
                            .padding()
                            .background(Color.black.opacity(0.3))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    
                    // Graduation Year field
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Graduation Year")
                            .foregroundColor(.white)
                            .font(.subheadline)
                        
                        HStack {
                            TextField("Year", text: $graduationYear)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Image(systemName: "calendar")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.black.opacity(0.3))
                        .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    
                    // Major dropdown
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Major")
                            .foregroundColor(.white)
                            .font(.subheadline)
                        
                        Picker("Major", selection: $selectedMajor) {
                            ForEach(majors, id: \.self) { major in
                                Text(major).tag(major)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.black.opacity(0.3))
                        .cornerRadius(8)
                        .accentColor(.white)
                    }
                    .padding(.horizontal)

                    // Field dropdown
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Field")
                            .foregroundColor(.white)
                            .font(.subheadline)
                        
                        Picker("Field", selection: $selectedField) {
                            ForEach(fields, id: \.self) { field in
                                Text(field).tag(field)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.black.opacity(0.3))
                        .cornerRadius(8)
                        .accentColor(.white)
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 20) // Space from navigation
                
                Spacer() // Pushes Edit button to bottom
                
                // Edit Button
                Button(action: {
                    showAlert = true
                }) {
                    Text("Edit")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black.opacity(0.2))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .alert("Are you sure you want to change your field?", isPresented: $showAlert) {
                    Button("Continue", role: .destructive) {
                        // Handle continue action
                    }
                    Button("Cancel", role: .cancel) {
                        // Handle cancel action
                    }
                } message: {
                    Text("Changing your field will generate a new roadmap and permanently delete your current progress. This action cannot be undone.")
                }
            } // Main VStack closes here
        } // ZStack closes here
    }
}

#Preview {
    ContentView()
}
