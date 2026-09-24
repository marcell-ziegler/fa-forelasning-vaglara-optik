#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "@preview/lovelace:0.3.1": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import fletcher.shapes: circle, diamond, pill, rect
#import "@preview/zero:0.6.1": num, zi
#import "@preview/lilaq:0.6.0" as lq
#import "@preview/showybox:2.0.4": showybox


#let pseudocode-list = pseudocode-list.with(hooks: .5em, line-gap: .7em)

#let au-blå = rgb("#00205b")

#let degC = zi.declare($degree"C"$)

#let rule(color: luma(40%)) = {
  align(center, table(
    columns: 2,
    stroke: none,
    column-gutter: 5%,
    inset: 0pt,
    line(length: 100%, stroke: color + 1pt), line(length: 100%, stroke: color + 1pt),
  ))
}

#let sats-counter = counter(figure.where(kind: "sats"))
#let def-counter = counter(figure.where(kind: "def"))
#let exm-counter = counter(figure.where(kind: "exm"))

#let reset-theorem-counters(it) = {
  sats-counter.update(0)
  def-counter.update(0)
  exm-counter.update(0)
  it
}

#let theorem-numbering(n) = context numbering("1.1", counter(heading).get().first(), n)

#let theorem-box-style(color) = it => showybox(
  frame: (
    title-color: color.darken(10%),
    body-color: color.lighten(88%),
    border-color: color.darken(20%),
  ),
  title-style: (
    color: white,
    weight: "bold",
  ),
  title: [
    #it.supplement #it.counter.display(it.numbering)
    #if it.caption != none [--- #it.caption.body]
  ],
  it.body,
)

#let theorem-box(kind, default-title, body, title: none, label: none) = {
  let fig = figure(
    kind: kind,
    supplement: default-title,
    numbering: theorem-numbering,
    caption: title,
    body,
  )
  if label != none { [#fig#label] } else { fig }
}

#let sats = theorem-box.with("sats", "Sats")
#let def = theorem-box.with("def", "Definition")
#let exm = theorem-box.with("exm", "Exempel")

#let template(doc) = {
  show figure.caption: set text(size: 12pt, fill: luma(50%))
  show link: it => text(fill: blue, underline(it))

  show: codly-init.with()
  show raw.where(block: false): it => {
    set text(fill: purple.darken(30%))
    box(
      fill: luma(94%),
      inset: (x: 3pt, y: 0pt),
      outset: (y: 5pt),
      radius: 2pt,
      it,
    )
  }
  show raw.where(lang: "stdout"): it => {
    codly(number-format: none)
    it
    codly(number-format: numbering.with("1"))
  }

  set table(
    inset: 10pt,
    stroke: (x, y) => {
      if y == 1 {
        (top: 2pt + black)
      } else if y > 1 {
        (top: 1pt + black)
      }

      if x > 0 {
        (left: 1pt + black)
      }
    },
    fill: (x, y) => {
      if calc.odd(y) {
        luma(92%)
      } else {
        none
      }
    },
  )
  show table.header: strong

  set list(marker: ([#move(scale(text(fill: au-blå, sym.star.op), 150%), dy: -.15em)], [‣], [--]))

  show image: box.with(radius: 10pt, clip: true)

  set quote(block: true)
  show quote.where(block: true): it => {
    set align(center)
    block(width: 95%, { ["] + h(0pt, weak: true) + text(style: "italic", it.body) + h(0pt, weak: true) + ["] })
    if it.attribution != none {
      set align(right)
      set text(fill: luma(30%))
      [-- #it.attribution]
    }
  }

  set text(lang: "sv", size: 12pt)
  // set page("a5", margin: (y: 1.5cm, inside: 1.5cm / 1.5, outside: 1.5cm), numbering: "1.")

  set heading(numbering: "1.")

  set enum(numbering: "1.1.", full: true)

  show heading.where(depth: 1): set text(size: 20pt)
  show heading.where(depth: 1): set block(below: .8em)
  show heading.where(depth: 2): set text(size: 16pt)
  show heading.where(depth: 2): set block(below: .8em)
  show heading.where(level: 1): reset-theorem-counters

  show figure.where(kind: "sats"): theorem-box-style(blue)
  show figure.where(kind: "def"): theorem-box-style(rgb("#fed644"))
  show figure.where(kind: "exm"): theorem-box-style(green)

  [#doc]
}
