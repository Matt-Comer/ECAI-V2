//
//  ProjectIntelligenceAgent.swift
//  ECAI_V2
//
//  Created by Matthew Comer on 2026-07-14.
import Foundation
// Creates the agent responsible for contractor project planning.
struct ProjectIntelligenceAgent: ECAIAgent {
    // Stores the name displayed for this agent.
    let name = "Project Intelligence Agent"
    // Describes what this agent handles.
    let description = "Creates project plans, schedules, material lists, and workflow recommendations."
    // Creates a project plan from the information entered.
    func generateResponse(from input: String) -> String {
        // Removes extra spaces from the user's input.
        let cleanedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)
        // Makes sure project information was entered.
        if cleanedInput.isEmpty {
            return """
            Please enter the project type, measurements, materials, timeline, crew size, and current job status.
            """
        }
        // Handles material estimator requests.
        if cleanedInput.contains("Create a detailed material estimate") {
            let materialDetails = cleanedInput
                .replacingOccurrences(
                    of: "Create a detailed material estimate and identify quantities that still require confirmation using these details:",
                    with: ""
                )
                .trimmingCharacters(in: .whitespacesAndNewlines)
            return buildMaterialEstimate(from: materialDetails)
        }
        // Handles contractor agreement requests.
        if cleanedInput.contains("Create a professional draft contractor service agreement") {
            let contractDetails = cleanedInput
                .replacingOccurrences(
                    of: "Create a professional draft contractor service agreement. Include scope, exclusions, payment schedule, changes, delays, warranty, cleanup, and customer approval. Clearly label it as a draft requiring review. Use these details:",
                    with: ""
                )
                .trimmingCharacters(in: .whitespacesAndNewlines)
            return buildContract(from: contractDetails)
        }
        // Converts the input to lowercase for keyword matching.
        let project = cleanedInput.lowercased()
        // Finds the type of contractor project.
        let projectType = findProjectType(project)
        // Gets the planning details for the project.
        let details = projectDetails(for: projectType)
        // Builds and returns the completed project plan.
        return buildProjectPlan(
            project: cleanedInput,
            type: projectType,
            details: details
        )
    }
    // Finds the project category using keywords.
    private func findProjectType(_ project: String) -> String {
        // Checks for interlocking projects.
        if containsAny(project, ["interlock", "paver", "patio"]) {
            return "INTERLOCKING"
        }
        // Checks for concrete and parging projects.
        if containsAny(project, ["concrete", "cement", "parging", "foundation"]) {
            return "CONCRETE"
        }
        // Checks for carpentry projects.
        if containsAny(project, ["stairs", "steps", "deck", "railing", "carpentry", "wood"]) {
            return "CARPENTRY"
        }
        // Checks for painting projects.
        if containsAny(project, ["painting", "paint", "primer"]) {
            return "PAINTING"
        }
        // Checks for landscaping projects.
        if containsAny(project, ["landscaping", "garden", "gardening", "lawn", "plant", "tree"]) {
            return "LANDSCAPING"
        }
        // Checks for demolition projects.
        if containsAny(project, ["demolition", "demo", "removal", "tear down"]) {
            return "DEMOLITION"
        }
        // Uses general construction when no category matches.
        return "GENERAL CONSTRUCTION"
    }
    // Checks the project description for matching keywords.
    private func containsAny(_ text: String, _ words: [String]) -> Bool {
        words.contains { text.contains($0) }
    }
    // Stores the planning sections used to build the response.
    private struct ProjectDetails {
        let preConstruction: String
        let materials: String
        let workflow: String
        let quality: String
        let risks: String
    }
    // Builds the final project plan.
    private func buildProjectPlan(
        project: String,
        type: String,
        details: ProjectDetails
    ) -> String {
        // Returns all project sections in one response.
        return """
        \(type) PROJECT PLAN

        Project:
        \(project)

        Pre-construction:
        \(details.preConstruction)

        Material planning:
        \(details.materials)

        Recommended workflow:
        \(details.workflow)

        Quality checks:
        \(details.quality)

        Project risks:
        \(details.risks)
        """
    }
    // Builds a material estimate from the project information entered.
    private func buildMaterialEstimate(from project: String) -> String {
        // Converts the project information to lowercase for keyword matching.
        let lowerProject = project.lowercased()
        // Finds the project type using the existing project categories.
        let projectType = findProjectType(lowerProject)
        // Gets the existing contractor material information for the project.
        let details = projectDetails(for: projectType)
        // Finds numbers entered with the project information.
        let numbers = project.components(
            separatedBy: CharacterSet.decimalDigits.inverted
        )
        .compactMap { Double($0) }
        // Uses the first number as the entered project quantity when available.
        let enteredQuantity = numbers.first
        // Handles drywall estimates separately because drywall uses sheet coverage.
        if lowerProject.contains("drywall") {
            // Calculates drywall sheets when square footage was entered.
            if let squareFeet = enteredQuantity {
                // Adds approximately ten percent for cuts and waste.
                let adjustedSquareFeet = squareFeet * 1.10
                // Calculates the number of standard 4 x 8 drywall sheets required.
                let sheetCount = Int(ceil(adjustedSquareFeet / 32))
                return """
                DRYWALL MATERIAL ESTIMATE

                Project:
                \(project)

                Estimated project area:
                \(Int(squareFeet)) sq ft

                Estimated materials:
                • \(sheetCount) standard 4 x 8 drywall sheets including approximately 10% waste.
                • Drywall screws.
                • Joint tape.
                • Joint compound.
                • Corner bead where required.
                • Primer for new drywall.
                • Sanding supplies.

                Quantities still requiring confirmation:
                • Confirm whether the entered square footage represents wall area or floor area.
                • Confirm drywall thickness.
                • Confirm wall and ceiling measurements.
                • Confirm openings, corners, and required cuts.
                • Confirm whether moisture-resistant or fire-rated drywall is required.
                • Confirm screw, compound, tape, and primer quantities from final site measurements.

                Final quantities should be verified from site measurements before purchasing materials.
                """
            }
            // Returns the drywall material list when measurements were not entered.
            return """
            DRYWALL MATERIAL ESTIMATE

            Project:
            \(project)

            Estimated materials:
            • Standard drywall sheets.
            • Drywall screws.
            • Joint tape.
            • Joint compound.
            • Corner bead where required.
            • Primer for new drywall.
            • Sanding supplies.

            Quantities still requiring confirmation:
            • Total square footage.
            • Drywall thickness.
            • Wall and ceiling measurements.
            • Openings and outside corners.
            • Moisture-resistant or fire-rated drywall requirements.

            Enter the project square footage to calculate the estimated number of drywall sheets.
            """
        }
        // Returns the existing contractor material plan for other project types.
        return """
        \(projectType) MATERIAL ESTIMATE

        Project:
        \(project)

        Estimated materials:
        \(details.materials)

        Quantities still requiring confirmation:
        • Confirm the complete project measurements.
        • Confirm required material thicknesses and depths.
        • Confirm product coverage rates.
        • Confirm cuts, waste, and additional material requirements.
        • Confirm existing site conditions before purchasing materials.

        Final quantities should be verified from site measurements before purchasing materials.
        """
    }
    // Builds a draft contractor service agreement.
    private func buildContract(from project: String) -> String {
        return """
        DRAFT CONTRACTOR SERVICE AGREEMENT
        REQUIRES CUSTOMER AND CONTRACTOR REVIEW

        Project:
        \(project)

        Scope of work:
        Contractor will complete the work described above. Final measurements, materials, finishes, quantities, and site conditions must be confirmed before work begins.

        Exclusions:
        Work not specifically included in the agreed scope is excluded. Hidden damage, hazardous materials, permits, engineering, utility work, and additional repairs are excluded unless added in writing.

        Payment schedule:
        Deposit: Due before work begins.
        Progress payment: Due as agreed during the project.
        Final payment: Due when the agreed work is completed.

        Changes and additional work:
        Any work outside the original scope requires customer approval and may change the project price and completion date.

        Delays:
        Weather, material shortages, hidden conditions, customer changes, site access, or circumstances outside the contractor's control may affect the schedule.

        Warranty:
        Workmanship concerns must be reported within the agreed warranty period. Normal wear, existing conditions, customer damage, product failure, and work completed by others are excluded.

        Cleanup:
        Contractor will remove normal construction debris created by the agreed work and leave the work area reasonably clean at completion.

        Customer approval:
        Customer confirms that the scope, price, payment terms, and project conditions have been reviewed and accepted before work begins.

        Customer: ______________________________

        Signature: _____________________________    Date: _____________

        Contractor: ____________________________

        Signature: _____________________________    Date: _____________

        DRAFT — REVIEW BEFORE USE OR SIGNING
        """
    }
    // Returns the correct planning details for each project type.
    private func projectDetails(for type: String) -> ProjectDetails {
        // Selects the correct contractor project information.
        switch type {
        // Creates the interlocking project details.
        case "INTERLOCKING":
            return ProjectDetails(
                preConstruction: """
                • Confirm the finished dimensions and pattern.
                • Mark the excavation area.
                • Check drainage direction and final elevation.
                • Confirm access for materials, equipment, and waste removal.
                • Locate underground utilities before excavation.
                • Confirm pavers, edging, base material, and delivery dates.
                """,
                materials: """
                • Interlocking pavers with additional material for cuts and waste.
                • HPB or approved base material.
                • Edge restraints or concrete curbing.
                • Landscape fabric when required.
                • Polymeric sand.
                • Disposal bin or removal vehicle.
                """,
                workflow: """
                1. Remove existing soil, concrete, sod, or old pavers.
                2. Excavate to the required depth.
                3. Establish the correct slope for drainage.
                4. Install and compact the base in controlled lifts.
                5. Screed the final bedding layer.
                6. Lay pavers according to the selected pattern.
                7. Measure and complete all required cuts.
                8. Install and secure the edging.
                9. Sweep polymeric sand into the joints.
                10. Compact the finished surface.
                11. Add final sand and clean the site.
                12. Complete the customer inspection.
                """,
                quality: """
                • Confirm the surface drains away from structures.
                • Check that pavers are level and properly supported.
                • Confirm consistent joints and straight border lines.
                • Inspect every cut and edge.
                • Remove loose material and leave the property clean.
                """,
                risks: """
                • Poor access may slow excavation and material handling.
                • Unexpected concrete, roots, or buried materials may increase labour.
                • Rain can interrupt excavation, compaction, and polymeric sand installation.
                • Material shortages can delay completion.
                """
            )
        // Creates the concrete project details.
        case "CONCRETE":
            return ProjectDetails(
                preConstruction: """
                • Inspect the existing surface and determine the cause of damage.
                • Confirm all measurements and required repair depths.
                • Check weather conditions and curing requirements.
                • Protect nearby walls, doors, windows, and landscaping.
                • Confirm material quantities and access to water.
                • Arrange disposal for removed concrete or damaged material.
                """,
                materials: """
                • Concrete, repair mortar, or parging mix.
                • Concrete bonding agent.
                • Fibreglass mesh when reinforcement is required.
                • Form lumber and stakes when pouring new concrete.
                • Fasteners, anchors, and reinforcement when required.
                • Mixing equipment, trowels, floats, sponges, and finishing tools.
                • Plastic sheeting or curing protection.
                """,
                workflow: """
                1. Remove all loose, damaged, or failed material.
                2. Clean dust and debris from the repair area.
                3. Prepare and dampen the surface as required.
                4. Apply bonding agent according to the product instructions.
                5. Install mesh or reinforcement when required.
                6. Apply the base coat or place the concrete.
                7. Allow the material to firm before finishing.
                8. Apply the final coat or complete the final surface finish.
                9. Protect the work during curing.
                10. Remove forms and complete minor touch-ups.
                11. Clean the work area.
                12. Complete the final customer inspection.
                """,
                quality: """
                • Confirm all loose material was removed.
                • Check that repaired areas are fully bonded.
                • Inspect corners, transitions, and finished edges.
                • Confirm the finish is consistent.
                • Protect the repair from rapid drying, rain, or freezing.
                """,
                risks: """
                • Hidden damage may appear after demolition.
                • Excessive heat, rain, or cold can affect curing.
                • Thick repairs may require multiple applications.
                • Poor surface preparation can cause future failure.
                """
            )
        // Creates the carpentry project details.
        case "CARPENTRY":
            return ProjectDetails(
                preConstruction: """
                • Confirm total rise, total run, width, and finished height.
                • Calculate the number of risers and tread depth.
                • Confirm local permit and building-code requirements.
                • Inspect the existing structure and attachment points.
                • Confirm lumber type, hardware, and finish.
                • Plan safe access during demolition and construction.
                """,
                materials: """
                • Pressure-treated framing lumber.
                • Stringer material when stairs are included.
                • Tread and riser boards.
                • Posts, rails, and balusters.
                • Exterior structural screws and approved connectors.
                • Concrete anchors or post bases when required.
                • Blocking and additional framing material.
                • Wood treatment for all field cuts.
                """,
                workflow: """
                1. Confirm all measurements before cutting material.
                2. Remove unsafe or damaged components.
                3. Repair or reinforce the supporting structure.
                4. Cut and test-fit the first stringer or framing component.
                5. Use the approved piece as the pattern for remaining cuts.
                6. Install framing, blocking, and structural connections.
                7. Install treads and risers.
                8. Install posts, railings, and guards.
                9. Treat exposed cuts and complete finishing work.
                10. Check every fastener and connection.
                11. Remove debris and clean the work area.
                12. Complete the final customer inspection.
                """,
                quality: """
                • Confirm all risers are consistent.
                • Confirm all treads are level and securely supported.
                • Check that stairs and railings do not move.
                • Confirm posts are plumb and rails are secure.
                • Inspect for sharp edges, exposed fasteners, or trip hazards.
                """,
                risks: """
                • Incorrect rise calculations can make the stairs unsafe.
                • Hidden rot may require additional structural repairs.
                • Existing walls or concrete may not provide suitable attachment points.
                • Material movement may occur as pressure-treated lumber dries.
                """
            )
        // Creates the painting project details.
        case "PAINTING":
            return ProjectDetails(
                preConstruction: """
                • Confirm the rooms, walls, ceilings, trim, and doors included.
                • Inspect for holes, cracks, stains, peeling paint, or water damage.
                • Confirm paint colours, sheen, and product.
                • Determine whether primer is required.
                • Protect floors, furniture, fixtures, and adjacent surfaces.
                • Confirm drying time and customer access requirements.
                """,
                materials: """
                • Paint and primer.
                • Patching compound and caulking.
                • Sandpaper and sanding blocks.
                • Rollers, brushes, trays, and extension poles.
                • Painter's tape and masking material.
                • Drop sheets and plastic protection.
                • Cleaning supplies.
                """,
                workflow: """
                1. Move or protect furniture and personal property.
                2. Cover floors and mask all protected surfaces.
                3. Remove loose paint and repair damaged areas.
                4. Sand repairs and glossy surfaces.
                5. Clean dust and residue.
                6. Apply primer where required.
                7. Cut in edges, corners, and trim.
                8. Roll the first finish coat.
                9. Inspect after drying and repair imperfections.
                10. Apply the second finish coat.
                11. Remove tape and complete touch-ups.
                12. Clean the work area and complete the customer inspection.
                """,
                quality: """
                • Confirm even colour and full coverage.
                • Inspect for drips, roller lines, and missed areas.
                • Check clean lines around trim and fixtures.
                • Confirm patched areas do not remain visible.
                • Leave all floors and surfaces clean.
                """,
                risks: """
                • Existing stains may bleed through without proper primer.
                • Poor repairs may remain visible under finish paint.
                • High humidity may increase drying time.
                • Colour changes may require additional coats.
                """
            )
        // Creates the landscaping project details.
        case "LANDSCAPING":
            return ProjectDetails(
                preConstruction: """
                • Walk the property with the customer.
                • Confirm which plants stay, move, or are removed.
                • Mark property boundaries and protected areas.
                • Check sunlight, drainage, and soil conditions.
                • Confirm access for soil, mulch, stone, and waste removal.
                • Identify irrigation lines, lighting wires, and utilities.
                """,
                materials: """
                • Soil, compost, mulch, or decorative stone.
                • Plants, shrubs, trees, or sod.
                • Landscape fabric when required.
                • Edging material.
                • Stakes, ties, fertilizer, and soil amendments.
                • Yard-waste bags, bins, or disposal equipment.
                • Watering equipment.
                """,
                workflow: """
                1. Photograph and mark the work area.
                2. Protect all plants and features that will remain.
                3. Remove unwanted plants, weeds, roots, and debris.
                4. Complete grading and soil preparation.
                5. Install edging or hardscape borders.
                6. Place and arrange plants before final installation.
                7. Plant at the correct depth and spacing.
                8. Install soil, mulch, stone, or sod.
                9. Water the completed area thoroughly.
                10. Clean all walkways and surrounding surfaces.
                11. Review maintenance requirements with the customer.
                12. Complete the final customer inspection.
                """,
                quality: """
                • Confirm drainage does not direct water toward the building.
                • Check plant depth and spacing.
                • Confirm all transplanted plants are watered.
                • Check edging lines and finished grades.
                • Remove all roots, weeds, and waste from the site.
                """,
                risks: """
                • Underground roots and compacted soil may increase labour.
                • Transplanted plants may experience stress or fail.
                • Extreme heat can damage new plants or sod.
                • Customer expectations must be clear before removing mature plants.
                """
            )
        // Creates the demolition project details.
        case "DEMOLITION":
            return ProjectDetails(
                preConstruction: """
                • Confirm exactly what must be removed and what must remain.
                • Check for electrical, plumbing, gas, and utility connections.
                • Confirm permit and disposal requirements.
                • Protect nearby structures, finishes, and landscaping.
                • Plan the debris-removal route.
                • Confirm bin placement and pickup schedule.
                """,
                materials: """
                • Personal protective equipment.
                • Pry bars, hammers, saws, and demolition tools.
                • Dust-control equipment.
                • Tarps, plastic protection, and floor protection.
                • Wheelbarrows, carts, or material-handling equipment.
                • Disposal bin or removal vehicle.
                • Temporary supports when required.
                """,
                workflow: """
                1. Photograph the existing site.
                2. Isolate all connected utilities.
                3. Protect areas that will remain.
                4. Remove finishes and loose components first.
                5. Complete demolition in controlled sections.
                6. Separate recyclable and disposable materials when possible.
                7. Remove debris continuously to maintain a safe work area.
                8. Inspect for hidden damage.
                9. Remove all remaining fasteners and sharp materials.
                10. Sweep and clean the work area.
                11. Confirm the site is ready for the next construction phase.
                12. Complete the final customer inspection.
                """,
                quality: """
                • Confirm no protected surfaces were damaged.
                • Check that all requested material was removed.
                • Remove exposed nails, screws, and sharp edges.
                • Ensure the work area is stable and safe.
                • Confirm debris was disposed of properly.
                """,
                risks: """
                • Hidden utilities may create serious hazards.
                • Unexpected structural conditions may stop work.
                • Heavy materials can increase labour and disposal costs.
                • Limited access may slow debris removal.
                """
            )
        //Creates the general construction project details.
        default:
            return ProjectDetails(
                preConstruction: """
                • Review the complete customer scope.
                • Confirm measurements and site conditions.
                • Photograph existing conditions.
                • Identify permits, utility locations, and safety requirements.
                • Confirm materials, delivery dates, labour, and equipment.
                • Establish the project schedule and customer communication plan.
                """,
                materials: """
                • Confirm all main project materials.
                • Confirm fasteners and accessories.
                • Confirm tools and equipment.
                • Include consumable supplies.
                • Include waste and disposal requirements.
                """,
                workflow: """
                1. Confirm the written scope of work.
                2. Prepare the site and protect surrounding areas.
                3. Complete demolition or removal work.
                4. Inspect for hidden conditions.
                5. Complete structural and base preparation.
                6. Install the required materials.
                7. Complete finishing and detail work.
                8. Inspect the work for quality and safety.
                9. Correct deficiencies.
                10. Clean the site.
                11. Review the completed work with the customer.
                12. Obtain customer approval before closing the project.
                """,
                quality: """
                • Confirm daily labour requirements.
                • Confirm material availability before starting.
                • Track additional work outside the original scope.
                • Photograph progress during every major phase.
                • Complete a final quality inspection.
                """,
                risks: """
                • Unclear scope can lead to disputes and unpaid extra work.
                • Material delays can affect the schedule.
                • Hidden damage may require a change order.
                • Weather and site access may affect productivity.
                """
            )
        }
    }
}
