//
//  ContentView.swift
//  ECAI_V2
//
//  Created by Matthew Comer.
//
import SwiftUI
// Displays the main navigation for Elite Contractor AI.
struct ContentView: View {

    var body: some View {

        // Creates the main tab navigation for the application.
        TabView {

            // Displays the main business dashboard.
            DashboardView()
                .tabItem {

                    // Displays the dashboard tab icon.
                    Image(
                        systemName: "house.fill"
                    )

                    // Displays the dashboard tab title.
                    Text("Dashboard")

                }

            // Displays the customer management screen.
            CustomersView()
                .tabItem {

                    // Displays the customers tab icon.
                    Image(
                        systemName: "person.3.fill"
                    )

                    // Displays the customers tab title.
                    Text("Customers")

                }

            // Displays the job management screen.
            JobsView()
                .tabItem {

                    // Displays the jobs tab icon.
                    Image(
                        systemName: "hammer.fill"
                    )

                    // Displays the jobs tab title.
                    Text("Jobs")

                }

            // Displays the quote management screen.
            QuotesView()
                .tabItem {

                    // Displays the quotes tab icon.
                    Image(
                        systemName: "doc.text.fill"
                    )

                    // Displays the quotes tab title.
                    Text("Quotes")

                }

            // Displays the additional ECAI tools.
            MoreView()
                .tabItem {

                    // Displays the More tab icon.
                    Image(
                        systemName: "ellipsis.circle.fill"
                    )

                    // Displays the More tab title.
                    Text("More")

                }

        }

        // Applies the ECAI gold accent colour.
        .tint(
            Color(
                red: 0.83,
                green: 0.69,
                blue: 0.22
            )
        )

    }

}

// Displays the main application inside Xcode.
#Preview {

    // Creates a preview of the main application.
    ContentView()

}
