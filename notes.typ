#import "notes-preamble.typ": *
#show: template

#page(margin: 1.5cm, numbering: none)[
  #align(center)[
    #v(1fr)
    #text(size: 20pt)[
      *Stråloptik*
    ]\
    #v(-1mm)
    #text(size: 12pt)[
      En metaforisk surfing genom havet av universum
    ]
    #v(5mm)
    #image("prism.svg", width: 70%)
    #v(5mm)
    #text(size: 15pt)[
      _Marcell Ziegler_
    ]\
    #v(-1mm)
    #text(size: 12pt)[
      #datetime.today().display()\
      Fysik- och Astronomiläger 2026, Uppsala
    ]

    #image("logga2026.svg", height: 5.5cm)
    #v(1fr)
  ]
]

#outline()

#pagebreak(weak: true)

#counter(page).update(1)
#set page(numbering: "1.")

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

#def(title: [De trigonometriska funktionerna])[
  För vinklar $0 <= theta <= 90degree$ gäller för nedan triangel att
  $
    sin theta & = b / c \
    cos theta & = a / c \
    tan theta & = b / a.
  $
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

]

Det är även ibland intressant att ta reda på vad en given vinkel är, om du vet ex. sinus av vinkeln men inte själva vinkeln. Detta kan ju användas för att ta reda på spetsvinkeln för en triangel där alla sidor är kända. Vi använder då de inversa trigonometriska funktionerna.

#def(title: [Arcus sinus])[
  Den inversa funktionen av sinus kallas arcus sinus. Den kan skrivas på tre sätt:
  $
    arcsin quad equiv quad "asin" quad equiv quad sin^(-1).
  $

  Arcus sinus är definierat sådant att om du har en triangeln med spetsvinkel $theta$, motstående katet med längd $a$ och hypotenusa med längd $c$, gäller
  $
    arcsin (b / c) = theta.
  $
  Detta innebär i sin tur även att
  $
    arcsin (sin theta) = theta,
  $
  givet $sin theta = b / c$.

  För de andra funktionerna har vi på motsvarande sätt
  $
    arccos (a / c) = theta
  $
  och
  $
    arctan (a / b) = theta.
  $
  #rule(color: yellow.darken(10%).transparentize(50%))

  *OBS!* Denna definition är något förenklad och gäller endast i det exakta specialfall beskrivet i definitionen.
]

Namnet på den inversa sinusfunktionen uttalas oftast "ark-sin", för att inte behöva upprepa det fullständiga namnet. Ett sista viktigt samband är att
$
  sin^(-1) theta != 1 / (sin theta).
$
Om du skulle vilja uttryka högerledet skulle du skriva $(sin theta)^(-1)$. När du höjer upp själva funktionen till -1 menar du att det är funktionens _invers_ det är tal om, inte den bråkliga inverteringen av funktionen.

== Refraktion

_Refraktion_, i kontrast till ref#underline[lekt]tion, är när ljus bryts genom gränsen mellan två material i stället för att studsa tillbaka. Vid brytning av en partikelformad ljusstråle gäller _Snells lag_.

#sats(title: [Snells lag])[
  När en ljusstråle går från material 1 till material två förhåller sig dess in- respektive utfallsvinkel som
  $
    n_1 sin theta_1 = n_2 sin theta_2 quad <==> quad theta_2 = arcsin (n_1 / n_2 dot sin theta_1)
  $
  där $n_1,n_2$ är refraktivt index för första resp. andra materialet ljuset passerar, $theta_1$ är infallsvinkel och $theta_2$ är utfallsvinkel.
] <sats:snell>

För att förstå oss på dessa egenskaper kollar vi nu på ett illustrativt exempel.

#exm[
  Betrakta en ljusstråle som går från luft till glas. Luft har refraktivt index $n_"luft" approx 1$. Glas har $n_"glas" approx 1.52$. Vi betraktar nu ljusets väg:

  #align(center, cetz.canvas((
    {
      import cetz.draw: *
      scale(0.7)
      rect((0, 2), (2, -2), fill: blue.lighten(85%), stroke: none)
      line((0, 2), (rel: (0, -4)))
      set-style(stroke: orange + 2pt, fill: orange, mark: (end: "stealth"))
      line((-2, 1.5), (0, 0))
      line((), (2, -0.696))

      set-style(stroke: (paint: black, thickness: 1pt, dash: "dashed"), mark: none, fill: none)
      line((2, 0), (rel: (-4, 0)))
      set-style(stroke: (dash: none))
      arc((-1, 0), start: 180deg, delta: -calc.atan(1.5 / 2), radius: 1, name: "a")
      content((to: "a.mid", rel: (0, .06)), [$30degree$], anchor: "east", padding: .2)
      arc((1, 0), start: 0deg, delta: -calc.atan(.696 / 2), radius: 1, name: "a")
      content((to: "a.mid", rel: (0, -.1)), [$19.2degree$], anchor: "south-west", padding: (y: .3, x: -.3))

      content((-.7, 1.8), [$n_"luft"$])
      content((.7, 1.8), [$n_"glas"$])
    }
  )))

  Vi vet från formeln innan att
  $
    theta_2 = arcsin (n_1 / n_2 dot sin theta_1) = arcsin (1 / 1.52 dot sin 30degree) approx 19.2 degree.
  $
]

=== Totalreflektion

De klyftigaste av er har kanske insett att om $n_1 > n_2$ i @sats:snell så kommer ekvationen sakna lösning för vissa infallsvinklar $theta_1$. I de fall en lösning saknas kommer s.k. _totalreflektion_ att ske. Det innebär att ljuset studsar tillbaka från ytan i stället för att passera till det nya mediet. Detta beter sig likt vanlig reflektion och då gäller att $theta_"in" = theta_"ut"$.

== Linser

Nästa aspekt av stråloptiken är linser. Vi har nu konstaterat att ljus ändrar riktning när det passerar gränsen mellan två genomskinliga medier. Vi konstaterade även att ljusets nya vinkel beror enbart på materialet och vilket håll det flyger in från. Detta innebär att vi kan konstruera apparater för att rikta ljuset åt det håll vi vill att det skall färdas.

Dessa apparater kallas _linser_ och konstrueras som välvda ytor av diverse genomskinliga material, dock oftast av glas. Det finns två typer av lins: konkav och konvex. En konkav lins buktar utåt, en konvex lins buktar inåt.

#figure(
  caption: [Det vå typerna av linser.],
  kind: image,
  table(
    columns: 2,
    column-gutter: 3cm,
    stroke: none,
    cetz.canvas({
      import cetz.draw: *
      line((-.2, 0), (.2, 0))
      let angle = 35deg
      arc((-.2, 0), start: -angle / 2, delta: angle, radius: 3)
      line((), (rel: (.4, 0)))
      arc((), stop: angle / 2, delta: angle, radius: -3)

      content((0, -.5), [Konkav])
    }),
    cetz.canvas({
      import cetz.draw: *
      line((-.2, 0), (.2, 0))
      let angle = 55deg
      arc((-.2, 0), stop: -angle / 2, delta: -angle, radius: -2)
      line((), (rel: (.4, 0)))
      arc((), start: angle / 2, delta: -angle, radius: 2)

      content((0, -.5), [Konvex])
    }),
  ),
)

== Avbildning

Med hjälp av linser kan vi skapa _bilder_ av _objekt_ som finns i världen. Denna process kallas för _avbildning_. Objektet är det som avbildas, och bilden är den skepnad som skapas.

Grundprincipen för avbildningar är att för varje punkt på ett objekt, kan man följa en ljusstråle som passerar genom avbildningssystemet (lins(erna)) och beräkna vart den landar på bilden. Om vi upprepar processen för varenda punkt på vårt objekt kan vi beräkna exakt hur bilden kommer att se ut.

Betrakta nu ett objekt som avbildas genom en lins som vi betraktar som _tunn_, sett till det sammanlagda bild- och objektsavståndet.


#figure(caption: [En avbildning genom konvex lins], cetz.canvas({
  import cetz.draw: *
  line((-6, 0), (6, 0))
  let angle = 30deg
  let r = 3
  let offset = 2.6
  arc(
    (-r * calc.cos(angle) + offset, r * calc.sin(angle)),
    radius: r,
    start: 180deg - angle,
    delta: 2 * angle,
    name: "a1",
  )
  arc((r * calc.cos(angle) - offset, -r * calc.sin(angle)), radius: r, start: -angle, delta: 2 * angle, name: "a2")

  line((-5, 0), "a1.20%", "a2.80%", (5, 0), stroke: orange)
  content((0, .4), [$d$])
  content((0, -.4), [$n$])
  content((-.5, 1.3), [$r_1$])
  content((.6, 1.3), [$r_2$])
  cetz.decorations.brace((-5, -1), "a1.84%", flip: true, name: "b1")
  content("b1.content", [$s$])
  cetz.decorations.brace((5, -1), "a2.17%", flip: false, name: "b1")
  content("b1.content", [$s'$])
  circle((-5, 0), fill: orange, stroke: orange, radius: .1)
  content((), [Objekt], anchor: "north", padding: .2)
  circle((5, 0), fill: orange, stroke: orange, radius: .1)
  content((), [Bild], anchor: "north", padding: .2)
})) <fig:tunn-lins>

I @fig:tunn-lins ser vi objektsavståndet $s$, bildavståndet $s'$ (läs "s-prim") samt linsens refraktiva index $n$ och diameter $d$ och slutligen linsytornas krökningsradier, $r_1,r_2$.

För att förenkla matematiken antar vi att alla linser har en sfärisk gränsyta. Vi utgår även från att vinklarna $theta$ vi betraktar är relativt små#footnote(numbering: "*")[Försök övertyga dig själv om varför detta är fallet. Med små $theta$ menas oftast $theta lt.tilde 10#(sym.dash.en)20 degree$.] , vilket betyder att _paraxialapproximationen_,
$
  sin theta approx theta,
$
gäller. En traditionell lins har två välvda gränsytor, som vi antar är sfäriska. Vi börjar med att undersöka brytningen genom en sfärisk gränsyta.

#sats(title: [Avbildning genom  sfärisk gränsyta])[
  Förhållandet melland objektsavståndet $s$, bildavståndet $s'$ och omgivningens resp. linsens refraktiva index $n,n'$ blir
  $
    n / s + n' / s' = (n' - n) / r_"lins" = P,
  $
  där $r_"lins"$ är linsytans radie och $P$ kallas _brytningsstyrkan_ och mäts i dioptrier [D]. $r_"lins" > 0$ om ytan buktar mot ljuset och $r_"lins" < 0$ om denna buktar med ljuset.
] <sats:sfärisk-gräns>

Du har säkert hört ordet "dioptri" kring glasögon innan. Det är exakt samma sak.

En list har dock som sagt två stycken gränsytor. Därför kan vi konstatera att den sammansatta brytstyrkan av två linser blir
$
  P_"tot" = P_1 + P_2.
$
Vidare, för en sådan lins i luft med $n_"luft" approx 1$ gäller att
$
  P_"tot" = P = (n - 1) / r_1 + (1 - n) / r_2 = (n-1)(1 / r_1 - 1 / r_2)
$
för linsytor med radier $r_1,r_2$. Här kan man råka anta att $r_1 = r_2$ och därför $P = 0$. Så är dock inte fallet, vilket tydliggörs i @sats:sfärisk-gräns.

Om vi använder den andra formeln från @sats:sfärisk-gräns får vi att
$
  P = 1 / s + n / s'_1 + n / s_2 + 1 / s'.
$
Vi kan förenkla detta genom att inse att $s_2 = -s'_1$ ty linsytorna befinner sig nära varandra då linsen är tunn och minustecken är för att ljuset ännu inte passerat yta 2. Detta leder oss till nästa sats.

#sats(title: [Alternativ formel för brytningsstyrka])[
  $
    P = 1 / s + 1 / s'
  $
  #rule(color: blue.darken(40%).transparentize(50%))
  _*Bevis:*_ Insättning av $s_2 = -s'_1$ i den tidigare givna ekvationen ger oss
  $
    1 / s + n / s'_1 - n / s'_2 + 1 / s' = 1 / s + 1 / s'.
  $
]

Vi går nu vidare till en sista definition för linser: fokallängden.

#def(title: [Fokallängd])[
  Fokallängden $f$ av en lins definieras
  $
    1 / f = lim_(s -> infinity) 1 / s + 1 / s' = 1 / s'
  $
  vilket ju innebär $f = s' = P^(- 1)$.
] <def:fokallängd>

@def:fokallängd innebär att fokallängden är definierad som det bildavstånd som uppstår för en given lins när ljusstrålarna åker in från oändligt långt borta.

=== Objekt i oändligheten

För kameror och andra föremål där objektsavståndet är mycket större än fokallängden kan vi betrakta det som "långt" och därmed $ s' approx f, $ oavsett objektsavstånd. Vi kan också härleda att
$
  tan alpha = h' / f quad <==> quad h' = f tan alpha,
$
där $alpha$ är vinkeln (de parallella) ljusstrålarna gör mot den optiska axeln.

=== Konkava linser

En konkav lins har både negativ krökningsradie och negativ fokallängd. Detta innebär att även bildavståndet är negativt. Det är för att den sprider ljuset som kommer in i stället för att samla det. Vi kallar detta att bilden _virtuell_ och vad det innebär beskrivs senare.

== Bildkonstruktion

För att kunna konstruera bilder introducerar vi en förenklad teckningsstil för linser.
#figure(
  caption: [Förenklad linsnontation],
  kind: image,
  table(
    columns: 2,
    stroke: none,
    column-gutter: 3cm,
    cetz.canvas({
      import cetz.draw: *
      line((), (0, 2), mark: (symbol: "straight", reverse: false))
      content((0, -.5), [Konvex])
    }),
    cetz.canvas({
      import cetz.draw: *
      line((), (0, 2), mark: (symbol: "straight", reverse: true))
      content((0, -.5), [Konkav])
    }),
  ),
)

Med detta i vår arsenal kollar vi på ett illustrativt exempel.

#exm(title: [Bildkonstruktion med reell bild])[
  #align(center, cetz.canvas({
    import cetz.draw: *
    line((-5, 0), (5, 0), stroke: (dash: "dashed"))
    line((0, -2), (0, 2), mark: (symbol: "straight"))
    content((0, 2.5), $f = zi.cm(1.2)$)

    let M = -2 / 3
    let s = 3
    let sp = -M * s
    let a = (-s, 1.5)
    let b = (sp, -1)

    line((a.at(0), 0), a, mark: (end: "straight"), name: "obj")
    content("obj.mid", $h$, anchor: "east", padding: .2)
    content((a.at(0), 0), [Objekt], anchor: "north", padding: .2)
    line((b.at(0), 0), b, mark: (end: "straight"), name: "img")
    content("img.mid", $h'$, anchor: "west", padding: .2)
    content((b.at(0), 0), [Bild], anchor: "south", padding: .2)

    set-style(stroke: orange)
    line(a, (0, a.at(1)), b, name: "line")
    mark("line.25%", "line.26%", symbol: "straight")
    mark("line.75%", "line.76%", symbol: "straight")
    set-style(stroke: red)
    line(a, b, name: "line")
    mark("line.25%", "line.26%", symbol: "straight")
    mark("line.75%", "line.76%", symbol: "straight")
    set-style(stroke: blue)
    line(a, (0, b.at(1)), b, name: "line")
    mark("line.25%", "line.26%", symbol: "straight")
    mark("line.75%", "line.76%", symbol: "straight")

    content((1.2, 0.1), text(fill: red, stroke: black + 0.5pt, size: 30pt, sym.star))
    content((-1.2, 0.1), text(fill: red, stroke: black + 0.5pt, size: 30pt, sym.star))
  }))

  Betrakta en punkt vid pilspetsen av objektet. Ljus från den punkten följer de utritade strålarna, genom den utritade konvexa linsen och samlas åter på en punkt på bilden. Punkterna märkta med #text(fill: red, stroke: black + 0.5pt, size: 2em, baseline: 2pt, sym.star) är avståndet $z zi.cm()$ från linsen och kallas _brännpunkter_. Punkten på objektet har höjd $h$ över den optiska axeln, och motsv. pkt. på bilden har höjden $h' < 0$.

  Givet att objektavståndet är $s = zi.cm(3)$ kan vi räkna ut att bildavståndet måste vara $s' = -M dot s = zi.cm(#(2 / 3 * 3))$ där $M = h' / h = -1 / 1.5 = - 2 / 3$ är förstoringen.
]

Av detta exempel framgår en mycket viktig sats.
#sats(title: [Förstoringsformeln])[
  Förstoringen
  $
    M = h' / h = - s' / s
  $
  där samtliga $h,h',s,s'$ har tecken beroende på sida av optiska axeln resp. linsen de är. $h > 0$ om den är över optiska axeln. $s > 0$ om den är innan linsen, $s' > 0$ om den är _efter_ linsen.
]

Detta exempel visar alltså konvex lins med en _reell bild_, dvs. en sådan där strålarna samlar sig efter linsen. Hade du haft en skärm och placerat den vid bilden hade du kunna se bilden, därmed reell. Bilden är också upp och ned vilket alltid gäller för reella bilder.

Konstruktionsprocessen består av fem steg för reella bilder:
+ Rita ut höjden av startpunkten (objektet _eller_ bilden).
+ Dra en horisontell linje från startpunkten till linsen.
  + Från där linjen träffar linsen, dra en linje genom brännpunkten på andra sidan linsen.
+ Dra en linje från startpunkten, genom närmsta brännpunkten, till linsytan.
  + Från träffpunkten, dra en horisontell linjer som fortsättning.
+ Dra en linje från startpunkten genom mitten av linsen.
+ Slutpunkten, bilden om du började från objektet och vice versa, är där strålarna på andra sidan, så rita ut även denna.

På detta sätt kan du konstruera alla reella bilder från en konvex lins. Om du har objektet på ett objektsavstånd $s < f$ kommer du i stället att få en _virtuell_ bild. Det betyder att strålarna divergerar på andra sidan linsen. Om du koller på dessa verkar de komma från en punkt bakom linsen, som är annorlunda från den punkt de egentligen kommer från.

#exm(title: [Konvex lins med virtuellt objekt])[
  #align(center, cetz.canvas({
    import cetz.draw: *

    scale(x: 2)

    line((-2.5, 0), (2.5, 0), stroke: (dash: "dashed"))
    line((0, -2), (0, 2), mark: (symbol: "straight"))
    content((0, 2.5), $f = zi.cm(1.2)$)

    let f = 1.2
    let s = 0.8
    let sp = -2.4
    let M = 3
    let h = 0.6
    let a = (-s, h)
    let b = (sp, M * h)

    line((a.at(0), 0), a, mark: (end: "straight"), name: "obj")
    content("obj.mid", $h$, anchor: "west", padding: .2)
    content((a.at(0), 0), [Objekt], anchor: "north", padding: .2)

    line((b.at(0), 0), b, mark: (end: "straight"), name: "img", stroke: (dash: "dashed"))
    content("img.mid", $h'$, anchor: "west", padding: .2)
    content((b.at(0), 0), [Bild (virtuell)], anchor: "north", padding: .2)

    // ray through the lens centre — fully real, straight through
    set-style(stroke: red)
    line(a, (0, 0), (1.5, -1.125), name: "ray-c")
    mark("ray-c.20%", "ray-c.21%", symbol: "straight")
    mark("ray-c.60%", "ray-c.61%", symbol: "straight")
    line(a, b, stroke: (paint: red, dash: "dashed"))

    // parallel ray -> refracts along the line through the far focal point
    set-style(stroke: orange)
    line(a, (0, h), (1.8, -0.3), name: "ray-p")
    mark("ray-p.20%", "ray-p.21%", symbol: "straight")
    mark("ray-p.60%", "ray-p.61%", symbol: "straight")
    line((0, h), b, stroke: (paint: orange, dash: "dashed"))

    // aimed at the near focal point -> emerges parallel to the axis
    set-style(stroke: blue)
    line((-f, 0), a, stroke: (paint: blue, dash: "dashed"))
    line(a, (0, M * h), (1.5, M * h), name: "ray-f")
    mark("ray-f.60%", "ray-f.61%", symbol: "straight")
    line((0, M * h), b, stroke: (paint: blue, dash: "dashed"))

    content((f, 0.1), text(fill: red, stroke: black + 0.5pt, size: 30pt, sym.star))
    content((-f, 0.1), text(fill: red, stroke: black + 0.5pt, size: 30pt, sym.star))
  }))
]

Här får vi en liknande lösningsföljd:
+ Rita en stråle horisontellt från objektet till linsen.
  + Rita en linje från träffpunkten genom brännpunkten.
+ Rita an linje från objektet genom mitten av linsen.
+ Rita en linje från objektet, vars förläning bakåt passerar brännpunkten, till linsytan.
  + Fortsätt denna linje horisontellt.
+ Rita in förlängningarna av de sista segmenten av varje stråle.
+ Rita in bilden där dessa förlängningar möts.

Om du vill konstruera ett objekt från en given virtuell bild gör du i stället omvänt:
+ Rita en linje från bilden genom linsens mitt.
+ Rita en linje horisontellt från bilden genom linsen.
  + Rita en linje genom brännpunkten på bildsidan som börjar från träffpunkten.
+ Rita en linje från bilden genom bortre brännpunkten.
  + Rita en horisontell linje mot bilden från där denna stråle passerar linsen.
+ Rita in objektet där strålarna möts på bildsidan.

Slutligen så skall vi betrakta konkava linser. Dessa har ju negativa fokallängder och kommer sprida ljus som passerar genom dem.

#exm[
  #align(center, cetz.canvas({
    import cetz.draw: *

    scale(x: 3)

    line((-2.5, 0), (2.5, 0), stroke: (dash: "dashed"))
    line((0, -2), (0, 2), mark: (symbol: "straight", reverse: true))
    content((0, 2.5), $f = -zi.cm(1.2)$)

    let f = 1.2
    let s = 2
    let sp = -0.75
    let M = 0.375
    let h = 1.5
    let a = (-s, h)
    let b = (sp, M * h)

    line((a.at(0), 0), a, mark: (end: "straight"), name: "obj")
    content("obj.mid", $h$, anchor: "east", padding: .2)
    content((a.at(0), 0), [Objekt], anchor: "north", padding: .2)

    line((b.at(0), 0), b, mark: (end: "straight"), name: "img", stroke: (dash: "dashed"))
    content("img.mid", $h'$, anchor: "west", padding: .2)
    content((b.at(0), 0), [Bild (virtuell)], anchor: "north", padding: .2)

    // ray through the lens centre — fully real, straight through
    set-style(stroke: red)
    line(a, a.map(x => -x), name: "ray-c")
    mark("ray-c.20%", "ray-c.21%", symbol: "straight")
    mark("ray-c.75%", "ray-c.76%", symbol: "straight")

    // parallel ray -> diverges as if from the near-side focal point
    set-style(stroke: orange)
    line(a, (0, h), (.8, .8 * (h / f) + h), name: "ray-p")
    mark("ray-p.20%", "ray-p.21%", symbol: "straight")
    mark("ray-p.75%", "ray-p.76%", symbol: "straight")
    line((0, h), (-f, 0), stroke: (paint: orange, dash: "dashed"))

    // aimed at the far focal point -> emerges parallel to the axis
    set-style(stroke: blue)
    line(a, (0, M * h), (1.5, M * h), name: "ray-f")
    line((0, M * h), (f, 0), stroke: (dash: "dashed"))
    mark("ray-f.75%", "ray-f.76%", symbol: "straight")
    line((0, M * h), b, stroke: (paint: blue, dash: "dashed"))

    content((f, 0.1), text(fill: red, stroke: black + 0.5pt, size: 30pt, sym.star))
    content((-f, 0.1), text(fill: red, stroke: black + 0.5pt, size: 30pt, sym.star))
  }))
]

Konkava linser kommer _alltid_ att ge en virtuell bild oavsett vad du gör. För att konstruera denna bild:
+ Rita en linje från objektet genom mitten av linsen.
+ Rita en linje från objektet till bortre brännpunkten.
  + Fortsätt denna linje horisontellt där den träffar linsen, och förläng sedan den mot objektsidan, fortfarande horisontellt.
+ Rita en linje horisontellt från objektet till linsen.
  + Rita en linje från träffpunkten till brännpunkten på objektsidan.
+ Rita ut bilden där trålarna möts.

För att konstruera objektet från bilden använder vi en liknande följd:
+ Rita en linje från bilden horisontellt till linsen.
  + Förläng denna bakåt så att den ligger på samma linje som bortre brännpunten.
+ Rita en linje från bilden genom linsens mitt.
  + Förläng denna linje parallellt bakåt.
+ Rita en linje från brännpunkten, genom bilden, till linsen.
  + Förläng denna horisontellt bakåt.
+ Där linjerna möts ritar du sist in objektet.

Den sista typen av konstruktion har att göra med s.k. virtuella objekt. Dessa lämnas åt läsaren att lista ut.

== System av linser

När vi med system av linser att göra är det bara att räkna ut bildpositionen för varje lins i sekvensen för sig. Då kan vi med fördel använda sambandet
$
  1 / f = 1 / s + 1 / s' quad <==> quad s' = (s f) / (s - f).
$

För objekt i oändligheten används sambandet att
$
  h_1 = f_1 tan alpha,
$
med $h_1,f_1$ som bildhöjd resp. fokallängd för lins 1. För vidare linser i systemet används förstoringsformeln
$
  h_2 = h_1 M_2 = -h_1 (s_2 / s'_2).
$
Med hjälp av formeln från innan kan vi få ned detta till
$
  h_2 = underbrace(f_2 / (f_2 - s_2) dot f_1, f_e) tan alpha,
$
med
$
  M_2 = - f_2 / (s_2 - f_2)
$
och $h_1 = f_1 tan alpha$.

Vi inför begreppek ekvivalent fokallängd
$
  f_e = (f_1 f_2) / (f_2 - s_2) = ( f_1 f_2 ) / (f_1 + f_2 - d)
$
med $f-2 - s_2 = f_1 + f_2 - d$ där $d$ är avståndet mellan linserna. Detta framgår av geometrin.

