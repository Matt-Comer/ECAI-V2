
//  QuoteIntelligenceAgent.swift
//  ECAI_V2
//
//  Created by Matthew Comer on 2026-07-14.
//
import Foundation
// Creates the agent responsible for contractor quote reviews.
struct QuoteIntelligenceAgent: ECAIAgent {
    // Stores the name displayed for this agent.
    let name = "Quote Intelligence Agent"
    // Describes what this agent handles.
    let description = "Reviews labour, materials, access, disposal, risk, and profit before creating a quote recommendation."
    // Creates a quote review from the project information entered.
    func generateResponse(from input: String) -> String {
        // Removes extra spaces from the user's input.
        let cleanedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)
        // Makes sure project information was entered.
        if cleanedInput.isEmpty {
            return """
            Please enter the project type, measurements, materials, site access, crew size, timeline, and special requirements.
            """
        }
        // Converts the input to lowercase for keyword matching.
        let project = cleanedInput.lowercased()

        // Finds the type of contractor project.
        let projectType = findProjectType(project)

        // Builds and returns the completed quote review.
        return buildQuoteReview(
            project: cleanedInput,
            type: projectType
        )
    }
    // Finds the project category using keywords.
    private func findProjectType(_ project: String) -> String {
        // Checks for interlocking projects.
        if containsAny(project, ["interlock", "paver", "patio"]) {
            return "INTERLOCKING"
        }
        // Checks for concrete projects.
        if containsAny(project, ["concrete", "cement", "parging", "foundation"]) {
            return "CONCRETE"
        }
        // Checks for carpentry projects.
        if containsAny(project, ["stairs", "steps", "deck", "railing", "carpentry", "wood"]) {
            return "CARPENTRY"
        }
        // Checks for landscaping projects.
        if containsAny(project, ["landscaping", "garden", "gardening", "lawn", "plant", "tree"]) {
            return "LANDSCAPING"
        }
        // Checks for painting projects.
        if containsAny(project, ["painting", "paint", "primer"]) {
            return "PAINTING"
        }
        // Checks for demolition projects.
        if containsAny(project, ["demolition", "demo", "removal", "tear down"]) {
            return "DEMOLITION"
        }
        // Uses a general category when no match is found.
        return "GENERAL CONTRACTOR"
    }
    // Checks the project description for matching keywords.
    private func containsAny(_ text: String, _ words: [String]) -> Bool {
        words.contains { text.contains($0) }
    }
    // Builds the final quote review.
    private func buildQuoteReview(
        project: String,
        type: String
    ) -> String {
        // Gets the correct details for the project type.
        let details = projectDetails(for: type)
        // Returns the completed contractor quote review.
        return """
        \(type) QUOTE REVIEW
        Project:
        \(project)
        Scope Review:
        \(details.scope)
        Labour Review:
        \(details.labour)
        Material Review:
        \(details.materials)
        Additional Costs:
        • Equipment or tool rental
        • Delivery and pickup
        • Disposal or dump fees
        • Travel and parking
        • Extra labour caused by difficult access
        • Hidden or unexpected conditions
        • Cleanup and return visits
        
        Pricing Review:
        • Labour
        • Materials
        • Equipment
        • Delivery
        • Disposal
        • Contingency
        • Profit

        Before Sending the Quote:
        ✓ Measurements confirmed
        ✓ Scope clearly written
        ✓ Labour is realistic
        ✓ Materials are included
        ✓ Access has been considered
        ✓ Disposal is covered
        ✓ Extra work requires customer approval
        ✓ Final price makes the job worthwhile
        """
    }
    // Returns the details needed for each project type.
    private func projectDetails(
        for type: String
    ) -> (scope: String, labour: String, materials: String) {
        // Selects the correct contractor information.
        switch type {
        // Reviews an interlocking project.
        case "INTERLOCKING":
            return (
                """
                • Confirm square footage and excavation depth
                • Confirm paver style, pattern, border, and edging
                • Check drainage and final elevation
                • Inspect access for materials and waste removal
                """,
                """
                • Excavation and removal
                • Base preparation and compaction
                • Screeding and paver installation
                • Cutting, edging, sand, and cleanup
                """,
                """
                • Pavers with waste allowance
                • HPB or approved base material
                • Polymeric sand
                • Edging and landscape fabric when required
                """
            )
        // Reviews a concrete or parging project.
        case "CONCRETE":
            return (
                """
                • Measure the damaged or new concrete area
                • Determine repair, parging, resurfacing, or new pour
                • Inspect cracks, water damage, and loose material
                • Confirm finish and curing requirements
                """,
                """
                • Demolition and preparation
                • Forming when required
                • Mixing, placing, and finishing
                • Curing protection and cleanup
                """,
                """
                • Concrete, repair mortar, or parging mix
                • Bonding agent
                • Mesh or reinforcement when required
                • Form lumber and fasteners
                """
            )
        // Reviews a carpentry project.
        case "CARPENTRY":
            return (
                """
                • Confirm measurements and finished dimensions
                • Inspect existing framing and attachment points
                • Check for rot or hidden damage
                • Confirm demolition and railing requirements
                """,
                """
                • Measuring and layout
                • Demolition when required
                • Framing and installation
                • Fastening, finishing, and cleanup
                """,
                """
                • Lumber
                • Structural screws and fasteners
                • Brackets, anchors, and connectors
                • Extra material for blocking and waste
                """
            )
        // Reviews a landscaping project.
        case "LANDSCAPING":
            return (
                """
                • Confirm what stays, moves, and is removed
                • Inspect soil, roots, weeds, and drainage
                • Confirm disposal requirements
                • Confirm who supplies plants and materials
                """,
                """
                • Trimming and pruning
                • Digging and preparation
                • Planting, grading, or sod installation
                • Bagging and cleanup
                """,
                """
                • Soil or compost
                • Mulch or decorative stone
                • Plants or sod
                • Edging and landscape fabric when required
                """
            )
        // Reviews a painting project.
        case "PAINTING":
            return (
                """
                • Confirm all surfaces being painted
                • Inspect holes, cracks, stains, and damage
                • Confirm colours and sheen
                • Confirm who supplies the paint
                """,
                """
                • Protection and preparation
                • Patching, sanding, and caulking
                • Priming when required
                • Cutting, rolling, touch-ups, and cleanup
                """,
                """
                • Paint and primer
                • Patching compound and caulking
                • Rollers and brushes
                • Tape, plastic, and drop sheets
                """
            )
        // Reviews a demolition project.
        case "DEMOLITION":
            return (
                """
                • Confirm exactly what is being removed
                • Identify areas that must remain protected
                • Estimate debris volume and weight
                • Inspect access and disposal requirements
                """,
                """
                • Site protection
                • Controlled demolition
                • Carrying and loading debris
                • Final cleanup
                """,
                """
                • Demolition blades and supplies
                • Protective equipment
                • Disposal bin or dump runs
                • Cleanup supplies
                """
            )
        // Reviews any project that does not match a category.
        default:
            return (
                """
                • Confirm exactly what the customer wants completed
                • Measure and inspect the work area
                • Identify preparation, installation, and finishing
                • Clearly state what is included and excluded
                """,
                """
                • Setup and preparation
                • Main project work
                • Material handling
                • Finishing and cleanup
                """,
                """
                • Main project materials
                • Fasteners and accessories
                • Consumable supplies
                • Waste allowance
                """
            )
        }
    }
}
