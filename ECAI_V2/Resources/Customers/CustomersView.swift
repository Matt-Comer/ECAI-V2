//
//  CustomersView.swift
//  ECAI_V2
//
//  Created by Matthew Comer on 2026-07-17.
//
//
import SwiftUI
// Displays the customer management screen.
struct CustomersView: View {
    // Stores the customers displayed on the screen.
    @State private var customers: [Customer] = []
    // Controls when the customer form is displayed.
    @State private var showCustomerForm = false
    // Stores the customer selected for editing.
    @State private var selectedCustomer: Customer?
// Stores the metallic gold border gradient.
    private let borderGradient = LinearGradient(
        colors: [
            Color(red: 1.00, green: 0.92, blue: 0.60),
            Color(red: 0.82, green: 0.64, blue: 0.20),
            Color(red: 1.00, green: 0.96, blue: 0.72)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    // Stores the metallic gold title gradient.
    private let titleGradient = LinearGradient(
        colors: [
            Color(red: 1.00, green: 0.88, blue: 0.45),
            Color(red: 0.83, green: 0.69, blue: 0.22),
            Color(red: 0.67, green: 0.49, blue: 0.10)
        ],
        startPoint: .top,
        endPoint: .bottom
    )
// Stores the dark customer-card gradient.
    private let cardGradient = LinearGradient(
        colors: [
            Color(red: 0.10, green: 0.075, blue: 0.055),
            Color(red: 0.065, green: 0.055, blue: 0.055)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    // Builds the complete Customers screen.
    var body: some View {
        // Places the content over the black background.
        ZStack {
        // Displays the application background.
            Color.black
                .ignoresSafeArea()
            // Allows the screen to scroll vertically.
            ScrollView {
                // Arranges every section vertically.
                VStack(alignment: .leading, spacing: 20) {
                    // Displays the branding header.
                    brandHeader
                    // Displays the customer artwork.
                    heroCard
                    // Opens the form used to add a new customer.
                    Button {
                        selectedCustomer = nil
                        showCustomerForm = true
                    } label: {
                        Label("Add Customer", systemImage: "person.badge.plus")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity)
                            .padding(14)
                            .background(titleGradient)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                    }
                // Displays one card for every customer.
                    ForEach(customers) { customer in
                        Button {
                            selectedCustomer = customer
                        } label: {
                            customerCard(customer: customer)
                        }
                        .buttonStyle(.plain)
                    }
                }
            // Adds spacing around the screen.
                .padding()
            // Keeps the final customer above the tab bar.
                .padding(.bottom, 90)
            }
        // Hides the scroll indicator.
            .scrollIndicators(.hidden)
        }
        // Loads the saved customers when the screen opens.
        .onAppear {
            loadCustomers()
        }
        // Displays the form used to add a new customer.
        .sheet(isPresented: $showCustomerForm) {
            CustomerFormView(
                customer: nil
            ) { customer in
                saveCustomer(customer)
            }
        }
        // Displays the selected customer for editing.
        .sheet(item: $selectedCustomer) { customer in
            CustomerFormView(
                customer: customer
            ) { customer in
                saveCustomer(customer)
            }
        }
    }
    // Creates the Customers branding header.
    private var brandHeader: some View {
        ZStack(alignment: .topLeading) {
            // Creates the dark header background.
            RoundedRectangle(cornerRadius: 22)
                .fill(Color(red: 0.055, green: 0.045, blue: 0.045))
            // Adds the metallic gold border.
            RoundedRectangle(cornerRadius: 22)
                .stroke(borderGradient, lineWidth: 2)
        // Displays the official E.C.A.I. logo.
            Image("ECAI-Logo-#1")
                .resizable()
                .scaledToFit()
                .frame(width: 78, height: 78)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.leading, 16)
                .padding(.top, 14)
            // Displays the social-media icons.
            HStack(spacing: 5) {
                Image("facebook")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 31, height: 31)
                Image("LinkedInIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 31, height: 31)
                Image("x")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26, height: 26)
            }
            .frame(maxWidth: .infinity, alignment: .topTrailing)
            .padding(.top, 22)
            .padding(.trailing, 18)
            // Displays the centered title and initials.
            VStack(spacing: 5) {
                Text("E.C.A.I.")
                    .font(.system(size: 34, weight: .black))
                    .foregroundStyle(titleGradient)
                    .shadow(
                        color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.55),
                        radius: 8
                    )
                Text("C.C.")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .tracking(1.4)
                    .foregroundStyle(titleGradient)
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 50)
            .padding(.horizontal, 115)
        }
        .frame(height: 135)
        .shadow(color: .black.opacity(0.55), radius: 12, x: 0, y: 6)
        .shadow(
            color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.30),
            radius: 12
        )
    }
    // Creates the customer artwork card.
    private var heroCard: some View {
        ZStack(alignment: .bottomLeading) {
            // Displays the complete artwork without cropping faces.
            Image("ECAI-splashscreen-V7")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
            // Darkens the artwork behind the text.
            LinearGradient(
                colors: [
                    Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.04),
                    Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.16),
                    .black.opacity(0.95)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            // Displays the artwork title and description.
            VStack(alignment: .leading, spacing: 4) {
                Text("CUSTOMERS")
                    .font(.system(size: 28, weight: .black))
                    .foregroundStyle(titleGradient)
                    .shadow(color: .black, radius: 3, x: 0, y: 2)
                Text("Manage your customer database.")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.82))
            }
            .padding(16)
        }
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(borderGradient, lineWidth: 2)
        )
        .shadow(
            color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.25),
            radius: 10
        )
    }
    // Creates one customer information card.
    private func customerCard(customer: Customer) -> some View {
        // Arranges the customer information horizontally.
        HStack(spacing: 14) {
            // Displays the customer profile icon.
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 42))
                .foregroundStyle(titleGradient)
                .frame(width: 58, height: 58)
                .background(Color.black.opacity(0.45))
                .clipShape(RoundedRectangle(cornerRadius: 14))
            // Displays the customer's contact information.
            VStack(alignment: .leading, spacing: 6) {
                Text(customer.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Label(customer.phone, systemImage: "phone.fill")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.75))
                Label(customer.address, systemImage: "mappin.circle.fill")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.75))
            }
            // Pushes the chevron to the right.
            Spacer()
            // Displays the navigation chevron.
            Image(systemName: "chevron.right")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(
                    Color(red: 0.83, green: 0.69, blue: 0.22)
                )
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(18)
        .background(cardGradient)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(borderGradient, lineWidth: 2)
        )
        .shadow(
            color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.25),
            radius: 10
        )
    }
    //  Saves a new customer or updates an existing customer.
    private func saveCustomer(_ customer: Customer) {
        // Updates the matching customer when it already exists.
        if let index = customers.firstIndex(where: { $0.id == customer.id }) {
            customers[index] = customer
        } else {
            // Adds the customer when it does not already exist.
            customers.append(customer)
        }
        // Saves the updated customer  list.
        saveCustomers()
    }
    // Saves  the customer list on the device.
    private func saveCustomers() {
        if let data = try? JSONEncoder().encode(customers) {
            UserDefaults.standard.set(data, forKey: "ECAICustomers")
        }
    }
   // / Loads saved customers from the device.
    private func loadCustomers() {
        // Uses saved customers when customer data already exists.
        if let data = UserDefaults.standard.data(forKey: "ECAICustomers"),
           let savedCustomers = try? JSONDecoder().decode([Customer].self, from: data) {
            customers = savedCustomers
        } else {
            // Creates the original customers the first time the app runs.
            customers = [
                Customer(name: "Frank", phone: "416-555-1122", address: "Toronto, ON"),
                Customer(name: "Clint", phone: "416-555-3344", address: "Etobicoke, ON"),
                Customer(name: "Jessica", phone: "416-555-7788", address: "Toronto, ON")
            ]
            saveCustomers()
        }
    }
}
// Displays the form used to add or edit a customer.
private struct CustomerFormView: View {
    // Allows the form to close itself.
    @Environment(\.dismiss) private var dismiss
    //  Stores the customer identifier when editing.
    private let customerID: UUID
    // Stores the customer's name while editing.
    @State private var name: String
    // Stores the customer's phone number while editing.
    @State private var phone: String
    // Stores the customer's address while editing.
    @State private var address: String
    // Runs when the customer is saved.
    let onSave: (Customer) -> Void
    // Creates the metallic gold form gradient.
    private let goldGradient = LinearGradient(
        colors: [
            Color(red: 1.00, green: 0.92, blue: 0.60),
            Color(red: 0.82, green: 0.64, blue: 0.20),
            Color(red: 1.00, green: 0.96, blue: 0.72)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    // Creates the customer form with existing or empty information.
    init(customer: Customer?, onSave: @escaping (Customer) -> Void) {
        customerID = customer?.id ?? UUID()
        _name = State(initialValue: customer?.name ?? "")
        _phone = State(initialValue: customer?.phone ?? "")
        _address = State(initialValue: customer?.address ?? "")
        self.onSave = onSave
    }
    // Builds the complete customer form.
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack(spacing: 16) {
                    Text("CUSTOMER INFORMATION")
                        .font(.headline)
                        .fontWeight(.black)
                        .foregroundStyle(
                            Color(red: 0.83, green: 0.69, blue: 0.22)
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Name", text: $name)
                        .foregroundStyle(.white)
                        .padding(14)
                        .background(Color(red: 0.08, green: 0.08, blue: 0.09))
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(goldGradient, lineWidth: 1.5)
                        )
                    TextField("Phone", text: $phone)
                        .keyboardType(.phonePad)
                        .foregroundStyle(.white)
                        .padding(14)
                        .background(Color(red: 0.08, green: 0.08, blue: 0.09))
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(goldGradient, lineWidth: 1.5)
                        )
                    TextField("Address", text: $address)
                        .foregroundStyle(.white)
                        .padding(14)
                        .background(Color(red: 0.08, green: 0.08, blue: 0.09))
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(goldGradient, lineWidth: 1.5)
                        )
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Customer")
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                // Closes the form without saving.
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .tint(
                        Color(red: 0.83, green: 0.69, blue: 0.22)
                    )
                }
                // Saves the customer information.
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        onSave(
                            Customer(
                                id: customerID,
                                name: name,
                                phone: phone,
                                address: address
                            )
                        )
                        dismiss()
                    }
                    .tint(
                        Color(red: 0.83, green: 0.69, blue: 0.22)
                    )
                    .disabled(name.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }
}
// Displays the Customers screen   inside Xcode.
#Preview {
    CustomersView()
}

