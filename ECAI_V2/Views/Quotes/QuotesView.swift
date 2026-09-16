
//
//  QuotesView.swift
//  ECAI_V1
//
//  Created by Matthew Comer on 2026-06-29.
//
import SwiftUI
// Displays the Quotes screen for Elite Contractor AI.
struct QuotesView: View {
    // Stores the quote information displayed on this screen.
    @State private var quotes: [Quote] = []
    // Controls when the quote form is displayed.
    @State private var showQuoteForm = false
    // Stores the quote selected for editing.
    @State private var selectedQuote: Quote?
    // Creates the metallic gold gradient.
    private var goldGradient: LinearGradient {
        LinearGradient(
            colors: [
                Color(red: 1.00, green: 0.88, blue: 0.45),
                Color(red: 0.83, green: 0.69, blue: 0.22),
                Color(red: 0.67, green: 0.49, blue: 0.10)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    var body: some View {
        // Creates the navigation system for this screen.
        NavigationStack {
            // Places the background behind the quote content.
            ZStack {
                // Displays the black application background.
                Color.black
                    .ignoresSafeArea()
            // Allows the quote list to scroll vertically.
                ScrollView {
                // Places every section of the screen vertically.
                    VStack(
                        alignment: .leading,
                        spacing: 22
                    ) {
                    // Displays the same solid header used by the other main screens.
                        ZStack(
                            alignment: .topLeading
                        ) {
            // Displays the matte-black header background.
                            RoundedRectangle(
                                cornerRadius: 22
                            )
                            .fill(
                                Color(
                                    red: 0.055,
                                    green: 0.045,
                                    blue: 0.045
                                )
                            )
                        // Displays the metallic gold header border.
                            RoundedRectangle(
                                cornerRadius: 22
                            )
                            .stroke(
                                goldGradient,
                                lineWidth: 2
                            )
                            // Displays the correct Dashboard logo.
                            Image("ECAI-Logo-#1")
                                .resizable()
                                .scaledToFit()
                                .frame(
                                    width: 78,
                                    height: 78
                                )
                                .clipShape(
                                    RoundedRectangle(
                                        cornerRadius: 16
                                    )
                                )
                                .padding(.leading, 16)
                                .padding(.top, 14)
                            // Displays the same social icons used on Dashboard, Customers, and Jobs.
                            HStack(
                                spacing: 5
                            ) {
                                // Displays the Facebook icon.
                                Image("facebook")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 31, height: 31)
                                // Displays the LinkedIn icon.
                                Image("LinkedInIcon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 31, height: 31)
                                // Displays the X icon.
                                Image("x")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 26, height: 26)
                            }
                            .frame(
                                maxWidth: .infinity,
                                alignment: .topTrailing
                            )
                            .padding(.top, 22)
                            .padding(.trailing, 18)
                            // Displays the centered E.C.A.I. title and Quotes subtitle.
                            VStack(
                                spacing: 5
                            ) {
                                // Displays the metallic gold E.C.A.I. title.
                                Text("E.C.A.I.")
                                    .font(
                                        .system(
                                            size: 34,
                                            weight: .black
                                        )
                                    )
                                    .foregroundStyle(
                                        goldGradient
                                    )
                                    .shadow(
                                        color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.55),
                                        radius: 8
                                    )
                                // Displays the Quotes page subtitle.
                                Text("Q.C.")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundStyle(
                                        Color(red: 0.83, green: 0.69, blue: 0.22)
                                    )
                            }
                            .frame(
                                maxWidth: .infinity
                            )
                            .padding(.top, 50)
                            .padding(.horizontal, 115)
                        }
                        .frame(height: 135)
                        .shadow(
                            color: .black.opacity(0.55),
                            radius: 12,
                            x: 0,
                            y: 6
                        )
                        .shadow(
                            color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.30),
                            radius: 12
                        )
                        // Displays the Quotes PNG using the same layout as Customers.
                        ZStack(
                            alignment: .bottomLeading
                        ) {
                            // Displays the complete Quotes PNG without cropping the people.
                            Image("ECAI_ClientPresentation_V1")
                                // Allows the Quotes PNG to resize.
                                .resizable()
                                // Fits the complete PNG like the Customers PNG.
                                .scaledToFit()
                                // Expands the complete artwork across the available width.
                                .frame(
                                    maxWidth: .infinity
                                )
                            // Adds the same bottom fade used over the Customers PNG.
                            LinearGradient(
                                colors: [
                                    // Keeps the upper artwork visible.
                                    Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.04),
                                    // Adds the middle gold tint.
                                    Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.16),
                                    // Darkens the bottom so the text stays readable.
                                    Color.black.opacity(0.95)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            // Displays the Quotes title and description over the PNG.
                            VStack(
                                alignment: .leading,
                                spacing: 4
                            ) {
                                // Displays the Quotes hero heading.
                                Text("QUOTE INTELLIGENCE")
                                    .font(
                                        .system(
                                            size: 28,
                                            weight: .black
                                        )
                                    )
                                    .foregroundStyle(
                                        goldGradient
                                    )
                                    .shadow(
                                        color: .black,
                                        radius: 3,
                                        x: 0,
                                        y: 2
                                    )
                                // Displays the Quotes hero description.
                                Text("Build estimates, approvals, and customer proposals.")
                                    .font(.subheadline)
                                    .foregroundStyle(
                                        .white.opacity(0.82)
                                    )
                            }
                            // Uses the same text padding as Customers.
                            .padding(16)
                        }
                        // Uses the same rounded shape as the Customers PNG.
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 22
                            )
                        )
                        // Uses the same gold border as the Customers PNG.
                        .overlay(
                            RoundedRectangle(
                                cornerRadius: 22
                            )
                            .stroke(
                                goldGradient,
                                lineWidth: 2
                            )
                        )
                        // Uses the same gold glow as the Customers PNG.
                        .shadow(
                            color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.25),
                            radius: 10
                        )
                        // Opens the form used to create a new quote.
                        Button {
                            selectedQuote = nil
                            showQuoteForm = true
                        } label: {
                            Label(
                                "Add Quote",
                                systemImage: "plus.circle.fill"
                            )
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity)
                            .padding(14)
                            .background(goldGradient)
                            .clipShape(
                                RoundedRectangle(
                                    cornerRadius: 14
                                )
                            )
                        }
                        // Loops through every quote stored in the quotes array.
                        ForEach(quotes) { quote in
                            // Opens the selected quote for editing.
                            Button {
                                selectedQuote = quote
                            } label: {
                                // Creates one reusable quote card.
                                VStack(
                                    alignment: .leading,
                                    spacing: 12
                                ) {
                                    // Displays the customer's name.
                                    Text(quote.customerName)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundStyle(.white)
                                    // Displays the total dollar amount for the quote.
                                    Text("$\(quote.amount, specifier: "%.0f")")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundStyle(goldGradient)
                                    // Places the quote status icon and text on one row.
                                    HStack(
                                        spacing: 10
                                    ) {
                                        // Displays the document icon.
                                        Image(systemName: "doc.text.fill")
                                            .foregroundStyle(Color(red: 0.83, green: 0.69, blue: 0.22))
                                        // Displays the current quote status.
                                        Text(quote.status)
                                            .foregroundStyle(
                                                .white.opacity(0.85)
                                            )
                                    }
                                }
                                // Allows the quote card to fill the available width.
                                .frame(
                                    maxWidth: .infinity,
                                    alignment: .leading
                                )
                                // Adds spacing inside the quote card.
                                .padding()
                                // Creates the dark background for the quote card.
                                .background(
                                    Color(
                                        red: 0.08,
                                        green: 0.08,
                                        blue: 0.09
                                    )
                                )
                                // Rounds the corners of the quote card.
                                .cornerRadius(18)
                                // Adds the metallic gold border around the quote card.
                                .overlay(
                                    RoundedRectangle(
                                        cornerRadius: 18
                                    )
                                    .stroke(
                                        goldGradient,
                                        lineWidth: 1.4
                                    )
                                )
                                // Adds the soft gold glow behind the quote card.
                                .shadow(
                                    color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.16),
                                    radius: 8
                                )
                            }
                            .buttonStyle(.plain)
                        }
                        // Pushes the content toward the top of the screen.
                        Spacer()
                    }
                    // Adds the original spacing around the screen content.
                    .padding()
                    // Keeps the final quote above the tab bar.
                    .padding(.bottom, 100)
                }
            }
        }
        // Loads the saved quotes when the Quotes screen appears.
        .onAppear {
            loadQuotes()
        }
        // Displays the form used to add a new quote.
        .sheet(isPresented: $showQuoteForm) {
            QuoteFormView(
                quote: nil
            ) { quote in
                saveQuote(quote)
            }
        }
        // Displays the selected quote for editing.
        .sheet(item: $selectedQuote) { quote in
            QuoteFormView(
                quote: quote
            ) { quote in
                saveQuote(quote)
            }
        }
    }
    // Saves a new quote or updates an existing quote.
    private func saveQuote(_ quote: Quote) {
        // Updates the matching quote when it already exists.
        if let index = quotes.firstIndex(
            where: { $0.id == quote.id }
        ) {
            quotes[index] = quote
        } else {
            // Adds the new quote to the quote list.
            quotes.append(quote)
        }
        // Saves the updated quote list.
        saveQuotes()
    }
    // Saves all quotes on the device.
    private func saveQuotes() {
        if let data = try? JSONEncoder().encode(quotes) {
            UserDefaults.standard.set(
                data,
                forKey: "ECAIQuotes"
            )
        }
    }
    // Loads saved quotes from the device.
    private func loadQuotes() {
        // Uses saved quote information when it already exists.
        if let data = UserDefaults.standard.data(
            forKey: "ECAIQuotes"
        ),
           let savedQuotes = try? JSONDecoder().decode(
            [Quote].self,
            from: data
           ) {
            quotes = savedQuotes
        } else {
            // Creates the original sample quotes the first time the app runs.
            quotes = [
                Quote(
                    customerName: "Frank",
                    amount: 2500,
                    status: "Sent"
                ),
                Quote(
                    customerName: "Clint",
                    amount: 850,
                    status: "Draft"
                ),
                Quote(
                    customerName: "Jessica",
                    amount: 6200,
                    status: "Approved"
                )
            ]
            // Saves the original quotes for future launches.
            saveQuotes()
        }
    }
}
// Displays the form used to add or edit a quote.
private struct QuoteFormView: View {
    // Allows the quote form to close itself.
    @Environment(\.dismiss) private var dismiss
    // Stores the quote identifier while editing.
    private let quoteID: UUID
    // Stores the customer name entered in the form.
    @State private var customerName: String
    // Stores the dollar amount entered in the form.
    @State private var amount: String
    // Stores the selected quote status.
    @State private var status: String
    // Stores the available quote statuses.
    private let statuses = [
        "Draft",
        "Sent",
        "Approved",
        "Declined"
    ]
    // Runs when the quote is saved.
    let onSave: (Quote) -> Void
    // Creates the form using an existing quote or empty information.
    init(
        quote: Quote?,
        onSave: @escaping (Quote) -> Void
    ) {
        quoteID = quote?.id ?? UUID()
        _customerName = State(
            initialValue: quote?.customerName ?? ""
        )
        _amount = State(
            initialValue: quote.map {
                String(format: "%.0f", $0.amount)
            } ?? ""
        )
        _status = State(
            initialValue: quote?.status ?? "Draft"
        )
        self.onSave = onSave
    }
    // Displays the complete quote form.
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack(spacing: 18) {
                    Text("QUOTE INFORMATION")
                        .font(.headline)
                        .fontWeight(.black)
                        .foregroundStyle(
                            Color(red: 0.83, green: 0.69, blue: 0.22)
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField(
                        "Customer Name",
                        text: $customerName
                    )
                    .padding(14)
                    .background(Color(red: 0.08, green: 0.08, blue: 0.09))
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(
                                Color(red: 0.83, green: 0.69, blue: 0.22),
                                lineWidth: 1.4
                            )
                    )
                    TextField(
                        "Amount",
                        text: $amount
                    )
                    .keyboardType(.decimalPad)
                    .padding(14)
                    .background(Color(red: 0.08, green: 0.08, blue: 0.09))
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(
                                Color(red: 0.83, green: 0.69, blue: 0.22),
                                lineWidth: 1.4
                            )
                    )
                    HStack {
                        Text("Status")
                            .foregroundStyle(.white)
                        Spacer()
                        Picker(
                            "Status",
                            selection: $status
                        ) {
                            ForEach(
                                statuses,
                                id: \.self
                            ) { status in
                                Text(status)
                            }
                        }
                        .tint(
                            Color(red: 0.83, green: 0.69, blue: 0.22)
                        )
                    }
                    .padding(14)
                    .background(Color(red: 0.08, green: 0.08, blue: 0.09))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(
                                Color(red: 0.83, green: 0.69, blue: 0.22),
                                lineWidth: 1.4
                            )
                    )
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Quote")
            .toolbar {
                // Closes the form without saving.
                ToolbarItem(
                    placement: .cancellationAction
                ) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .tint(
                        Color(red: 0.83, green: 0.69, blue: 0.22)
                    )
                }
                // Saves the quote information.
                ToolbarItem(
                    placement: .confirmationAction
                ) {
                    Button("Save") {
                        if let quoteAmount = Double(amount) {
                            onSave(
                                Quote(
                                    id: quoteID,
                                    customerName: customerName,
                                    amount: quoteAmount,
                                    status: status
                                )
                            )
                            dismiss()
                        }
                    }
                    .tint(
                        Color(red: 0.83, green: 0.69, blue: 0.22)
                    )
                    .disabled(
                        customerName
                            .trimmingCharacters(
                                in: .whitespaces
                            )
                            .isEmpty ||
                        Double(amount) == nil
                    )
                }
            }
        }
    }
}
// Displays the Quotes screen inside the Xcode preview.
#Preview {
    // Creates a preview of the Quotes screen.
    QuotesView()
}


