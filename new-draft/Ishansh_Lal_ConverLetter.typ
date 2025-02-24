#import "@preview/cmarker:0.1.1"
#let src = yaml("configuration.yaml")
#let dst = yaml("applying-to.yaml")

#let name(str) = {text(
    fill: rgb("#800020"), // burgundy
    weight: "bold",
    smallcaps(str)
)}

#let address(str) = {text(
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

#let signature(name) = {
  text(font: "Rockybilly", src.contacts.name)
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

#{
    name(src.contacts.name)
    v(1pt)
    address(src.contacts.address)
    v(1pt)
    align(right, name(dst.company))
    v(1pt)
    align(right, address(dst.location))
    v(1pt)
    letterDateStyle(datetime.today().display("[month repr:long] [day], [year]"))
    v(1pt)
    letterSubjectStyle(src.cover-letter.subject_prefix + " " + dst.role)
    linebreak(); linebreak()
}

#dst.greeting,

#cmarker.render(raw-typst: true, src.cover-letter.body, scope: (company:() => dst.company))

Sincerely,

#linebreak()
#align(right, signature(src.contacts.name))