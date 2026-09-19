#import "notes-preamble.typ": *
#show: template

#page[
  #align(center)[
    #v(1fr)
    #text(size: 20pt)[
      *Våglära & Optik*
    ]\
    #v(-1mm)
    #text(size: 12pt)[
      En metaforisk surfing genom havet av universum
    ]
    #v(5mm)
    #image("cover.png", width: 70%)
    #v(5mm)
    #text(size: 15pt)[
      _Marcell Ziegler_
    ]\
    #v(-1mm)
    #text(size: 12pt)[
      #datetime.today().display()\
      Fysik- och Astronomiläger 2026, Uppsala
    ]
    #v(1fr)
  ]
]

= Ljus

Ni har nog hört en del definitioner av ljus; det kanske är en våg, kanske en partikel, kanske båda. Vi kommer dock börja betrakta ljuset som en partikel med en konstant hastighet $c$ _i vakuum_.

Ljus har också egenskapen att den färdas med olika hastigheter i olika medium. Ju "tjockare" ljuset upplever mediet desto långsammare färdas det. Förhållandet mellan hastigheter i olika medium ges av _refraktionsindex_.

#def(title: [Refraktionsindex])[
  Refraktionsindex $n$ för ett material är
  $
    n = c / v,
  $
  där $c$ är ljusets hastighet i vakuum och $v$ är ljusets hastighet i det relevanta mediet.
]

Detta kommer att vara ett viktigt samband framöver, då ljusets brytning och reflektion genom medium avgörs av dess hastighetsskillnad vid in- respektive utgång genom materialet.

= Stråloptik

Ordet _stråloptik_ innebär att vi betraktar ljuste som en rak stråle som färdas genom rummet tills det träffar någonting. När den väl träffar någonting så kännetecknas kontakten av två interkationsformer:

+ *Reflektion:* Infallsvinkeln är lika med utfallsvinkeln,
  $ theta_i = theta_u, $
  och
  #align(center, figure(caption: [Ljus reflekteras], cetz.canvas((
    {
      import cetz.draw: *
      line((0, 2), (rel: (0, -4)))
      set-style(stroke: orange + 2pt, fill: orange, mark: (end: "stealth"))
      line((-2, 1.5), (0, 0))
      line((), (-2, -1.5))

      set-style(stroke: (paint: black, thickness: 1pt, dash: "dashed"), mark: none, fill: none)
      line((0, 0), (rel: (-2, 0)))
      set-style(stroke: (dash: none))
      arc((-1, 0), start: 180deg, delta: -calc.atan(1.5 / 2), radius: 1, name: "a")
      content((to: "a.mid", rel: (0, .06)), [$theta_i$], anchor: "east", padding: .2)
      arc((-1, 0), start: 180deg, delta: calc.atan(1.5 / 2), radius: 1, name: "a")
      content((to: "a.mid", rel: (0, -.1)), [$theta_u$], anchor: "east", padding: .2)
    }
  ))))
+ *Refraktion:* Förhållandet mellan infalls- och utfallsvinkel vid brytning är
  $ n_i sin theta_i = n_u sin theta_u, $
  där $n_i, theta_i$ är refraktionsindex respektive och vinkel för infallande ljusstråle och $n_u, theta_u$ är motsvarande för utfallande ljusstråle.
  #align(center, figure(caption: [Ljus refrakteras (bryts).], cetz.canvas((
    {
      import cetz.draw: *
      line((0, 2), (rel: (0, -4)))
      set-style(stroke: orange + 2pt, fill: orange, mark: (end: "stealth"))
      line((-2, 1.5), (0, 0))
      line((), (2, -.8))

      set-style(stroke: (paint: black, thickness: 1pt, dash: "dashed"), mark: none, fill: none)
      line((2, 0), (rel: (-4, 0)))
      set-style(stroke: (dash: none))
      arc((-1, 0), start: 180deg, delta: -calc.atan(1.5 / 2), radius: 1, name: "a")
      content((to: "a.mid", rel: (0, .06)), [$theta_i$], anchor: "east", padding: .2)
      arc((1, 0), start: 0deg, delta: -calc.atan(.8 / 2), radius: 1, name: "a")
      content((to: "a.mid", rel: (0, -.1)), [$theta_u$], anchor: "west", padding: .2)

      content((-.5, 1.8), [$n_i$])
      content((.5, 1.8), [$n_u$])
    }
  ))))

Med hjälp av dessa två karakteristiska interaktioner kan vi fullständigt modellera ljusets färd. Så länge det betraktas som en partikel...

== Repetition av trigonometri

För er som kanske inte sett funktionen sinus ($sin$), så kommer en kort repetition.

#def(title: [Sinusfunktionen])[
  För vinklar $0 <= theta <= 90degree$ gäller att $sin theta$ (läs "sinus av theta") är längden av motstående katet delat på längden av hypotenusan av en rätvinklig triangel med spetsvinkel $theta$.

  #figure(
    cetz.canvas({
      import cetz.draw: *
      line((), (rel: (4, 0)), name: "a")
      line((), (rel: (0, 2.5)), name: "b")
      line((), (0, 0), name: "c")
      arc((), anchor: "origin", start: 0deg, delta: 32deg, radius: 1.5, name: "d")
      content("d.60%", $theta$, anchor: "west", padding: .2)
      content("a", $a$, anchor: "north")
      content("b", $b$, anchor: "west", padding: .1)
      content("c", $c$, anchor: "south-east", padding: .1)
    }),
  )

  På ovan triangel innebär detta att
  $
    sin theta = b / c.
  $
]


= Vågor

Man kan i lösa termer beskriva en våg som en förflyttning av ett, eller fler, "klumpar" genom ett medium. Exempel på vågor är de man ser på vatten, de som skapas när ett stränginstrument spelas eller ljuset i dina ögon.

Vågor definieras av tre huvudsakliga egenskaper: våglängd, frekvens och fasförskjutning. Vi börjar med det förstnämnda.

#def(title: "Våglängd")[
  Våglängden $lambda$ av en våg är avståndet mellan två punkter där vågmönstret upprepar sig.
]



#exm[
  Betrakta detta vågmönster på en tänkt vattenyta:
  #align(center, cetz.canvas({
    cetz.draw.scale(0.7)
    plot.plot(
      size: (12, 3),
      axis-style: "school-book",
      x-tick-step: none,
      y-tick-step: none,
      x-label: [Avstånd, $s$ ],
      y-label: [Höjd, $h$],
      {
        plot.add(domain: (0, calc.pi * 4), x => { -calc.sin(x) + 0.02 * calc.sin(25 * x) }, samples: 1000)
      },
    )
    import cetz.draw: *
    cetz.decorations.brace((0, -.2), (3, -.2), flip: true, name: "a")
    content("a", $lambda slash 2$, anchor: "north", padding: .4)
    cetz.decorations.brace((0, -1.2), (6, -1.2), flip: true, name: "a")
    content("a", $lambda$, anchor: "north", padding: .4)
    cetz.decorations.brace((0, -2.2), (12, -2.2), flip: true, name: "a")
    content("a", $2 lambda$, anchor: "north", padding: .4)
  }))

  Vågmönstret upprepar sig helt varje $lambda$ längs $x$-axeln.
] <sin-exm>

Det viktiga att tänka på här att upprepning innebär inte bara att det skall matcha i värde, utan också form. Vågen i @sin-exm är en s.k. _sinusvåg_ och upprepar sig en gång för varje topp _och_ dal. Den heter så eftersom dess kontur följer formen av funktionen $f(x) = sin(x)$.

Nära besläktat med våglängden är _frekvensen_, den anger hur ofta ett vågmönster upprepar sig när det propagerar genom rymden.

#def(title: [Frekvens])[
  Frekvensen $f$ är antalet våglängder som passerar en punkt per enhet tid.
  #align(center, line(length: 90%, stroke: yellow.darken(50%)))
  Frekvensen mäts i enheten #zi.Hz() som är detsamma som $zi.s()^(-1)$.
] <def:freq>

Det sista som vi måste förstå för att definiera hela vågens egenskaper är att vågor rör sig i både rum och tid. Tänk på ringarna på vattnet när du släpper ned någonting där. Du kan därifrån tänka dig att en viss punkt på vågen rör sig utåt från nedslagspunkten i mitten av vågmönstret.

Den punkten svänger då ett visst antal gånger per sekund, och passerar en viss sträcka per svängning. Dess frekvens respektive våglängd. Detta leder oss till vågekvationen.

#sats(title: [Vågekvationen])[
  Hastigheten av en våg, $v$ [$zi.m() / zi.s()$], ges av följande ekvation:

  $
    v = lambda f.
  $

  Vågen passerar alltså $lambda zi.m()$, $f$ gånger per sekund. Detta ger hastigheten av vågen i rummet.
]

