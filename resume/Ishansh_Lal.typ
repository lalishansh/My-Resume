#import "@preview/cmarker:0.1.1"
#let src = yaml("configuration.yaml")

#show link: set text(blue)
#set page(margin: (x: 1.5cm, y: 1.8cm))
#set text(
  // Default
  fill: black,
  font: "Cambria", 
  size: 9pt, 
  style: "normal",
)

#let headlineSection = {[
  #place(top + right, dx: 3cm, dy: -10pt,
    figure(box(image("../me-cropped.jpeg", fit: "cover", width: 2cm, height: 2cm), radius: 50%, clip: true)),
  )
  #text(20pt)[#smallcaps(src.contacts.name)] \ \
  #text(16pt)[#src.contacts.title]
]}

#let contactSection = {[
  #par(justify: true)[
    #let contacts = src.contacts

    #grid(
      columns: (auto, auto),
      gutter: 0.5em,
      align: (end, start),
      "Email:", link("mailto:" + contacts.email),
      "Phone:", link("tel:" + contacts.phone),
      ..for other in contacts.others {
        (other.name + ":", link("https://" + other.link)[#other.link])
      }
    )
    #line(length: 100%)
  ]
]}

#let sidebarSection = {par(justify: true)[
  #let sections = src.resume.sidebar
  #for section in sections {
    text(12pt, weight: "bold")[#section.title]
    linebreak()
    cmarker.render(raw-typst: true, section.body)
  }
]}

#let mainSection = {par(justify: true)[
  #let sections = src.resume.main
  #for section in sections {
    text(12pt, weight: "bold")[#section.title]
    linebreak()
    cmarker.render(raw-typst: true, section.body)
  }
]}

#set rect(stroke: white)
#{
  grid(
    columns: (1fr, 2fr),
    column-gutter: 2em,
    rect[#contactSection], rect[#headlineSection],
    rect[#sidebarSection], rect[#mainSection]
  )
}