TODO: break this into research versus implementation plan. 

In class will be RESEARCH:
- A Fintech startup launching a mobile wallet (PCI DSS/SOC 2 focus)
- a Healthcare SaaS provider (HIPAA focus)
- an E-commerce firm expanding into Europe (GDPR/NIS2 focus)
- a US Government contractor (CMMC 2.0 / NIST SP 800-171 / FedRAMP 20x / FISMA / Executive Order 14028)

* **Infrastructure:** Mention they use a hybrid cloud (AWS + On-prem), use a third-party CI/CD pipeline, and are beginning to experiment with **Agentic AI** for customer support.



Designing a compliance-oriented assignment for IT infrastructure is a great way to move students past "check-the-box" thinking and into the reality of modern **Governance, Risk, and Compliance (GRC)**. 

To make this effective, I recommend a **Scenario-Based Research Project**. Instead of asking for a list of rules, give them a fictional (but realistic) company and ask them to build its "Compliance Blueprint."

---

## 🏗️ Recommended Assignment Structure: "The SecureStack Infrastructure Project"

### 1. The Scenario
Assign each student (or group) a specific industry and a "Phase 1" infrastructure setup.
* **Examples:** A Fintech startup launching a mobile wallet (PCI DSS/SOC 2 focus), a Healthcare SaaS provider (HIPAA focus), or an E-commerce firm expanding into Europe (GDPR/NIS2 focus).


### 2. Research Task: Top Compliance Concerns (The "What")
Ask students to research and justify the top 3–5 regulatory frameworks applicable to their scenario in **2026**. 
* **Why this works:** It forces them to look up current laws (like the **EU AI Act** or **DORA** for finance) rather than just citing 20-year-old standards.
* **Key Deliverable:** A "Jurisdiction & Regulation Map" linking business functions to specific legal requirements.

### 3. Implementation Requirements (The "How")
Students must translate vague legal text into technical "Controls."
* **Identity:** How will they implement **Multi-Factor Authentication (MFA)** and the **Principle of Least Privilege (PoLP)**?
* **Data:** What are the specific encryption standards for data at rest (e.g., AES-256) and in transit?
* **AI Governance:** If using AI, how will they ensure "explainability" and "data integrity" as required by 2026 standards?



### 4. Audit & Evidence (The "Proof")
This is where most students struggle, so it’s the most valuable part of the assignment. Ask them: *"If an auditor walks in tomorrow, what file do you show them to prove you are compliant?"*
* **Artifact Request:** They must list 5 specific "Evidence Artifacts" (e.g., "Quarterly User Access Review Logs," "Vulnerability Scan Reports," or "Automated Patch Management History").
* **Continuous Compliance:** Ask them to describe one way they would **automate** this evidence collection so it isn't a manual "point-in-time" headache.

---

## 📝 Example Assignment Prompt for Your Syllabus

> **Assignment Title:** Infrastructure Compliance & Audit Strategy
>
> **Objective:** Act as a Compliance Architect for [Company X]. You must research the legal landscape for 2026, design the technical safeguards for their cloud-native infrastructure, and create an "Audit-Ready" checklist.
>
> **Requirements:**
> 1. **Regulatory Scan:** Identify three global or local regulations your company must follow.
> 2. **Technical Control Matrix:** For each regulation, list two technical implementations (e.g., Network Segmentation, SIEM Logging).
> 3. **The Auditor’s Folder:** Create a table listing 5 pieces of evidence you would provide to an auditor to prove these controls are working.
> 4. **AI Risk Assessment:** Briefly explain how your infrastructure handles the privacy risks of your company’s new AI tools.

---

## 💡 A Quick Pro-Tip
Compliance is often seen as "boring." To spice it up, tell the students that **"Non-compliance results in an immediate 'Zero' for the quarter's revenue"** in the simulation. It helps them realize that in the real world, compliance isn't just a hurdle—it's a "license to operate."

Would you like me to draft a specific **grading rubric** for this assignment based on these sections?

Certainly! Here is the content rewritten into a formal, structured assignment format. This layout mimics a standard university or professional training module, ensuring students understand the professional stakes and the technical depth required.

---

# Assignment: IT Infrastructure Compliance & Audit Strategy

**Course:** IT Governance and Security  
**Weight:** 25% of Final Grade  
**Submission Format:** PDF Report (Professional Business Style)

---

## 1. Project Overview
You have been appointed as the **Lead Compliance Architect** for **NexusHealth Solutions**, a mid-sized SaaS provider specializing in AI-driven patient diagnostics. The company is migrating its legacy on-premise data to a hybrid-cloud environment (AWS/Azure) and is expanding operations into the European Union.

Your task is to develop a **Compliance Blueprint** that identifies the regulatory landscape, defines technical controls, and prepares the organization for a mandatory third-party audit.

---

## 2. Part I: Regulatory Research & Scoping
Research and identify the specific compliance requirements for the year **2026**. You must provide a "Jurisdiction Map" that justifies why the following frameworks apply to NexusHealth:

* **Industry-Specific:** HIPAA (Healthcare) and PCI DSS (Payment processing).
* **Geographic:** GDPR (EU Operations) and any one emerging regional law (e.g., CCPA/CPRA or local equivalent).
* **Emerging Tech:** Identify the specific requirements of the **EU AI Act** regarding "High-Risk" AI systems in healthcare.

---

## 3. Part II: Technical Control Implementation
For each regulation identified above, define the **Infrastructure Implementation Needs**. You must translate legal jargon into technical reality. Complete the following table (minimum 5 rows):

| Regulatory Goal | Technical Control Requirement | Implementation Strategy (The "How") |
| :--- | :--- | :--- |
| **Data Privacy** | Encryption at Rest | Implementation of AES-256 via Cloud KMS |
| **Access Control** | Principle of Least Privilege | Role-Based Access Control (RBAC) & Just-In-Time (JIT) access |
| **Auditability** | Immutable Logging | Centralized SIEM with write-once-read-many (WORM) storage |
| **AI Transparency** | Model Explainability | Technical logging of AI decision-making data points |

---

## 4. Part III: The Audit Evidence Folder
An auditor will not take your word for it—they require "Artifacts." For each of the following infrastructure areas, describe **one specific file or report** you would generate to prove compliance:

1.  **Identity Management:** Provide an example of a "User Access Review" log.
2.  **Network Security:** Provide a "Network Topology Map" showing micro-segmentation.
3.  **Vulnerability Management:** Provide a sample "Remediation Report" from a recent penetration test.
4.  **Change Management:** Provide a "Change Request Ticket" showing manager approval before a production deployment.

---

## 5. Deliverables & Evaluation Criteria
Your submission will be graded based on the following:

* **Regulatory Accuracy (30%):** Correct identification of 2026-specific laws and their triggers.
* **Technical Feasibility (30%):** Are the proposed infrastructure controls realistic and standard for modern cloud environments?
* **Audit Readiness (30%):** Do the "Artifacts" actually prove the control is working, or are they just fluff?
* **Professionalism (10%):** Clarity, formatting, and use of professional IT terminology.

---

> **Note to Students:** "Compliance is the floor, not the ceiling." While this assignment focuses on meeting legal requirements, your design should ideally enhance the overall security posture of the firm.

Would you like me to create a **marking rubric** with specific point breakdowns for each of these sections?