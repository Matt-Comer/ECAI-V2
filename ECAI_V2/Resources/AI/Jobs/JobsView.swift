
//
//  JobsView.swift
//  ECAI_V2
//
//  Created by Matthew Comer on 2026-06-29.
//
import SwiftUI
// Displays the job management screen.
struct JobsView: View {
    // Stores the jobs displayed on the screen.
    @State private var jobs: [Job] = []
    // Controls when the job form is displayed.
    @State private var showJobForm = false
    // Stores the job selected for editing.
    @State private var selectedJob: Job?
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
    // Stores the metallic gold job-card border.
    private let goldGradient = LinearGradient(
        colors: [
            Color(red: 1.00, green: 0.92, blue: 0.60),
            Color(red: 0.82, green: 0.64, blue: 0.20),
            Color(red: 1.00, green: 0.96, blue: 0.72)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    // Displays the complete Jobs screen.
    var body: some View {
        // Creates the navigation system for the screen.
        NavigationStack {
            // Places the content over the black background.
            ZStack {
                // Displays the application background.
                Color.black
                    .ignoresSafeArea()
                // Allows the job list to scroll vertically.
                ScrollView {
                    // Arranges every Jobs section vertically.
                    VStack(alignment: .leading, spacing: 22) {
                        // Displays the Jobs branding header.
                        brandHeader
                        // Displays the Jobs artwork.
                        heroCard
                        // Opens the form used to add a new job.
                        Button {
                            selectedJob = nil
                            showJobForm = true
                        } label: {
                            Label("Add Job", systemImage: "plus.circle.fill")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(.black)
                                .frame(maxWidth: .infinity)
                                .padding(14)
                                .background(titleGradient)
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(goldGradient, lineWidth: 1.5)
                                )
                                .shadow(color: Color.yellow.opacity(0.16), radius: 8)
                        }
                        // Displays the current-jobs heading and count.
                        HStack {
                            Text("Custom.")
                                .font(.headline)
                                .foregroundStyle(titleGradient)
                            Spacer()
                            Text("\(jobs.count) Jobs.")
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.70))
                        }
                        // Displays one card for every job.
                        ForEach(jobs) { job in
                            Button {
                                selectedJob = job
                            } label: {
                                jobCard(job: job)
                            }
                            .buttonStyle(.plain)
                        }
                        // Pushes the job content toward the top.
                        Spacer()
                    }
                    // Adds spacing around the Jobs screen.
                    .padding(.horizontal, 16)
                    // Adds compact spacing above the header.
                    .padding(.top, 12)
                    // Keeps the final card above the tab bar.
                    .padding(.bottom, 120)
                }
            }
        }
        // Loads the saved jobs when the screen opens.
        .onAppear {
            loadJobs()
        }
        // Displays the form used to add a new job.
        .sheet(isPresented: $showJobForm) {
            JobFormView(
                job: nil
            ) { job in
                saveJob(job)
            }
        }
        // Displays the selected job for editing.
        .sheet(item: $selectedJob) { job in
            JobFormView(
                job: job
            ) { job in
                saveJob(job)
            }
        }
    }
    // Creates the Jobs branding header.
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
            // Displays the centered title and subtitle.
            VStack(spacing: 5) {
                Text("E.C.A.I.")
                    .font(.system(size: 34, weight: .black))
                    .foregroundStyle(titleGradient)
                    .shadow(color: Color.yellow.opacity(0.22), radius: 8)
                Text("J.C.")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(titleGradient)
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 50)
            .padding(.horizontal, 115)
        }
        .frame(height: 135)
        .shadow(color: .black.opacity(0.55), radius: 12, x: 0, y: 6)
        .shadow(color: Color.yellow.opacity(0.18), radius: 12)
    }
    // Creates the Jobs artwork card.
    private var heroCard: some View {
        ZStack(alignment: .bottomLeading) {
            // Displays the complete Jobs artwork.
            Image("ECAI-splashscreen-V8")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
            // Darkens the artwork behind the text.
            LinearGradient(
                colors: [
                    Color.yellow.opacity(0.03),
                    Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.14),
                    .black.opacity(0.95)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            // Displays the artwork heading and description.
            VStack(alignment: .leading, spacing: 4) {
                Text("PROJECT OPERATIONS")
                    .font(.system(size: 28, weight: .black))
                    .foregroundStyle(titleGradient)
                    .shadow(color: .black, radius: 3, x: 0, y: 2)
                Text("Track active work, crews, and job progress.")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.82))
            }
            .padding(16)
        }
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(goldGradient, lineWidth: 2)
        )
        .shadow(color: Color.yellow.opacity(0.16), radius: 10)
    }
    // Creates one job information card.
    private func jobCard(job: Job) -> some View {
        // Places the job information vertically.
        VStack(alignment: .leading, spacing: 12) {
            // Displays the type of work.
            Text(job.jobType)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            // Displays the assigned customer.
            HStack(spacing: 10) {
                Image(systemName: "person.fill")
                    .foregroundStyle(titleGradient)
                Text(job.customerName)
                    .foregroundStyle(.white.opacity(0.85))
            }
            // Displays the current job status.
            HStack(spacing: 10) {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(titleGradient)
                Text(job.status)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white.opacity(0.85))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(18)
        .background(Color(red: 0.08, green: 0.08, blue: 0.09))
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(goldGradient, lineWidth: 1.4)
        )
        .shadow(color: .black.opacity(0.45), radius: 12, x: 0, y: 6)
        .shadow(color: Color.yellow.opacity(0.16), radius: 8)
    }
    // Saves a new job or updates an existing job.
    private func saveJob(_ job: Job) {
        // Updates the matching job when it already exists.
        if let index = jobs.firstIndex(where: { $0.id == job.id }) {
            jobs[index] = job
        } else {
            // Adds the job when it does not already exist.
            jobs.append(job)
        }
        // Saves the updated job list.
        saveJobs()
    }
    // Saves the job list on the device.
    private func saveJobs() {
        if let data = try? JSONEncoder().encode(jobs) {
            UserDefaults.standard.set(data, forKey: "ECAIJobs")
        }
    }
    // Loads saved jobs from the device.
    private func loadJobs() {
        // Uses saved jobs when job data already exists.
        if let data = UserDefaults.standard.data(forKey: "ECAIJobs"),
           let savedJobs = try? JSONDecoder().decode([Job].self, from: data) {
            jobs = savedJobs
        } else {
            // Creates the original jobs the first time the app runs.
            jobs = [
                Job(customerName: "Frank", jobType: "Interior Painting", status: "Scheduled"),
                Job(customerName: "Clint", jobType: "Vehicle Wrap Prep", status: "In Progress"),
                Job(customerName: "Jessica", jobType: "Concrete Repair", status: "Completed")
            ]
            saveJobs()
        }
    }
}
// Displays the form used to add or edit a job.
private struct JobFormView: View {
    // Allows the form to close itself.
    @Environment(\.dismiss) private var dismiss
    // Stores the job identifier when editing.
    private let jobID: UUID
    // Stores the customer name while editing.
    @State private var customerName: String
    // Stores the job type while editing.
    @State private var jobType: String
    // Stores the current job status.
    @State private var status: String
    // Stores the available job statuses.
    private let statuses = [
        "Scheduled",
        "In Progress",
        "Completed"
    ]
    // Runs when the job is saved.
    let onSave: (Job) -> Void
    // Creates the metallic gold form border.
    private let goldGradient = LinearGradient(
        colors: [
            Color(red: 1.00, green: 0.92, blue: 0.60),
            Color(red: 0.82, green: 0.64, blue: 0.20),
            Color(red: 1.00, green: 0.96, blue: 0.72)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    // Creates the job form with existing or empty information.
    init(job: Job?, onSave: @escaping (Job) -> Void) {
        jobID = job?.id ?? UUID()
        _customerName = State(initialValue: job?.customerName ?? "")
        _jobType = State(initialValue: job?.jobType ?? "")
        _status = State(initialValue: job?.status ?? "Scheduled")
        self.onSave = onSave
    }
    // Displays the complete job form.
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack(spacing: 16) {
                    Text("JOB INFORMATION")
                        .font(.headline)
                        .fontWeight(.black)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    Color(red: 1.00, green: 0.88, blue: 0.45),
                                    Color(red: 0.83, green: 0.69, blue: 0.22),
                                    Color(red: 0.67, green: 0.49, blue: 0.10)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Customer Name", text: $customerName)
                        .foregroundStyle(.white)
                        .padding(14)
                        .background(Color(red: 0.08, green: 0.08, blue: 0.09))
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(goldGradient, lineWidth: 1.5)
                        )
                        .shadow(color: Color.yellow.opacity(0.14), radius: 6)
                    TextField("Job Type", text: $jobType)
                        .foregroundStyle(.white)
                        .padding(14)
                        .background(Color(red: 0.08, green: 0.08, blue: 0.09))
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(goldGradient, lineWidth: 1.5)
                        )
                        .shadow(color: Color.yellow.opacity(0.14), radius: 6)
                    HStack {
                        Text("Status")
                            .foregroundStyle(.white.opacity(0.80))
                        Spacer()
                        Picker("Status", selection: $status) {
                            ForEach(statuses, id: \.self) { status in
                                Text(status)
                            }
                        }
                        .tint(Color(red: 0.83, green: 0.69, blue: 0.22))
                    }
                    .padding(14)
                    .background(Color(red: 0.08, green: 0.08, blue: 0.09))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(goldGradient, lineWidth: 1.5)
                    )
                    .shadow(color: Color.yellow.opacity(0.14), radius: 6)
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Job")
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                // Closes the form without saving.
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .tint(Color(red: 0.83, green: 0.69, blue: 0.22))
                }
                // Saves the job information.
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        onSave(
                            Job(
                                id: jobID,
                                customerName: customerName,
                                jobType: jobType,
                                status: status
                            )
                        )
                        dismiss()
                    }
                    .tint(Color(red: 0.83, green: 0.69, blue: 0.22))
                    .disabled(
                        customerName.trimmingCharacters(in: .whitespaces).isEmpty ||
                        jobType.trimmingCharacters(in: .whitespaces).isEmpty
                    )
                }
            }
        }
    }
}
// Displays the Jobs screen inside Xcode.
#Preview {
    JobsView()
}

