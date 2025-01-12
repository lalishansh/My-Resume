#let configuration = yaml("configuration.yaml")
#let settings = yaml("settings.yaml")

#let letterHeaderNameStyle(str) = {text(
    fill: rgb("#800020"), // burgundy
    weight: "bold",
    str
)}

#let letterHeaderAddressStyle(str) = {text(
    fill: rgb("#78787e"), // textColors.mediumGray,
    size: 0.9em,
    smallcaps(str)
)}

#let letterDateStyle(str) = {text(
    size: 0.9em,
    style: "italic",
    str
)}

#let letterSubjectStyle(str) = {text(
    fill: rgb("#800020"), // burgundy
    weight: "bold",
    underline(str)
)}

#let letterHeader(
    name: "Your Name Here",
    address: "Your Address Here",
    recipient_name: "Recipient Name Here",
    recipient_address: "Recipient Address Here",
    date: "Today's Date",
    subject: "Subject: Hey!"
) = {
    letterHeaderNameStyle(name)
    v(1pt)
    letterHeaderAddressStyle(address)
    v(1pt)
    align(right, letterHeaderNameStyle(recipient_name))
    v(1pt)
    align(right, letterHeaderAddressStyle(recipient_address))
    v(1pt)
    letterDateStyle(date)
    v(1pt)
    letterSubjectStyle(subject)
    linebreak(); linebreak()
}

#let letterSignature(name) = {
  linebreak()
  align(right, text(font: "Segoe Print", configuration.contacts.name))
}

#set page(
    paper: "a4",
    margin: (
        left: 1.2cm,
        right: 1.2cm,
        top: 1.2cm,
        bottom: 1.2cm,
    ),
)

#letterHeader(
    name: configuration.contacts.name,
    address: configuration.contacts.address,
    recipient_name: [ABC Company],
    recipient_address: [32 Rue Michel Ange \ 75011 Paris, France],
    date: [March 2, 2024],
    subject: configuration.cover-letter.subject
)

Dear Hiring Manager,

#configuration.cover-letter.body

Thank you for considering my application. I look forward to the opportunity to discuss my qualifications further.

Sincerely,

#letterSignature(configuration.contacts.name)