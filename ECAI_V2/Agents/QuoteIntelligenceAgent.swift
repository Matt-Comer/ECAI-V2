//
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
    let description = "Calculates contractor materials, labour time, estimated costs, and recommended quote pricing."
// Creates a quote review from the project information entered.
    func generateResponse(from input: String) -> String {
        // Removes extra spaces from the user's input.
        let cleanedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)
        // Makes sure project information was entered.
        if cleanedInput.isEmpty {
            return """
            Enter the job type and measurements to build an estimate.
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
    // Finds the project category  using keywords.
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
        if containsAny(project, ["painting", "paint", "primer", "drywall"]) {
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
        // Uses the detailed concrete estimator when enough measurements are supplied.
        if type == "CONCRETE",
           let squareFeet = squareFootage(from: project.lowercased()),
           let thickness = thicknessInInches(from: project.lowercased()) {
            return concreteEstimate(
                project: project,
                squareFeet: squareFeet,
                thickness: thickness
            )
        }
        // Uses the interlocking estimator when square footage is supplied.
        if type == "INTERLOCKING",
           let squareFeet = squareFootage(from: project.lowercased()) {
            return interlockingEstimate(
                project: project,
                squareFeet: squareFeet
            )
        }
        // Uses the painting estimator when square footage is supplied.
        if type == "PAINTING",
           let squareFeet = squareFootage(from: project.lowercased()) {
            return paintingEstimate(
                project: project,
                squareFeet: squareFeet
            )
        }
        // Uses a practical trade estimate when  exact calculations are not available.
        return generalEstimate(
            project: project,
            type: type
        )
    }
    // Builds a concrete material, labour, and price estimate.
    private func concreteEstimate(
        project: String,
        squareFeet: Double,
        thickness: Double
    ) -> String {
        // Calculates the concrete volume.
        let cubicFeet = squareFeet * (thickness / 12.0)
        let cubicYards = cubicFeet / 27.0
        // Adds ten percent  and rounds the order quantity to the next quarter yard.
        let concreteWithWaste = cubicYards * 1.10
        let orderQuantity = ceil(concreteWithWaste)        // Calculates concrete cost.
        let concreteRate = 300.0
        let concreteCost = orderQuantity * concreteRate
        // Calculates common slab material costs.
        let baseCost = squareFeet * 1.50
        let reinforcementCost = squareFeet * 1.25
        let formingCost = max(150.0, squareFeet * 0.75)
        let suppliesCost = max(100.0, squareFeet * 0.50)
        // Calculates estimated labour time.
        let crewSize = 2
        let labourHoursLow = max(16.0, squareFeet / 12.5)
        let labourHoursHigh = max(24.0, squareFeet / 8.5)
        let labourRate = 80.0
        let labourCostLow = labourHoursLow * labourRate
        let jobHoursLow = labourHoursLow / Double(crewSize)
        let jobHoursHigh = labourHoursHigh / Double(crewSize)
        let labourCostHigh = labourHoursHigh * labourRate
        // Calculates delivery, equipment, and disposal.
        let jobCosts = max(350.0, squareFeet * 2.0)
        // Calculates material total.
        let materialTotal =
            concreteCost +
            baseCost +
            reinforcementCost +
            formingCost +
            suppliesCost
    // Calculates direct job costs.
        let directLow =
            materialTotal +
            labourCostLow +
            jobCosts
        let directHigh =
            materialTotal +
            labourCostHigh +
            jobCosts
        // Adds contractor overhead and profit.
        let markup = 1.25
        let quoteLow = directLow * markup
        let quoteHigh = directHigh * markup
        // Returns the contractor estimate.
        return """
        CONCRETE QUOTE

        JOB
        \(project)

        MATERIAL BREAKDOWN
        Concrete required: \(format(cubicYards)) yd³
        Concrete order: \(format(orderQuantity)) yd³
        Concrete: \(money(concreteCost))
        Base material: \(money(baseCost))
        Reinforcement: \(money(reinforcementCost))
        Forms and fasteners: \(money(formingCost))
        Finishing and curing supplies: \(money(suppliesCost))
        Materials total: \(money(materialTotal))

        LABOUR TIME
        Crew: \(crewSize) workers
        Estimated labour: \(whole(labourHoursLow))-\(whole(labourHoursHigh)) man-hours
        
        Estimated job time: \(whole(jobHoursLow))-\(whole(jobHoursHigh)) hours        Labour: \(money(labourCostLow))-\(money(labourCostHigh))

        PRICE BREAKDOWN
        Materials: \(money(materialTotal))
        Labour: \(money(labourCostLow))-\(money(labourCostHigh))
        Delivery / equipment / disposal: \(money(jobCosts))
        Direct job cost: \(money(directLow))-\(money(directHigh))
        Overhead and profit: 25%

        RECOMMENDED QUOTE
        \(money(roundQuote(quoteLow)))-\(money(roundQuote(quoteHigh)))
        """
    }
    // Builds an interlocking material, labour,  and price estimate.
    private func interlockingEstimate(
        project: String,
        squareFeet: Double
    ) -> String {
        // Calculates paver quantity with waste.
        let paverQuantity = squareFeet * 1.10
        // Calculates material costs.
        let paverCost = paverQuantity * 6.50
        let baseCost = squareFeet * 3.00
        let sandCost = squareFeet * 0.75
        let edgingCost = squareFeet * 0.60
        let materialTotal =
            paverCost +
            baseCost +
            sandCost +
            edgingCost
        // Calculates labour.
        let crewSize = 2
        let labourHoursLow = max(16.0, squareFeet / 8.0)
        let labourHoursHigh = max(24.0, squareFeet / 5.5)
        let labourRate = 65.0
        let labourCostLow = labourHoursLow * labourRate
        let labourCostHigh = labourHoursHigh * labourRate
        // Calculates equipment and disposal.
        let jobCosts = max(400.0, squareFeet * 2.25)
        // Calculates final pricing.
        let directLow = materialTotal + labourCostLow + jobCosts
        let directHigh = materialTotal + labourCostHigh + jobCosts
        let quoteLow = directLow * 1.25
        let quoteHigh = directHigh * 1.25
        // Returns the estimate.
        return """
        INTERLOCKING QUOTE

        JOB
        \(project)

        MATERIAL BREAKDOWN
        Finished area: \(format(squareFeet)) sq ft
        Pavers with 10% waste: \(format(paverQuantity)) sq ft
        Pavers: \(money(paverCost))
        Base material: \(money(baseCost))
        Polymeric sand: \(money(sandCost))
        Edging and accessories: \(money(edgingCost))
        Materials total: \(money(materialTotal))

        LABOUR TIME
        Crew: \(crewSize) workers
        Estimated labour: \(whole(labourHoursLow))-\(whole(labourHoursHigh)) man-hours
        Labour: \(money(labourCostLow))-\(money(labourCostHigh))

        PRICE BREAKDOWN
        Materials: \(money(materialTotal))
        Labour: \(money(labourCostLow))-\(money(labourCostHigh))
        Equipment / excavation / disposal: \(money(jobCosts))
        Direct job cost: \(money(directLow))-\(money(directHigh))
        Overhead and profit: 25%

        RECOMMENDED QUOTE
        \(money(roundQuote(quoteLow)))-\(money(roundQuote(quoteHigh)))
        """
    }
    // Builds a painting material, labour, and price estimate.
    private func paintingEstimate(
        project: String,
        squareFeet: Double
    ) -> String {
        // Calculates paint for two coats.
        let gallonsCalculated = (squareFeet / 350.0) * 2.0
        let gallons = ceil(gallonsCalculated)
        // Calculates material costs.
        let paintCost = gallons * 65.0
        let prepCost = max(75.0, squareFeet * 0.25)
        let suppliesCost = max(75.0, squareFeet * 0.20)
        let materialTotal = paintCost + prepCost + suppliesCost
        // Calculates  labour.
        let crewSize = squareFeet > 1000 ? 2 : 1
        let labourHoursLow = max(8.0, squareFeet / 100.0)
        let labourHoursHigh = max(12.0, squareFeet / 70.0)
        let labourRate = 65.0
        let labourCostLow = labourHoursLow * labourRate
        let labourCostHigh = labourHoursHigh * labourRate
        // Calculates final pricing.
        let directLow = materialTotal + labourCostLow
        let directHigh = materialTotal + labourCostHigh
        let quoteLow = directLow * 1.25
        let quoteHigh = directHigh * 1.25
        // Returns the estimate.
        return """
        PAINTING QUOTE

        JOB
        \(project)

        MATERIAL BREAKDOWN
        Paint coverage: \(format(squareFeet)) sq ft
        Paint for two coats: \(whole(gallons)) gallons
        Paint: \(money(paintCost))
        Prep materials: \(money(prepCost))
        Rollers / brushes / tape / protection: \(money(suppliesCost))
        Materials total: \(money(materialTotal))

        LABOUR TIME
        Crew: \(crewSize) worker\(crewSize == 1 ? "" : "s")
        Estimated labour: \(whole(labourHoursLow))-\(whole(labourHoursHigh)) man-hours
        Labour: \(money(labourCostLow))-\(money(labourCostHigh))

        PRICE BREAKDOWN
        Materials: \(money(materialTotal))
        Labour: \(money(labourCostLow))-\(money(labourCostHigh))
        Direct job cost: \(money(directLow))-\(money(directHigh))
        Overhead and profit: 25%

        RECOMMENDED QUOTE
        \(money(roundQuote(quoteLow)))-\(money(roundQuote(quoteHigh)))
        """
    }
    // Builds a direct estimate when exact quantity calculations are unavailable.
    private func generalEstimate(
        project: String,
        type: String
    ) -> String {
        // Gets the correct trade details.
        let details = projectDetails(for: type)
        // Uses a basic crew and time estimate until measurements are supplied
        let crewSize = 2
        let labourHoursLow = 8.0
        let labourHoursHigh = 16.0
        let labourRate = 65.0
        let labourCostLow = labourHoursLow * labourRate
        let labourCostHigh = labourHoursHigh * labourRate
        // Returns a useful estimate without inventing material quantities.
        return """
        \(type) QUOTE

        JOB
        \(project)

        MATERIAL BREAKDOWN
        \(details.materials)
        Exact quantities require job measurements.

        LABOUR TIME
        Crew: \(crewSize) workers
        Estimated labour: \(whole(labourHoursLow))-\(whole(labourHoursHigh)) man-hours
        Labour: \(money(labourCostLow))-\(money(labourCostHigh))

        PRICE BREAKDOWN
        Labour: \(money(labourCostLow))-\(money(labourCostHigh))
        Material pricing requires quantities and material selection.
        Equipment / delivery / disposal added when required.

        RECOMMENDED QUOTE
        More measurements required for final pricing.
        """
    }
    // Finds square footage in the project information.
    private func squareFootage(from project: String) -> Double? {
        // Looks for square footage written directly.
        let squareFootPattern = #"(\d+(?:\.\d+)?)\s*(?:sq\.?\s*ft|sqft|square\s*feet|square\s*foot)"#
        if let squareFeet = firstNumber(
            matching: squareFootPattern,
            in: project
        ) {
            return squareFeet
        }
        // Tries length by width when square footage was not supplied.
        return rectangularArea(from: project)
    }
    // Calculates square footage from dimensions such as 10 x 20.
    private func rectangularArea(from project: String) -> Double? {
        // Matches common length by width measurements.
        let pattern = #"(\d+(?:\.\d+)?)\s*(?:ft|feet|foot|')?\s*[x×]\s*(\d+(?:\.\d+)?)\s*(?:ft|feet|foot|')?"#
        // Creates the regular expression.
        guard let regex = try? NSRegularExpression(
            pattern: pattern,
            options: [.caseInsensitive]
        ) else {
            return nil
        }
        // Creates the  searchable range.
        let range = NSRange(
            project.startIndex..<project.endIndex,
            in: project
        )
        // Finds the dimensions.
        guard let match = regex.firstMatch(
            in: project,
            options: [],
            range: range
        ) else {
            return nil
        }
        // Gets the first measurement.
        guard let firstRange = Range(
            match.range(at: 1),
            in: project
        ),
        let first = Double(project[firstRange]) else {
            return nil
        }
        // Gets the second measurement.
        guard let secondRange = Range(
            match.range(at: 2),
            in: project
        ),
        let second = Double(project[secondRange]) else {
            return nil
        }
    //  Returns the calculated area.
        return first * second
    }
    // Finds concrete thickness written in inches.
    private func thicknessInInches(from project: String) -> Double? {
        // Checks common ways contractors enter slab thickness.
        let patterns = [
            #"(\d+(?:\.\d+)?)\s*(?:inch|inches|in|")\s*(?:thick|thickness)"#,
            #"(?:thick|thickness)\s*(?:of|is|:)?\s*(\d+(?:\.\d+)?)\s*(?:inch|inches|in|")"#,
            #"(\d+(?:\.\d+)?)\s*(?:inch|inches|in|")\s*(?:concrete|slab)"#
        ]
        // Checks each supported pattern.
        for pattern in patterns {
            if let thickness = firstNumber(
                matching: pattern,
                in: project
            ) {
                return thickness
            }
        }
        // Returns no thickness when none was supplied.
        return nil
    }
    // Finds the first number captured by a regular expression.
    private func firstNumber(
        matching pattern: String,
        in text: String
    ) -> Double? {
        // Creates the regular expression.
        guard let regex = try? NSRegularExpression(
            pattern: pattern,
            options: [.caseInsensitive]
        ) else {
            return nil
        }
        // Creates the searchable range.
        let range = NSRange(
            text.startIndex..<text.endIndex,
            in: text
        )
        // Finds the first match.
        guard let match = regex.firstMatch(
            in: text,
            options: [],
            range: range
        ) else {
            return nil
        }
        // Gets the captured number.
        guard let numberRange = Range(
            match.range(at: 1),
            in: text
        ) else {
            return nil
        }
        // Returns the number.
        return Double(text[numberRange])
    }
    // Formats calculated numbers for clean output.
    private func format(_ value: Double) -> String {
        // Removes decimals from whole numbers.
        if value.rounded() == value {
            return String(Int(value))
        }
        // Keeps calculated quantities readable.
        return String(
            format: "%.2f",
            value
        )
    }
    // Formats labour hours without unnecessary decimals.
    private func whole(_ value: Double) -> String {
        String(Int(ceil(value)))
    }
    // Formats Canadian dollar amounts.
    private func money(_ value: Double) -> String {
        "$\(Int(value.rounded()))"
    }
    // Rounds the recommended customer quote to a practical fifty dollars.
    private func roundQuote(_ value: Double) -> Double {
        ceil(value / 50.0) * 50.0
    }
    // Returns the details needed for each project type.
    private func projectDetails(
        for type: String
    ) -> (labour: String, materials: String) {
        // Selects the correct contractor information.
        switch type {
        // Reviews an interlocking project.
        case "INTERLOCKING":
            return (
                """
                Excavation, removal, base preparation, compaction, screeding, installation, cutting, edging and cleanup.
                """,
                """
                Pavers, base material, polymeric sand, edging and required accessories.
                """
            )
        // Reviews a concrete or parging project.
        case "CONCRETE":
            return (
                """
                Preparation, demolition if required, forming, placement, finishing, curing protection and cleanup.
                """,
                """
                Concrete or repair material, reinforcement if required, forms, fasteners and finishing supplies.
                """
            )
        // Reviews a carpentry project.
        case "CARPENTRY":
            return (
                """
                Layout, demolition if required, framing, installation, fastening, finishing and cleanup.
                """,
                """
                Lumber, structural fasteners, brackets, anchors, connectors and waste.
                """
            )
        // Reviews a landscaping project.
        case "LANDSCAPING":
            return (
                """
                Preparation, trimming or removal, digging, grading, installation and cleanup.
                """,
                """
                Soil, compost, mulch, stone, plants, sod, edging or other required landscape materials.
                """
            )
        // Reviews a painting project.
        case "PAINTING":
            return (
                """
                Protection, preparation, patching, sanding, caulking, priming, painting, touch-ups and cleanup.
                """,
                """
                Paint, primer, patching compound, caulking and painting supplies.
                """
            )
        // Reviews a demolition project.
        case "DEMOLITION":
            return (
                """
                Site protection, demolition, debris handling, loading and final cleanup.
                """,
                """
                Demolition supplies, protective equipment, disposal and cleanup supplies.
                """
            )
        // Reviews any project that does not match a category.
        default:
            return (
                """
                Setup, preparation, main project work, finishing and cleanup.
                """,
                """
                Main materials, fasteners, accessories, consumables and waste.
                """
            )
        }
    }
}
