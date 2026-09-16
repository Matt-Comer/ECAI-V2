//
//  BusinessProfileView.swift
//  ECAI_V2
//
//  Created by Matthew Comer on 2026-07-17.
//
import SwiftUI
// Displays the Business Profile screen.
struct BusinessProfileView: View {
    // Stores whether the editing screen is open.
    @State private var isEditingProfile = false
    // Stores the saved company name.
    @State private var companyName = "Elite Contractor AI"
    // Stores the saved owner name.
    @State private var ownerName = "Matthew Comer"
    // Stores the saved phone number.
    @State private var phone = "437 898 9933"
    // Stores the saved email address.
    @State private var email = "mattycomer@hotmail.com"
    // Stores the saved service area.
    @State private var serviceArea = "Toronto and GTA"
    // Stores the current active job count.
    @State private var activeJobs = 0
    // Stores the current customer count.
    @State private var customerCount = 0
    // Stores the current estimate count.
    @State private var estimateCount = 0
    // Stores the metallic gold accent.
    private let gold = Color(red: 0.83, green: 0.69, blue: 0.22)
    // Stores the metallic gold gradient.
    private let goldGradient = LinearGradient(
        colors: [
            Color(red: 1.00, green: 0.92, blue: 0.60),
            Color(red: 0.82, green: 0.64, blue: 0.20),
            Color(red: 1.00, green: 0.96, blue: 0.72)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    // Builds the complete Business Profile screen.
    var body: some View {
        // Places the background behind the screen content.
        ZStack {
            // Displays the E.C.A.I. graphite background.
            ECAITheme.graphite
                .ignoresSafeArea()
            // Displays the scrollable Business Profile content.
            businessProfileContent
        }
        // Loads saved profile information and current business statistics.
        .onAppear {
            loadProfile()
            loadBusinessStatistics()
        }
        // Opens the Business Profile editing screen.
        .sheet(isPresented: $isEditingProfile) {
            BusinessProfileEditView(
                companyName: $companyName,
                ownerName: $ownerName,
                phone: $phone,
                email: $email,
                serviceArea: $serviceArea
            )
        }
    }
    // Builds the scrollable Business Profile content.
    private var businessProfileContent: some View {
        // Allows the screen content to scroll vertically.
        ScrollView {
            // Places every Business Profile section vertically.
            VStack(spacing: 18) {
                // Displays the reusable E.C.A.I. hero banner.
                ECAIHeroView(
                    imageName: "ECAI-splashscreen-V6",
                    title: "Business Profile",
                    subtitle: "Build your company identity inside E.C.A.I."
                )
                // Displays the company information.
                businessInformationCard
                // Displays the owner information.
                ownerInformationCard
                // Displays the business statistics.
                businessStatisticsCard
                // Displays the company services.
                servicesCard
                // Displays the company contact information.
                contactInformationCard
                // Displays the Edit Business Profile button.
                editProfileButton
            }
            // Adds spacing around the screen content.
            .padding()
            // Adds space below the final button.
            .padding(.bottom, 30)
        }
        // Hides the vertical scroll indicator.
        .scrollIndicators(.hidden)
    }
    // Creates the company information card.
    private var businessInformationCard: some View {
        // Places the company icon and information horizontally.
        HStack(spacing: 16) {
            // Displays the company icon.
            Image(systemName: "building.2.fill")
                .font(.system(size: 34))
                .foregroundStyle(goldGradient)
                .frame(width: 62, height: 62)
                .background(ECAITheme.graphite.opacity(0.85))
                .clipShape(RoundedRectangle(cornerRadius: 14))
            // Places the company information vertically.
            VStack(alignment: .leading, spacing: 6) {
                // Displays the company name.
                Text(companyName)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                // Displays the company type.
                Text("Construction and Contractor Services")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.72))
                // Displays the company location.
                Label(
                    serviceArea,
                    systemImage: "mappin.circle.fill"
                )
                .font(.caption)
                .foregroundStyle(gold)
            }
            // Pushes the company information toward the left.
            Spacer()
        }
        // Allows the card to fill the available width.
        .frame(maxWidth: .infinity, alignment: .leading)
        // Adds spacing inside the card.
        .padding(18)
        // Applies the reusable card appearance.
        .businessProfileCard()
    }
    // Creates the owner information card.
    private var ownerInformationCard: some View {
        // Places the owner information vertically.
        VStack(alignment: .leading, spacing: 14) {
            // Displays the section heading.
            profileSectionHeader(
                icon: "person.crop.circle.fill",
                title: "Owner Information"
            )
            // Displays the owner's name.
            profileInformationRow(
                icon: "person.fill",
                title: "Owner",
                value: ownerName
            )
            // Displays the owner's experience.
            profileInformationRow(
                icon: "hammer.fill",
                title: "Experience",
                value: "25+ Years"
            )
            // Displays the owner's role.
            profileInformationRow(
                icon: "briefcase.fill",
                title: "Role",
                value: "Owner and Contractor"
            )
        }
        // Allows the card to fill the available width.
        .frame(maxWidth: .infinity, alignment: .leading)
        // Adds spacing inside the card.
        .padding(18)
        // Applies the reusable card appearance.
        .businessProfileCard()
    }
    // Creates the business statistics card.
    private var businessStatisticsCard: some View {
        // Places the statistics vertically.
        VStack(alignment: .leading, spacing: 16) {
            // Displays the section heading.
            profileSectionHeader(
                icon: "chart.bar.fill",
                title: "Business Overview"
            )
            // Places the statistics into two columns.
            LazyVGrid(
                columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                ],
                spacing: 12
            ) {
                // Displays the active jobs statistic.
                businessStatistic(
                    value: "\(activeJobs)",
                    title: "Active Jobs"
                )
                // Displays the customer statistic.
                businessStatistic(
                    value: "\(customerCount)",
                    title: "Customers"
                )
                // Displays the estimate statistic.
                businessStatistic(
                    value: "\(estimateCount)",
                    title: "Estimates"
                )
                // Displays the follow-up statistic.
                businessStatistic(
                    value: "0",
                    title: "Follow-Ups"
                )
            }
        }
        // Allows the card to fill the available width.
        .frame(maxWidth: .infinity, alignment: .leading)
        // Adds spacing inside the card.
        .padding(18)
        // Applies the reusable card appearance.
        .businessProfileCard()
    }
    // Creates the services card.
    private var servicesCard: some View {
        // Places the services vertically.
        VStack(alignment: .leading, spacing: 14) {
            // Displays the section heading.
            profileSectionHeader(
                icon: "wrench.and.screwdriver.fill",
                title: "Services"
            )
            // Displays the concrete service.
            serviceRow(
                icon: "square.stack.3d.up.fill",
                title: "Concrete and Parging"
            )
            // Displays the landscaping service.
            serviceRow(
                icon: "leaf.fill",
                title: "Landscaping and Interlock"
            )
            // Displays the renovation service.
            serviceRow(
                icon: "house.fill",
                title: "Renovations and Repairs"
            )
            // Displays the project management service.
            serviceRow(
                icon: "clipboard.fill",
                title: "Project Planning and Management"
            )
        }
        // Allows the card to fill the available width.
        .frame(maxWidth: .infinity, alignment: .leading)
        // Adds spacing inside the card.
        .padding(18)
        // Applies the reusable card appearance.
        .businessProfileCard()
    }
    // Creates the contact information card.
    private var contactInformationCard: some View {
        // Places the contact information vertically.
        VStack(alignment: .leading, spacing: 14) {
            // Displays the section heading.
            profileSectionHeader(
                icon: "phone.fill",
                title: "Contact Information"
            )
            // Displays the phone number.
            profileInformationRow(
                icon: "phone.circle.fill",
                title: "Phone",
                value: phone
            )
            // Displays the email address.
            profileInformationRow(
                icon: "envelope.fill",
                title: "Email",
                value: email
            )
            // Displays the service area.
            profileInformationRow(
                icon: "location.fill",
                title: "Service Area",
                value: serviceArea
            )
        }
        // Allows the card to fill the available width.
        .frame(maxWidth: .infinity, alignment: .leading)
        // Adds spacing inside the card.
        .padding(18)
        // Applies the reusable card appearance.
        .businessProfileCard()
    }
    // Creates the Edit Business Profile button.
    private var editProfileButton: some View {
        // Creates a button that opens the editing screen.
        Button {
            // Opens the Business Profile editing screen.
            isEditingProfile = true
        } label: {
            // Places the button icon and title horizontally.
            HStack(spacing: 10) {
                // Displays the edit icon.
                Image(systemName: "pencil.circle.fill")
                    .font(.title3)
                // Displays the button title.
                Text("Edit Business Profile")
                    .font(.headline)
                    .fontWeight(.bold)
            }
            // Allows the button to fill the available width.
            .frame(maxWidth: .infinity)
            // Adds vertical spacing inside the button.
            .padding(.vertical, 16)
            // Displays the button content in black.
            .foregroundStyle(.black)
            // Displays the metallic gold button background.
            .background(goldGradient)
            // Rounds the button corners.
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(
                color: gold.opacity(0.25),
                radius: 8
            )
        }
        // Removes the default button appearance.
        .buttonStyle(.plain)
    }
    // Creates one reusable section heading.
    private func profileSectionHeader(icon: String, title: String) -> some View {
        // Places the heading icon and title horizontally.
        HStack(spacing: 10) {
            // Displays the heading icon.
            Image(systemName: icon)
                .foregroundStyle(gold)
            // Displays the heading title.
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            // Pushes the heading toward the left.
            Spacer()
        }
    }
    // Creates one reusable information row.
    private func profileInformationRow(icon: String, title: String, value: String) -> some View {
        // Places the row information horizontally.
        HStack(spacing: 12) {
            // Displays the row icon.
            Image(systemName: icon)
                .foregroundStyle(gold)
                .frame(width: 24)
            // Displays the row label.
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.68))
            // Pushes the value toward the right.
            Spacer()
            // Displays the row value.
            Text(value)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .multilineTextAlignment(.trailing)
        }
    }
    // Creates one reusable business statistic.
    private func businessStatistic(value: String, title: String) -> some View {
        // Places the statistic value and title vertically.
        VStack(spacing: 6) {
            // Displays the statistic value.
            Text(value)
                .font(.system(size: 28, weight: .black))
                .foregroundStyle(goldGradient)
            // Displays the statistic title.
            Text(title)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.white.opacity(0.72))
                .multilineTextAlignment(.center)
        }
        // Allows the statistic to fill its grid column.
        .frame(maxWidth: .infinity)
        // Adds vertical spacing inside the statistic.
        .padding(.vertical, 16)
        // Creates the statistic background.
        .background(ECAITheme.graphite.opacity(0.82))
        // Rounds the statistic corners.
        .clipShape(RoundedRectangle(cornerRadius: 14))
        // Adds the metallic gold border.
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(
                    goldGradient,
                    lineWidth: 1
                )
        )
    }
    // Creates one reusable service row.
    private func serviceRow(icon: String, title: String) -> some View {
        // Places the service icon and title horizontally.
        HStack(spacing: 12) {
            // Displays the service icon.
            Image(systemName: icon)
                .foregroundStyle(gold)
                .frame(width: 24)
            // Displays the service title.
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            // Pushes the checkmark toward the right.
            Spacer()
            // Displays the enabled service indicator.
            Image(systemName: "checkmark.circle.fill")
                .foregroundStyle(gold)
        }
    }
    // Loads the saved Business Profile information.
    private func loadProfile() {
        companyName = UserDefaults.standard.string(forKey: "ECAICompanyName") ?? "Elite Contractor AI"
        ownerName = UserDefaults.standard.string(forKey: "ECAIOwnerName") ?? "Matthew Comer"
        phone = UserDefaults.standard.string(forKey: "ECAIPhone") ?? "437 898 9933"
        email = UserDefaults.standard.string(forKey: "ECAIEmail") ?? "mattycomer@hotmail.com"
        serviceArea = UserDefaults.standard.string(forKey: "ECAIServiceArea") ?? "Toronto and GTA"
    }
    // Loads the live business statistics from saved application data.
    private func loadBusinessStatistics() {
        // Loads and counts every saved customer.
        if let data = UserDefaults.standard.data(forKey: "ECAICustomers"),
           let savedCustomers = try? JSONDecoder().decode([Customer].self, from: data) {
            customerCount = savedCustomers.count
        } else {
            customerCount = 0
        }
        // Loads and counts every active saved job.
        if let data = UserDefaults.standard.data(forKey: "ECAIJobs"),
           let savedJobs = try? JSONDecoder().decode([Job].self, from: data) {
            activeJobs = savedJobs.filter { $0.status != "Completed" }.count
        } else {
            activeJobs = 0
        }
        // Loads and counts every saved estimate.
        if let data = UserDefaults.standard.data(forKey: "ECAIQuotes"),
           let savedQuotes = try? JSONDecoder().decode([Quote].self, from: data) {
            estimateCount = savedQuotes.count
        } else {
            estimateCount = 0
        }
    }
}
// Displays the Business Profile editing screen.
struct BusinessProfileEditView: View {
    // Allows the editing screen to close itself.
    @Environment(\.dismiss) private var dismiss
    // Connects the editable company name to the Business Profile.
    @Binding var companyName: String
    // Connects the editable owner name to the Business Profile.
    @Binding var ownerName: String
    // Connects the editable phone number to the Business Profile.
    @Binding var phone: String
    // Connects the editable email address to the Business Profile.
    @Binding var email: String
    // Connects the editable service area to the Business Profile.
    @Binding var serviceArea: String
    // Stores the original company name for Cancel.
    @State private var originalCompanyName = ""
    // Stores the original owner name for Cancel.
    @State private var originalOwnerName = ""
    // Stores the original phone number for Cancel.
    @State private var originalPhone = ""
    // Stores the original email address for Cancel.
    @State private var originalEmail = ""
    // Stores the original service area for Cancel.
    @State private var originalServiceArea = ""
    // Stores the metallic gold accent.
    private let gold = Color(red: 0.83, green: 0.69, blue: 0.22)
    // Builds the editing screen.
    var body: some View {
        // Creates the editing screen navigation system.
        NavigationStack {
            // Places the background behind the form.
            ZStack {
                // Displays the graphite background.
                ECAITheme.graphite
                    .ignoresSafeArea()
                // Displays the editable Business Profile fields.
                Form {
                    // Groups the business identity fields.
                    Section("Business Identity") {
                        // Allows the company name to be edited.
                        TextField(
                            "Company Name",
                            text: $companyName
                        )
                        // Allows the owner name to be edited.
                        TextField(
                            "Owner Name",
                            text: $ownerName
                        )
                    }
                    .foregroundStyle(gold)
                    // Groups the contact information fields.
                    Section("Contact Information") {
                        // Allows the phone number to be edited.
                        TextField(
                            "Phone Number",
                            text: $phone
                        )
                        // Allows the email address to be edited.
                        TextField(
                            "Email Address",
                            text: $email
                        )
                        // Allows the service area to be edited.
                        TextField(
                            "Service Area",
                            text: $serviceArea
                        )
                    }
                    .foregroundStyle(gold)
                }
                // Keeps the form background transparent.
                .scrollContentBackground(.hidden)
            }
            // Stores the original values when the editing screen opens.
            .onAppear {
                originalCompanyName = companyName
                originalOwnerName = ownerName
                originalPhone = phone
                originalEmail = email
                originalServiceArea = serviceArea
            }
            // Displays the editing screen title.
            .navigationTitle("Edit Profile")
            .toolbarBackground(ECAITheme.graphite, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            // Displays the editing screen buttons.
            .toolbar {
                // Displays the Cancel button.
                ToolbarItem(placement: .cancellationAction) {
                    // Restores the original information and closes the screen.
                    Button("Cancel") {
                        companyName = originalCompanyName
                        ownerName = originalOwnerName
                        phone = originalPhone
                        email = originalEmail
                        serviceArea = originalServiceArea
                        dismiss()
                    }
                    .tint(gold)
                }
                // Displays the Save button.
                ToolbarItem(placement: .confirmationAction) {
                    // Saves the edited information and closes the screen.
                    Button("Save") {
                        saveProfile()
                        dismiss()
                    }
                    // Makes the Save button bold.
                    .fontWeight(.bold)
                    .tint(gold)
                }
            }
        }
    }
    // Saves the Business Profile information so it remains after reopening the app.
    private func saveProfile() {
        UserDefaults.standard.set(companyName, forKey: "ECAICompanyName")
        UserDefaults.standard.set(ownerName, forKey: "ECAIOwnerName")
        UserDefaults.standard.set(phone, forKey: "ECAIPhone")
        UserDefaults.standard.set(email, forKey: "ECAIEmail")
        UserDefaults.standard.set(serviceArea, forKey: "ECAIServiceArea")
    }
}
// Creates the reusable Business Profile card appearance.
extension View {
    // Applies the dark card background, gold border, and glow.
    fileprivate func businessProfileCard() -> some View {
        // Applies every card style to the selected view.
        self
            // Creates the dark metallic background.
            .background(
                LinearGradient(
                    colors: [
                        Color(red: 0.11, green: 0.09, blue: 0.08),
                        Color(red: 0.06, green: 0.055, blue: 0.055),
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            // Rounds the card corners.
            .clipShape(RoundedRectangle(cornerRadius: 18))
            // Adds the metallic gold border.
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(
                        LinearGradient(
                            colors: [
                                Color(red: 1.00, green: 0.92, blue: 0.60),
                                Color(red: 0.82, green: 0.64, blue: 0.20),
                                Color(red: 1.00, green: 0.96, blue: 0.72)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1.4
                    )
            )
            // Adds the gold glow behind the card.
            .shadow(
                color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.18),
                radius: 8
            )
    }
}
// Displays the Business Profile screen inside Xcode previews.
#Preview {
    // Creates a preview of the Business Profile screen.
    BusinessProfileView()
}
