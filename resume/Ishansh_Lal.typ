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
    #box(grid(
      columns: (auto, auto),
      gutter: 0.5em,
      align: (end, start),
      "Email:", link("mailto:" + contacts.email),
      "Phone:", link("tel:" + contacts.phone),
      ..for other in contacts.others {
        (other.name + ":", link("https://" + other.link)[#other.link])
      }
    ))
    #box(line(length: 100%))
  ]
]}

#let sidebarSection = {par(justify: true)[
  #let sections = src.resume.sidebar
  #for section in sections {
    linebreak()
    text(12pt, weight: "bold")[#section.title]
    box(v(15pt))
    linebreak()
    box(cmarker.render(raw-typst: true, section.body))
  }
]}

#let mainSection = {par(justify: true)[
  #let sections = src.resume.main
  #for section in sections {
    linebreak()
    text(12pt, weight: "bold")[#section.title]
    box(v(15pt))
    linebreak()
    box(cmarker.render(raw-typst: true, section.body))
  }
]}

#set rect(stroke: none)
#{
  grid(
    columns: (1fr, 2fr),
    column-gutter: 2em,
    row-gutter: -15pt,
    rect[#contactSection], rect[#headlineSection],
    rect[#sidebarSection], rect[#mainSection]
  )
}
