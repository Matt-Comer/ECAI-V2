


//
//  QuoteIntelligenceAgent.swift
//  ECAI_V2
//
//  Created by Matthew Comer on 2026-07-14.
//
import Foundation
// Creates the E.C.A.I. agent responsible for quote generation.
struct QuoteIntelligenceAgent: ECAIAgent {
    // Stores the name displayed for this agent.
    let name = "Quote Intelligence Agent"
    // Stores a short explanation of the agent's purpose.
    let description = "Reviews labour, materials, access, disposal, risk, and profit before creating a quote recommendation."
    // Creates a quote response from the information provided.
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
            Please enter the project type, measurements, materials, site access, crew size, timeline, and special requirements.
            Example:
            Quote an 8-foot by 20-foot interlocking patio with excavation, HPB, edging, disposal, delivery, and a two-person crew.
            """
        }
        // Converts the input to lowercase so the project type can be identified.
        let lowercaseInput = cleanedInput.lowercased()
        // Creates an interlocking quote review.
        if lowercaseInput.contains("interlock") ||
            lowercaseInput.contains("paver") ||
            lowercaseInput.contains("patio") {
            return """
            INTERLOCKING QUOTE REVIEW
            Project:
            \(cleanedInput)
            Scope review:
            • Confirm the exact square footage.
            • Confirm excavation depth.
            • Confirm the paver style, colour, pattern, and border.
            • Confirm whether old soil, concrete, sod, or pavers must be removed.
            • Confirm edging type and total linear footage.
            • Confirm drainage direction and final elevation.
            • Confirm access for excavation, delivery, and waste removal.
            Labour review:
            • Estimate excavation and removal time.
            • Estimate base preparation and compaction time.
            • Estimate screeding and installation time.
            • Include cutting, edging, polymeric sand, cleanup, and final inspection.
            • Confirm whether one person can complete the work or whether a helper is required.
            • Include additional labour for narrow access or hand-bombing materials.
            Material review:
            • Pavers with cutting and waste allowance.
            • HPB or approved base material.
            • Polymeric sand.
            • Edging or concrete curb.
            • Landscape fabric when required.
            • Delivery charges.
            • Additional material for settlement, cuts, or damaged pieces.
            Equipment and disposal:
            • Plate compactor.
            • Masonry saw or paver splitter.
            • Wheelbarrows and hand tools.
            • Disposal bin or dump run.
            • Bin delivery and pickup.
            • Dumping fees.
            • Equipment rental and fuel.
            Costs commonly missed:
            • Extra excavation.
            • Tree roots or buried concrete.
            • Tight access.
            • Hand-loading and hand-unloading.
            • Delivery delays.
            • Extra stone cuts.
            • Additional edging.
            • Site cleanup.
            • Return visits.
            • Parking and travel.
            Pricing structure:
            • Labour cost.
            • Material cost.
            • Delivery cost.
            • Equipment cost.
            • Disposal cost.
            • Contingency.
            • Profit.
            Before sending the quote:
            ✓ Measurements confirmed
            ✓ Material quantities checked
            ✓ Access inspected
            ✓ Disposal arranged
            ✓ Scope and exclusions written clearly
            ✓ Additional work requires customer approval
            ✓ Final price makes the job worth completing
            """
        }
        // Creates a concrete and parging quote review.
        if lowercaseInput.contains("concrete") ||
            lowercaseInput.contains("cement") ||
            lowercaseInput.contains("parging") ||
            lowercaseInput.contains("foundation") {
            return """
            CONCRETE QUOTE REVIEW
            Project:
            \(cleanedInput)
            Scope review:
            • Confirm the damaged area, measurements, and repair depth.
            • Determine whether the work is a repair, resurfacing, parging job, or new pour.
            • Confirm what must be demolished and removed.
            • Inspect for loose material, cracks, water damage, and hidden failure.
            • Confirm the required finish.
            • Check access to water, power, and the work area.
            • Review weather and curing conditions.
            Labour review:
            • Demolition and surface preparation.
            • Cleaning and dust removal.
            • Forming when required.
            • Mixing, carrying, placing, and finishing.
            • Base coat and second coat when parging.
            • Sponge finishing or trowel finishing.
            • Curing protection.
            • Form removal and cleanup.
            • Return visits when required.
            Material review:
            • Concrete, repair mortar, or parging mix.
            • Bonding agent.
            • Fibreglass mesh.
            • Reinforcement or anchors when required.
            • Form lumber and stakes.
            • Fasteners.
            • Water and mixing supplies.
            • Plastic or curing protection.
            • Waste allowance.
            Equipment and disposal:
            • Mixer or mixing tubs.
            • Trowels, floats, sponges, and finishing tools.
            • Chipping or demolition tools.
            • Wheelbarrows.
            • Disposal bin or dump run.
            • Equipment rental and fuel.
            Costs commonly missed:
            • Hidden damage after removal.
            • Thick repair areas requiring multiple coats.
            • Additional bonding or reinforcement.
            • Extra materials caused by uneven surfaces.
            • Weather delays.
            • Return visits for finishing or form removal.
            • Protection of doors, windows, walls, and landscaping.
            • Cleanup and disposal.
            Pricing structure:
            • Labour cost.
            • Material cost.
            • Equipment cost.
            • Disposal cost.
            • Travel cost.
            • Contingency.
            • Profit.
            Before sending the quote:
            ✓ Existing damage inspected
            ✓ Repair method confirmed
            ✓ Materials calculated
            ✓ Weather considered
            ✓ Hidden damage excluded or covered
            ✓ Customer understands the finish
            ✓ Final price includes preparation and cleanup
            """
        }
        // Creates a stairs, deck, and carpentry quote review.
        if lowercaseInput.contains("stairs") ||
            lowercaseInput.contains("steps") ||
            lowercaseInput.contains("deck") ||
            lowercaseInput.contains("railing") ||
            lowercaseInput.contains("carpentry") ||
            lowercaseInput.contains("wood") {
            return """
            CARPENTRY QUOTE REVIEW
            Project:
            \(cleanedInput)
            Scope review:
            • Confirm width, total rise, total run, and finished height.
            • Confirm the number of steps and stringers.
            • Confirm tread, riser, railing, and post requirements.
            • Inspect the existing framing and attachment points.
            • Check for rot, movement, or hidden damage.
            • Confirm whether demolition is included.
            • Confirm customer expectations for appearance and budget.
            Labour review:
            • Measuring and layout.
            • Demolition and removal.
            • Stringer cutting.
            • Framing and blocking.
            • Tread and riser installation.
            • Post and railing installation.
            • Structural fastening.
            • Treating field cuts.
            • Cleanup and final safety inspection.
            Material review:
            • Pressure-treated lumber.
            • Stringer material.
            • Tread and riser boards.
            • Posts, rails, and balusters.
            • Structural screws.
            • Joist hangers, brackets, anchors, and connectors.
            • Concrete or post bases when required.
            • Additional lumber for blocking and mistakes.
            • Wood treatment for cut ends.
            Equipment and disposal:
            • Circular saw or mitre saw.
            • Reciprocating saw.
            • Drill and impact driver.
            • Levels and layout tools.
            • Disposal of old lumber.
            • Delivery or pickup costs.
            Costs commonly missed:
            • Hidden rot.
            • Additional blocking.
            • Unusable existing attachment points.
            • Extra hardware.
            • Railing requirements.
            • Demolition time.
            • Material delivery.
            • Return trips for missing lumber.
            • Cleanup and disposal.
            Pricing structure:
            • Labour cost.
            • Lumber cost.
            • Hardware cost.
            • Delivery cost.
            • Disposal cost.
            • Contingency.
            • Profit.
            Before sending the quote:
            ✓ Measurements confirmed
            ✓ Stair calculations checked
            ✓ Existing structure inspected
            ✓ Lumber list completed
            ✓ Hardware included
            ✓ Demolition included or excluded clearly
            ✓ Final price reflects skill, safety, and responsibility
            """
        }
        // Creates a landscaping quote review.
        if lowercaseInput.contains("landscaping") ||
            lowercaseInput.contains("garden") ||
            lowercaseInput.contains("gardening") ||
            lowercaseInput.contains("lawn") ||
            lowercaseInput.contains("plant") ||
            lowercaseInput.contains("tree") {
            return """
            LANDSCAPING QUOTE REVIEW
            Project:
            \(cleanedInput)
            Scope review:
            • Confirm exactly what stays, moves, and is removed.
            • Confirm garden dimensions and quantities.
            • Inspect soil, roots, weeds, drainage, and site access.
            • Confirm whether plants are being transplanted, discarded, or saved.
            • Confirm who supplies plants and materials.
            • Confirm disposal requirements.
            • Discuss the risk of transplanting mature plants.
            Labour review:
            • Pruning and trimming.
            • Digging and root removal.
            • Transplanting.
            • Soil preparation and grading.
            • Edging installation.
            • Mulch, soil, stone, or sod installation.
            • Watering.
            • Bagging, loading, and cleanup.
            Material review:
            • Soil.
            • Compost.
            • Mulch.
            • Decorative stone.
            • Landscape fabric.
            • Edging.
            • Plants or sod.
            • Fertilizer.
            • Yard-waste bags.
            • Disposal supplies.
            Equipment and disposal:
            • Trimmers, pruners, saws, and shovels.
            • Wheelbarrows.
            • Disposal bags or bin.
            • Truck, van, or trailer.
            • Tool rental when required.
            Costs commonly missed:
            • Heavy roots.
            • Compacted soil.
            • Excessive waste.
            • Bagging plants for the customer.
            • Extra watering.
            • Difficult access.
            • Additional labour caused by customer changes.
            • Plant failure after transplanting.
            • Cleanup and disposal.
            Pricing structure:
            • Labour cost.
            • Material cost.
            • Disposal cost.
            • Equipment cost.
            • Travel cost.
            • Contingency.
            • Profit.
            Before sending the quote:
            ✓ Scope is specific
            ✓ Plants to remain are identified
            ✓ Disposal responsibilities are clear
            ✓ Transplanting risks explained
            ✓ Materials confirmed
            ✓ Extra requests require additional pricing
            ✓ Final price covers the full workload
            """
        }
        // Creates a painting quote review.
        if lowercaseInput.contains("painting") ||
            lowercaseInput.contains("paint") ||
            lowercaseInput.contains("primer") {
            return """
            PAINTING QUOTE REVIEW
            Project:
            \(cleanedInput)
            Scope review:
            • Confirm all rooms and surfaces included.
            • Confirm whether walls, ceilings, trim, doors, and closets are included.
            • Inspect holes, cracks, peeling paint, stains, and water damage.
            • Confirm the colour and sheen.
            • Confirm who supplies the paint.
            • Confirm whether furniture must be moved.
            • Confirm the required number of coats.
            Labour review:
            • Moving and protecting furniture.
            • Floor protection.
            • Patching and caulking.
            • Sanding and cleaning.
            • Priming.
            • Cutting.
            • Rolling.
            • Additional coats.
            • Touch-ups.
            • Cleanup and furniture replacement.
            Material review:
            • Paint.
            • Primer.
            • Patching compound.
            • Caulking.
            • Sandpaper.
            • Rollers and brushes.
            • Tape.
            • Drop sheets.
            • Plastic.
            • Trays and liners.
            Costs commonly missed:
            • Heavy patching.
            • Stain-blocking primer.
            • Major colour changes.
            • Tall walls or stairwells.
            • Extra trim and doors.
            • Moving heavy furniture.
            • Additional coats.
            • Parking and travel.
            • Cleanup time.
            Pricing structure:
            • Preparation labour.
            • Painting labour.
            • Material cost.
            • Equipment cost.
            • Travel cost.
            • Contingency.
            • Profit.
            Before sending the quote:
            ✓ Surfaces inspected
            ✓ Number of coats confirmed
            ✓ Paint responsibility confirmed
            ✓ Repairs included or excluded
            ✓ Furniture responsibilities confirmed
            ✓ Additional work requires approval
            ✓ Final price includes preparation and cleanup
            """
        }
        // Creates a demolition and removal quote review.
        if lowercaseInput.contains("demolition") ||
            lowercaseInput.contains("demo") ||
            lowercaseInput.contains("removal") ||
            lowercaseInput.contains("tear down") {
            return """
            DEMOLITION QUOTE REVIEW
            Project:
            \(cleanedInput)
            Scope review:
            • Confirm exactly what must be removed.
            • Confirm what must remain protected.
            • Measure the demolition area.
            • Estimate the weight and volume of debris.
            • Inspect access from the work area to the bin or vehicle.
            • Check for utilities, reinforcement, and structural concerns.
            • Confirm disposal and permit requirements.
            Labour review:
            • Site protection.
            • Controlled demolition.
            • Breaking, cutting, and separating material.
            • Carrying debris.
            • Loading the bin or vehicle.
            • Sweeping and final cleanup.
            • Additional labour for stairs, hills, or long carrying distances.
            Equipment and disposal:
            • Demolition tools.
            • Saws and blades.
            • Jackhammer or breaker.
            • Wheelbarrows and carts.
            • Personal protective equipment.
            • Disposal bin.
            • Dump fees.
            • Bin delivery and pickup.
            • Truck or trailer costs.
            Costs commonly missed:
            • Heavy reinforced concrete.
            • Hidden layers.
            • Long carry distance.
            • Downhill or uphill access.
            • Dust control.
            • Extra bin weight.
            • Multiple disposal trips.
            • Damage protection.
            • Cleanup.
            • Tool wear and blades.
            Pricing structure:
            • Labour cost.
            • Equipment cost.
            • Disposal cost.
            • Bin cost.
            • Travel cost.
            • Contingency.
            • Profit.
            Before sending the quote:
            ✓ Demolition volume estimated
            ✓ Access inspected
            ✓ Disposal price confirmed
            ✓ Utilities considered
            ✓ Heavy or hidden materials covered
            ✓ Protected areas documented
            ✓ Final price covers removal and cleanup
            """
        }
        // Creates a general quote review when no specific project type is found.
        return """
        GENERAL CONTRACTOR QUOTE REVIEW
        Project:
        \(cleanedInput)
        Scope review:
        • Confirm exactly what the customer wants completed.
        • Measure and photograph the work area.
        • Inspect site conditions and access.
        • Identify demolition, preparation, installation, finishing, and cleanup.
        • Confirm customer-supplied and contractor-supplied materials.
        • Write down what is not included.
        Labour review:
        • Estimate the total working hours or days.
        • Confirm the required crew size.
        • Include setup and preparation time.
        • Include material handling.
        • Include finishing and cleanup.
        • Include return visits when required.
        Material review:
        • Primary materials.
        • Fasteners and accessories.
        • Waste allowance.
        • Delivery charges.
        • Consumable supplies.
        • Additional material for mistakes or hidden conditions.
        Additional costs:
        • Disposal.
        • Equipment rental.
        • Delivery.
        • Travel.
        • Parking.
        • Permits.
        • Subcontractors.
        • Contingency.
        Pricing review:
        • Labour cost.
        • Material cost.
        • Equipment cost.
        • Disposal cost.
        • Overhead.
        • Contingency.
        • Profit.
        Before sending the quote:
        ✓ Scope is clear
        ✓ Measurements are confirmed
        ✓ Labour is realistic
        ✓ All materials are included
        ✓ Access has been considered
        ✓ Disposal is covered
        ✓ Extra work requires approval
        ✓ Final price makes the job worthwhile
        """
    }
}
