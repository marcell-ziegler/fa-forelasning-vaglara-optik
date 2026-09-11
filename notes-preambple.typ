#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#import "@preview/cetz:0.5.2"
#import "@preview/lovelace:0.3.1": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import fletcher.shapes: circle, diamond, pill, rect
#import "@preview/zero:0.6.1": num, zi
#import "@preview/lilaq:0.6.0" as lq



#let pseudocode-list = pseudocode-list.with(hooks: .5em, line-gap: .7em)

#let au-blå = rgb("#00205b")

#let degC = zi.declare($degree"C"$)

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

  set text(lang: "sv")
  [#doc]
}
