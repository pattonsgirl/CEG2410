## Research - Identity & Policy Management

Identity and validation of identity are major sys admin elements. Research the following core topics.

---

## 1. Enterprise Identity Providers (IdP)
These are the "Source of Truth" for an organization. 

- Microsoft Entra ID
- Okta
- Ping Identity
- WorkOS

Pick method category one from the above. Your research must include:
- Platform information
    - name
    - controlling vendor
    - description
    - link
    - dependencies for implementation
- "cost to implement"
    - what is the pricing model
    - scalability
- implementation needs
    - what do administrators enter
    - policy management
    - access management
    - account configuration

---

## 2. MFA & Verification Methods
This moves the research into the physical and cryptographic layer.

* **Software-Based:** Duo (Push), Google/Microsoft Authenticator (TOTP), and SMS (which students should research for its security flaws like SIM swapping).
* **Hardware-Based:** Yubikeys (FIDO2/WebAuthn) and Smartcards (PIV/CAC).
* **Passwordless:** Passkeys (biometrics-backed) which are becoming the industry default in 2026.

Pick method category one from the above. Your research must include:
- Common methods / platforms in use
    - name
    - description
    - link
    - other dependencies for implementation
- "cost to implement" for each
    - These can be estimates where vendors request you must contact sales - AI can usually report back with ballpark numbers.
    - Factor in both sides where applicable, like hardware solutions - the device and the reader. Software should think about the platform and side costs, like SMS rates

---

## 3. High-Level Research Themes
"2026 Trends":

* **Continuous Verification:** Moving away from "one-and-done" login toward checking identity throughout a session based on behavior.
* **Non-Human Identities:** How do we manage the "identity" of an AI agent or a Docker container?
* **Deepfake Defense:** The shift toward "liveness" detection in biometrics to counter AI-generated spoofs.

Pick method category one from the above. Your research must include:
- category
- what is the concern
- is it currently being exploited / methods for exploitation
- what is the response to prevent exploitation

---

## Submission

Create a folder in your course GitHub repository named `identity` with a file named `research-identity.md`. Address requirements from each of the three categories above. Submit the link to your `research-identity.md` to the Dropbox in Pilot.