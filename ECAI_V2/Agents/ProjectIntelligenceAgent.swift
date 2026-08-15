//
//  ProjectIntelligenceAgent.swift
//  ECAI_V2
//
//  Created by Matthew Comer on 2026-07-14.
//
import Foundation
// Creates the E.C.A.I. agent responsible for project planning.
struct ProjectIntelligenceAgent: ECAIAgent {
    // Stores the name displayed for this agent.
    let name = "Project Intelligence Agent"
    // Stores a short explanation of the agent's purpose.
    let description = "Creates project plans, schedules, material lists, and workflow recommendations."
    // Creates a project response from the information provided.
    func generateResponse(
        from input: String
    ) -> String {
        // Removes extra spaces from the beginning and end of the input.
        let cleanedInput = input.trimmingCharacters(
            in: .whitespacesAndNewlines
        )
        // Checks whether the user entered project information.
        if cleanedInput.isEmpty {
            return """
            Please enter the project type, measurements, materials, timeline, crew size, and current job status.
            Example:
            Plan an 8-foot by 20-foot interlocking patio for a two-person crew.
            """
        }
        // Converts the input to lowercase so the project type can be identified.
        let lowercaseInput = cleanedInput.lowercased()
        // Creates a project plan for interlocking work.
        if lowercaseInput.contains("interlock") ||
            lowercaseInput.contains("paver") ||
            lowercaseInput.contains("patio") {
            return """
            INTERLOCKING PROJECT PLAN
            Project:
            \(cleanedInput)
            Pre-construction:
            • Confirm the finished dimensions and pattern.
            • Mark the excavation area.
            • Check drainage direction and final elevation.
            • Confirm access for materials, equipment, and waste removal.
            • Locate underground utilities before excavation.
            • Confirm pavers, edging, base material, and delivery dates.
            Material planning:
            • Interlocking pavers with additional material for cuts and waste.
            • HPB or approved base material.
            • Edge restraints or concrete curbing.
            • Landscape fabric when required.
            • Polymeric sand.
            • Disposal bin or removal vehicle.
            Recommended workflow:
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
            Quality checks:
            • Confirm the surface drains away from structures.
            • Check that pavers are level and properly supported.
            • Confirm consistent joints and straight border lines.
            • Inspect every cut and edge.
            • Remove loose material and leave the property clean.
            Project risks:
            • Poor access may slow excavation and material handling.
            • Unexpected concrete, roots, or buried materials may increase labour.
            • Rain can interrupt excavation, compaction, and polymeric sand installation.
            • Material shortages can delay completion.
            """
        }
        // Creates a project plan for concrete and parging work.
        if lowercaseInput.contains("concrete") ||
            lowercaseInput.contains("cement") ||
            lowercaseInput.contains("parging") ||
            lowercaseInput.contains("foundation") {
            return """
            CONCRETE PROJECT PLAN
            Project:
            \(cleanedInput)
            Pre-construction:
            • Inspect the existing surface and determine the cause of damage.
            • Confirm all measurements and required repair depths.
            • Check weather conditions and curing requirements.
            • Protect nearby walls, doors, windows, and landscaping.
            • Confirm material quantities and access to water.
            • Arrange disposal for removed concrete or damaged material.
            Material planning:
            • Concrete, repair mortar, or parging mix.
            • Concrete bonding agent.
            • Fibreglass mesh when reinforcement is required.
            • Form lumber and stakes when pouring new concrete.
            • Fasteners, anchors, and reinforcement when required.
            • Mixing equipment, trowels, floats, sponges, and finishing tools.
            • Plastic sheeting or curing protection.
            Recommended workflow:
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
            Quality checks:
            • Confirm all loose material was removed.
            • Check that repaired areas are fully bonded.
            • Inspect corners, transitions, and finished edges.
            • Confirm the finish is consistent.
            • Protect the repair from rapid drying, rain, or freezing.
            Project risks:
            • Hidden damage may appear after demolition.
            • Excessive heat, rain, or cold can affect curing.
            • Thick repairs may require multiple applications.
            • Poor surface preparation can cause future failure.
            """
        }
        // Creates a project plan for stairs, decks, and carpentry.
        if lowercaseInput.contains("stairs") ||
            lowercaseInput.contains("steps") ||
            lowercaseInput.contains("deck") ||
            lowercaseInput.contains("railing") ||
            lowercaseInput.contains("carpentry") ||
            lowercaseInput.contains("wood") {
            return """
            CARPENTRY PROJECT PLAN
            Project:
            \(cleanedInput)
            Pre-construction:
            • Confirm total rise, total run, width, and finished height.
            • Calculate the number of risers and tread depth.
            • Confirm local permit and building-code requirements.
            • Inspect the existing structure and attachment points.
            • Confirm lumber type, hardware, and finish.
            • Plan safe access during demolition and construction.
            Material planning:
            • Pressure-treated framing lumber.
            • Stringer material when stairs are included.
            • Tread and riser boards.
            • Posts, rails, and balusters.
            • Exterior structural screws and approved connectors.
            • Concrete anchors or post bases when required.
            • Blocking and additional framing material.
            • Wood treatment for all field cuts.
            Recommended workflow:
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
            Quality checks:
            • Confirm all risers are consistent.
            • Confirm all treads are level and securely supported.
            • Check that stairs and railings do not move.
            • Confirm posts are plumb and rails are secure.
            • Inspect for sharp edges, exposed fasteners, or trip hazards.
            Project risks:
            • Incorrect rise calculations can make the stairs unsafe.
            • Hidden rot may require additional structural repairs.
            • Existing walls or concrete may not provide suitable attachment points.
            • Material movement may occur as pressure-treated lumber dries.
            """
        }
        // Creates a project plan for painting work.
        if lowercaseInput.contains("painting") ||
            lowercaseInput.contains("paint") ||
            lowercaseInput.contains("primer") {
            return """
            PAINTING PROJECT PLAN
            Project:
            \(cleanedInput)
            Pre-construction:
            • Confirm the rooms, walls, ceilings, trim, and doors included.
            • Inspect for holes, cracks, stains, peeling paint, or water damage.
            • Confirm paint colours, sheen, and product.
            • Determine whether primer is required.
            • Protect floors, furniture, fixtures, and adjacent surfaces.
            • Confirm drying time and customer access requirements.
            Material planning:
            • Paint and primer.
            • Patching compound and caulking.
            • Sandpaper and sanding blocks.
            • Rollers, brushes, trays, and extension poles.
            • Painter's tape and masking material.
            • Drop sheets and plastic protection.
            • Cleaning supplies.
            Recommended workflow:
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
            Quality checks:
            • Confirm even colour and full coverage.
            • Inspect for drips, roller lines, and missed areas.
            • Check clean lines around trim and fixtures.
            • Confirm patched areas do not remain visible.
            • Leave all floors and surfaces clean.
            Project risks:
            • Existing stains may bleed through without proper primer.
            • Poor repairs may remain visible under finish paint.
            • High humidity may increase drying time.
            • Colour changes may require additional coats.
            """
        }
        // Creates a project plan for landscaping and garden work.
        if lowercaseInput.contains("landscaping") ||
            lowercaseInput.contains("garden") ||
            lowercaseInput.contains("gardening") ||
            lowercaseInput.contains("lawn") ||
            lowercaseInput.contains("plant") ||
            lowercaseInput.contains("tree") {
            return """
            LANDSCAPING PROJECT PLAN
            Project:
            \(cleanedInput)
            Pre-construction:
            • Walk the property with the customer.
            • Confirm which plants stay, move, or are removed.
            • Mark property boundaries and protected areas.
            • Check sunlight, drainage, and soil conditions.
            • Confirm access for soil, mulch, stone, and waste removal.
            • Identify irrigation lines, lighting wires, and utilities.
            Material planning:
            • Soil, compost, mulch, or decorative stone.
            • Plants, shrubs, trees, or sod.
            • Landscape fabric when required.
            • Edging material.
            • Stakes, ties, fertilizer, and soil amendments.
            • Yard-waste bags, bins, or disposal equipment.
            • Watering equipment.
            Recommended workflow:
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
            Quality checks:
            • Confirm drainage does not direct water toward the building.
            • Check plant depth and spacing.
            • Confirm all transplanted plants are watered.
            • Check edging lines and finished grades.
            • Remove all roots, weeds, and waste from the site.
            Project risks:
            • Underground roots and compacted soil may increase labour.
            • Transplanted plants may experience stress or fail.
            • Extreme heat can damage new plants or sod.
            • Customer expectations must be clear before removing mature plants.
            """
        }
        // Creates a project plan for demolition and removal work.
        if lowercaseInput.contains("demolition") ||
            lowercaseInput.contains("demo") ||
            lowercaseInput.contains("removal") ||
            lowercaseInput.contains("tear down") {
            return """
            DEMOLITION PROJECT PLAN
            Project:
            \(cleanedInput)
            Pre-construction:
            • Confirm exactly what must be removed and what must remain.
            • Check for electrical, plumbing, gas, and utility connections.
            • Confirm permit and disposal requirements.
            • Protect nearby structures, finishes, and landscaping.
            • Plan the debris-removal route.
            • Confirm bin placement and pickup schedule.
            Material and equipment planning:
            • Personal protective equipment.
            • Pry bars, hammers, saws, and demolition tools.
            • Dust-control equipment.
            • Tarps, plastic protection, and floor protection.
            • Wheelbarrows, carts, or material-handling equipment.
            • Disposal bin or removal vehicle.
            • Temporary supports when required.
            Recommended workflow:
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
            Quality checks:
            • Confirm no protected surfaces were damaged.
            • Check that all requested material was removed.
            • Remove exposed nails, screws, and sharp edges.
            • Ensure the work area is stable and safe.
            • Confirm debris was disposed of properly.
            Project risks:
            • Hidden utilities may create serious hazards.
            • Unexpected structural conditions may stop work.
            • Heavy materials can increase labour and disposal costs.
            • Limited access may slow debris removal.
            """
        }
        // Creates a general construction project plan.
        return """
        GENERAL CONSTRUCTION PROJECT PLAN
        Project:
        \(cleanedInput)
        Pre-construction:
        • Review the complete customer scope.
        • Confirm measurements and site conditions.
        • Photograph existing conditions.
        • Identify permits, utility locations, and safety requirements.
        • Confirm materials, delivery dates, labour, and equipment.
        • Establish the project schedule and customer communication plan.
        Recommended workflow:
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
        Project management checklist:
        • Confirm daily labour requirements.
        • Confirm material availability before starting.
        • Track additional work outside the original scope.
        • Photograph progress during every major phase.
        • Notify the customer immediately about delays or hidden damage.
        • Keep the property safe and organized.
        • Complete a final quality inspection.
        Project risks:
        • Unclear scope can lead to disputes and unpaid extra work.
        • Material delays can affect the schedule.
        • Hidden damage may require a change order.
        • Weather and site access may affect productivity.
        """
    }
}
