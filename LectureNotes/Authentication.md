# Authentication

## Passwords

### What makes a good password?
- [Password guideline summary per NIST](https://www.auditboard.com/blog/nist-password-guidelines/)
- [Check if your password / account has been exposed](https://haveibeenpwned.com/)

### What about a password manager?
- [Top recommended password managers](https://www.nytimes.com/wirecutter/reviews/best-password-managers/)
- [Last Pass in the news](https://blog.lastpass.com/2022/12/notice-of-recent-security-incident/)
    - [More to the breach](https://www.bleepingcomputer.com/news/security/cisa-warns-of-actively-exploited-plex-bug-after-lastpass-breach/)

## PAT (Personal Access Tokens)

Personal access token (or PAT) is a string of characters that can be used to authenticate a user when accessing a computer system instead of the usual password

These did not get widely adopted, but GitHub will toss them out now and then.

- [Wikipedia - Personal Access Token](https://en.wikipedia.org/wiki/Personal_access_token)
- [GitHub - Generate a PAT](https://www.itprotoday.com/devops/how-use-github-personal-access-tokens)
    - If you `clone` with `https` on GitHub, you will get prompted for a username / password - but in the password field you now need to have created a PAT

## SSH Keys

SSH keys area cryptographic key pair used as an access credential in the SSH protocol.

According to [SSH Academy](https://www.ssh.com/academy/iam/ssh-key-management) from a survey of organization, most organizations:

- Have extremely large numbers of SSH keys - even several million - and their use is grossly underestimated
- Have no provisioning and termination processes in place for key based access
- Have no records of who provisioned each key and for what purpose
- Allow their system administrators to self-provision permanent key-based access - without policies, processes, or oversight.

[NIST Guideline on SSH keys and key management](https://www.ssh.com/academy/compliance/nist-7966)  
[Beyond Trust - Best Practices for Managing SSH Keys](https://www.beyondtrust.com/blog/entry/ssh-key-management-overview-6-best-practices)

Key Managers solve this problem
- [Universal Key Management](https://www.ssh.com/products/universal-ssh-key-manager/)
- Folded in to some Cloud Directory Services

## 2FA (Two Factor Authentication)

[Zapier - 2FA Guide](https://zapier.com/blog/two-factor-authentication-2fa-guide/)

- SMS or email codes
- Authentication apps
    - Authy
    - Duo
    - Google Authenticator

## Smart Cards
aka. CAC (Common Access Card) or PIV (Personal Identity Verification)

Works with an embedded chip is inserted into the reader and makes physical contact for the transmission of data. With contactless cards the smart card is held up close to the reader, it doesn’t need to be touching, and communicates it’s credentials through NFC.  This is still combined with a PIN known by the card user.

Biggest downside: every device that needs authentication needs a smart card reader (~$30 for a good low end brand [like iogear](https://www.bestbuy.com/site/iogear-usb-cac-reader/3775222.p?skuId=3775222)) or an NFC reader (only usually on phones atm)

- [Thales Group - Smart Card Basics & Where Tech is Used](https://www.thalesgroup.com/en/markets/digital-identity-and-security/technology/smart-cards-basics)
- [Yubikey - What is a smart card?](https://www.yubico.com/resources/glossary/smart-card/)
- [DOD - Common Access Card Overview](https://www.cac.mil/Common-Access-Card/CAC-Security/)

## Hardware authentication
Principles defined by Fast IDentity Online (FIDO) + Universal Second Factor (U2F), and now we focus on [FIDO2](https://www.yubico.com/blog/what-is-fido2/).

Operates over USB or NFC.

- [Yubikeys](https://www.yubico.com/store/)
- Google [Titan Security Key](https://store.google.com/us/product/titan_security_key?hl=en-US)

How do yubikeys work ([summary from Auth0](https://auth0.com/blog/amp/what-is-a-yubikey-and-how-to-set-it-up-with-auth0/))
- Register your Yubikey
    - First, you must authenticate using another method, like your email and password.
    - When you plug in your Yubikey and signal that you want to register a security key, the server you want to authenticate with sends a challenge and an AppID to the Yubikey.
    - When the Yubikey receives this information, you'll be prompted by the browser to tap the Yubikey to confirm the request.
    - Your Yubikey will generate a nonce and hash it together with the AppID and the secret key to create a private and public key.
    - The nonce and public key are sent back to the server to be stored so they can be used later when the user wants to authenticate.
- Authenticating with your Yubikey
    - The server remembers you had registered a Yubikey, so it generates a new challenge to send back along with the AppID and nonce created when you first registered your Yubikey.
    - The browser prompts you to tap the Yubikey, and the Yubikey will use the information received in step 1 to re-create the same key pair created when you registered your Yubikey.
    - If everything goes well, your Yubikey encrypts the challenge sent by the server with the private key and sends the challenge back.
    - The server decrypts the challenge using the public key it already has, and if the challenge matches the one the server sent, it means the user authentication was successful.

[Zapier - What is a Yubikey & how to set one up](https://zapier.com/blog/what-is-a-yubikey/)

How do organizations manage YubiKeys?
- [Rippling - Yubikey management](https://www.rippling.com/blog/introducing-rippling-yubikey-ordering)
- [Yubi Enterprise Delivery](https://www.yubico.com/products/yubienterprise-delivery/)


