#import "notes-preamble.typ": *

#show: template

#let show_facit = true
#let right_side_up = false

#let facit(body) = {
  if (show_facit) {
    set text(fill: luma(70%))
    rotate(if (right_side_up) { 0deg } else { 180deg })[
      #if (right_side_up) { rule(color: luma(85%)) }
      #body
      #if (not right_side_up) { rule() }
    ]
  }
}

#set enum(numbering: "a)")



#text(size: 24pt, weight: "bold")[Formelsamling i stråloptik]

#let fs-rubrik(body) = block(above: 1.2em, below: .6em, text(weight: "bold", size: 13pt, body))

#columns(2, gutter: 8mm)[
  #fs-rubrik[Ljus och refraktionsindex]
  $
    n = c / v, quad c approx 3.00 dot 10^8 "m/s"
  $
  där $v$ är ljusets hastighet i mediet. Alltid $n >= 1$.

  #fs-rubrik[Reflektion]
  $
    theta_i = theta_u
  $
  Alla vinklar mäts mot _normalen_ till ytan.

  #fs-rubrik[Snells lag]
  $
    n_1 sin theta_1 = n_2 sin theta_2 \
    <==> quad theta_2 = arcsin(n_1 / n_2 dot sin theta_1)
  $
  Index 1 är mediet ljuset kommer _från_, index 2 mediet det går _in i_.

  *Totalreflektion* sker när Snells lag saknar lösning, dvs. när
  $
    n_1 / n_2 sin theta_1 > 1,
  $
  vilket bara kan inträffa om $n_1 > n_2$. Då gäller $theta_i = theta_u$.

  #fs-rubrik[Trigonometri]
  #align(center, cetz.canvas({
    import cetz.draw: *
    line((0, 0), (rel: (3, 0)), name: "a")
    line((), (rel: (0, 1.8)), name: "b")
    line((), (0, 0), name: "c")
    arc((), anchor: "origin", start: 0deg, delta: 31deg, radius: 1.1, name: "d")
    content("d.60%", $theta$, anchor: "west", padding: .15)
    content("a", $a$, anchor: "north", padding: .1)
    content("b", $b$, anchor: "west", padding: .1)
    content("c", $c$, anchor: "south-east", padding: .1)
  }))
  $
    sin theta = b / c, quad cos theta = a / c, quad tan theta = b / a
  $
  $
    arcsin(sin theta) = theta, quad sin^(-1) theta != 1 / (sin theta)
  $
  *Små vinklar* (paraxialapproximationen):
  $
    sin theta approx tan theta approx theta
  $

  #colbreak()

  #fs-rubrik[Sfärisk gränsyta]
  $
    n / s + n' / s' = (n' - n) / r = P
  $
  $n$: index före ytan, $n'$: index efter ytan. $r > 0$ om ytan buktar mot ljuset, $r < 0$ om den buktar med ljuset. $P$ mäts i dioptrier, $1 "D" = 1 "m"^(-1)$.

  #fs-rubrik[Tunna linser (i luft)]
  Linsmakarformeln:
  $
    P = (n - 1)(1 / r_1 - 1 / r_2)
  $
  Linsformeln:
  $
    P = 1 / f = 1 / s + 1 / s' quad <==> quad s' = (s f) / (s - f)
  $
  Tunna linser tätt ihop: $P_"tot" = P_1 + P_2$.

  #fs-rubrik[Förstoring]
  $
    M = h' / h = -s' / s
  $
  *Tecken:* $s > 0$ före linsen, $s' > 0$ efter linsen, $h > 0$ ovanför optiska axeln. $f > 0$ för konvex, $f < 0$ för konkav lins. $s' < 0$ betyder virtuell bild.

  #fs-rubrik[Objekt i oändligheten]
  $
    s' approx f, quad h' = f tan alpha
  $
  där $alpha$ är strålarnas vinkel mot optiska axeln.

  #fs-rubrik[System av linser]
  Bilden från lins 1 blir objekt för lins 2. Med avståndet $d$ mellan linserna:
  $
    s_2 = d - s'_1, quad M_"tot" = M_1 M_2
  $
  Ekvivalent fokallängd:
  $
    f_e = (f_1 f_2) / (f_1 + f_2 - d), quad h' = f_e tan alpha
  $
]

#pagebreak(weak: true)

#set page(columns: 2)
#set text(size: 10pt)
#show heading.where(depth: 1): set text(size: 14pt)

#text(size: 24pt, weight: "bold")[ Övningsuppgifter --- Stråloptik ]\ #v(0mm)
#text(size: 12pt, fill: gray)[Marcell Ziegler, #datetime.today().display(). Fysik- och Astronomiläger 2026, Uppsala.]

= Ljusets hastighet i vatten
Ljusets hastighet i vatten är ungefär $2.25 dot 10^8 "m/s"$. Beräkna vattnets refraktionsindex. Använd $c approx 3.00 dot 10^8 "m/s"$.

#facit[
  *Facit:* $n = c / v = (3.00 dot 10^8) / (2.25 dot 10^8) approx 1.33$.
]

= Från luft till glas
En ljusstråle går från luft ($n = 1.00$) in i glas ($n = 1.52$) med infallsvinkeln $40 degree$. Beräkna brytningsvinkeln.

#facit[
  *Facit:* $theta_2 = arcsin(1.00 / 1.52 dot sin 40 degree) approx 25.0 degree$.
]

= Vinklar vid en spegel
En ljusstråle träffar en plan spegel så att vinkeln mellan strålen och _spegelytan_ är $25 degree$.
+ Hur stor är infallsvinkeln?
+ Hur stor är vinkeln mellan den infallande och den reflekterade strålen?

#facit[
  *Facit:*
  + Vinklar mäts mot normalen, så $theta_i = 90 degree - 25 degree = 65 degree$.
  + $theta_u = theta_i = 65 degree$. Vinkeln mellan strålarna blir $180 degree - 2 dot 65 degree = 50 degree$ (alternativt $2 dot 25 degree$).
]

= En okänd vätska
En laserstråle skickas från luft ned i en okänd vätska. Infallsvinkeln mäts till $50 degree$ och brytningsvinkeln till $35 degree$.
+ Bestäm vätskans refraktionsindex.
+ Hur snabbt färdas ljuset i vätskan?

#facit[
  *Facit:*
  + $n = (sin 50 degree) / (sin 35 degree) approx 1.34$ (troligen vatten).
  + $v = c / n approx (3.00 dot 10^8) / 1.34 approx 2.25 dot 10^8 "m/s"$.
]

= Ett misstänkt material
En kompis påstår att hen har hittat ett genomskinligt material med refraktionsindex $n = 0.8$. Vad skulle det innebära för ljusets hastighet i materialet? Är påståendet rimligt?

#facit[
  *Facit:* $v = c / n = c / 0.8 = 1.25 c$, dvs. ljuset skulle färdas snabbare än i vakuum. Inom stråloptiken färdas ljus aldrig snabbare än $c$, så vi kräver alltid $n >= 1$ och påståendet är inte rimligt.
]

= Fördröjning genom glas
En ljuspuls passerar vinkelrätt genom en $1.0 "cm"$ tjock glasskiva ($n = 1.52$). Hur mycket längre tid tar det för pulsen att passera skivan jämfört med om skivan hade ersatts av vakuum? Hur långt hinner ljuset i vakuum under denna tidsskillnad?

#facit[
  *Facit:* $Delta t = d / v - d / c = d (n - 1) / c = (0.010 dot 0.52) / (3.00 dot 10^8) approx 1.7 dot 10^(-11) "s"$. Under den tiden hinner ljuset $c Delta t = d(n - 1) = 5.2 "mm"$ i vakuum.
]

= Mot eller från normalen?
Svara kvalitativt, utan att räkna:
+ En ljusstråle går snett från luft in i vatten. Bryts strålen _mot_ eller _från_ normalen?
+ Samma fråga, men för en stråle som går från vatten ut i luft.
+ Vad händer med en stråle som träffar gränsytan vinkelrätt ($theta_1 = 0$)?

#facit[
  *Facit:*
  + Mot normalen, ty $n_2 > n_1$ ger $sin theta_2 = n_1 / n_2 sin theta_1 < sin theta_1$.
  + Från normalen, ty nu är $n_1 > n_2$.
  + Den bryts inte alls: $sin theta_2 = n_1 / n_2 dot 0 = 0$, så $theta_2 = 0$.
]

= Gränsvinklar
Beräkna gränsvinkeln för totalreflektion för ljus som går
+ från vatten ($n = 1.33$) till luft,
+ från glas ($n = 1.52$) till luft,
+ från glas till vatten.

Förklara med ord varför gränsvinkeln i c) är större än i b).

#facit[
  *Facit:* $theta_c = arcsin(n_2 / n_1)$.
  + $arcsin(1 / 1.33) approx 48.8 degree$.
  + $arcsin(1 / 1.52) approx 41.1 degree$.
  + $arcsin(1.33 / 1.52) approx 61.0 degree$.
  Ju mindre skillnad i refraktionsindex, desto mindre bryts ljuset, och desto större infallsvinkel krävs för att den brutna strålen ska nå $90 degree$.
]

= Brytning utan miniräknare
En ljusstråle går från luft ($n approx 1$) in i ett material med $n = sqrt(2)$. Infallsvinkeln är $45 degree$. Beräkna brytningsvinkeln _utan miniräknare_.

_Ledning:_ $sin 45 degree = 1 / sqrt(2)$ och $sin 30degree = 1 / 2$.

#facit[
  *Facit:* $sin theta_2 = 1 / sqrt(2) dot sin 45 degree = 1 / sqrt(2) dot 1 / sqrt(2) = 1 / 2$, alltså $theta_2 = arcsin(1 / 2) = 30 degree$.
]

= En reell bild
Ett $2.0 "cm"$ högt objekt placeras $40 "cm"$ framför en konvex lins med fokallängd $15 "cm"$. Bestäm bildavstånd, förstoring och bildhöjd. Är bilden reell eller virtuell?

#facit[
  *Facit:* $s' = (s f) / (s - f) = (40 dot 15) / (40 - 15) = 24 "cm"$. $M = -s' / s = -0.60$, så $h' = -1.2 "cm"$. Bilden är reell ($s' > 0$) och upp och ned.
]

= Dioptrier
+ En lins har brytningsstyrkan $+4 "D"$ (Diptrier). Vad är dess fokallängd? Är linsen konvex eller konkav?
+ Ett par glasögon har styrkan $-2.5 "D"$. Vad är glasens fokallängd, och vilken typ av lins rör det sig om?

#facit[
  *Facit:*
  + $f = 1 / P = 1 / 4 "m" = 25 "cm"$. Positiv fokallängd, alltså konvex (samlingslins).
  + $f = 1 / (-2.5) "m" = -40 "cm"$. Negativ fokallängd, alltså konkav (spridningslins).
]

= Förstoringsglaset
Ett förstoringsglas (lupp) har fokallängden $8.0 "cm"$. Du håller det $5.0 "cm"$ ovanför ett frimärke.
+ Var hamnar bilden? Är den reell eller virtuell?
+ Hur många gånger förstorat ser frimärket ut?
+ Var måste du hålla luppen för att få förstoringen $M = 4$?

#facit[
  *Facit:*
  + $s' = (5.0 dot 8.0) / (5.0 - 8.0) approx -13.3 "cm"$. Bilden är virtuell och ligger $13.3 "cm"$ på _samma_ sida som frimärket.
  + $M = -s' / s = 13.3 / 5.0 approx 2.7$. Rättvänd.
  + $M = -s' / s = -f / (s - f) = f / (f - s) = 4$ ger $f - s = f / 4$, alltså $s = 3 / 4 f = 6.0 "cm"$.
]

= När sker totalreflektion?
+ Kan totalreflektion ske när ljus går från luft till vatten, från vatten till luft, eller båda? Motivera.
+ Ett (påhittat) glas har $n = 2$. Bestäm gränsvinkeln för totalreflektion när ljus går från glaset ut i luft, utan miniräknare.

#facit[
  *Facit:*
  + Endast från vatten till luft. Totalreflektion kräver att Snells lag saknar lösning, dvs. $n_1 / n_2 sin theta_1 > 1$, vilket bara kan hända om $n_1 > n_2$.
  + Snells lag saknar lösning när $n_1 / n_2 sin theta_1 > 1$, vilket ger oss $2 sin theta_1 > 1$ eller $theta_1 > arcsin ( 1 / 2 )$ det vill säga $theta_1 > 30degree$.
]

= Den konkava linsen
Ett $4.0 "cm"$ högt objekt står $30 "cm"$ framför en konkav lins med fokallängd $-20 "cm"$.
+ Bestäm bildens läge och höjd.
+ Visa, med hjälp av linsformeln och förstoringsformeln, att en konkav lins _alltid_ ger en virtuell, rättvänd och förminskad bild av ett (verkligt) objekt, dvs. för alla $s > 0$.

#facit[
  *Facit:*
  + $s' = (30 dot (-20)) / (30 + 20) = -12 "cm"$, $M = -s' / s = 0.40$, $h' = 1.6 "cm"$. Virtuell, rättvänd bild $12 "cm"$ framför linsen.
  + Skriv $f = -|f|$. Då är $s' = (s f) / (s - f) = -(s |f|) / (s + |f|) < 0$, alltså virtuell. Förstoringen blir
    $
      M = -s' / s = (|f|) / (s + |f|),
    $
    vilket uppfyller $0 < M < 1$ för alla $s > 0$: rättvänd och förminskad.
]

= Linser i kontakt
Två tunna linser, med brytningsstyrkorna $+3 "D"$ och $-1 "D"$, sätts tätt ihop.
+ Vad blir den sammanlagda brytningsstyrkan och fokallängden?
+ Ett objekt placeras $1 "m"$ framför linskombinationen. Var hamnar bilden, och vad blir förstoringen?

#facit[
  *Facit:*
  + $P = 3 - 1 = 2 "D"$, alltså $f = 0.5 "m"$.
  + $1 / s' = P - 1 / s = 2 - 1 = 1 "m"^(-1)$, så $s' = 1 "m"$ bakom linsen. $M = -s' / s = -1$: bilden är lika stor och upp och ned.
]

= Linsmakarformeln
En bikonvex lins av glas med $n = 1.50$ har krökningsradierna $r_1 = 20 "cm"$ (första ytan) och $r_2 = -30 "cm"$ (andra ytan).
+ Beräkna linsens brytningsstyrka och fokallängd i luft.
+ Linsen vänds så att ljuset istället träffar den yta som tidigare var den andra först. Ändras fokallängden? Visa med räkning.

#facit[
  *Facit:*
  + $P = (n - 1)(1 / r_1 - 1 / r_2) = 0.50 (1 / 0.20 + 1 / 0.30) approx 4.17 "D"$, så $f = 24 "cm"$.
  + Efter vändningen blir $r_1 = 30 "cm"$ och $r_2 = -20 "cm"$ (båda ytornas tecken byts). Då blir $P = 0.50 (1 / 0.30 + 1 / 0.20)$, dvs. exakt samma. En tunn lins har samma fokallängd åt båda hållen.
]

= Strålkonstruktion
Ett $3 "cm"$ högt objekt står $6 "cm"$ framför en konvex lins med fokallängd $2 "cm"$.
+ Konstruera bilden grafiskt med hjälp av de tre huvudstrålarna (använd gärna rutpapper, $1 "ruta" = 1 "cm"$).
+ Läs av bildavstånd och bildhöjd ur din figur. Är bilden reell eller virtuell? Rättvänd eller upp och ned?
+ Kontrollera ditt svar med linsformeln och förstoringsformeln.

#facit[
  *Facit:* $s' = (s f) / (s - f) = (6 dot 2) / (6 - 2) = 3 "cm"$ och $M = -s' / s = -1 / 2$, så $h' = -1.5 "cm"$. Bilden är reell, upp och ned och förminskad.
]

= Glasstav med sfärisk ände
Ena änden av en lång glasstav ($n = 1.50$) är slipad till en konvex halvsfär med radien $2.0 "cm"$. Ett litet föremål i luften befinner sig $8.0 "cm"$ framför stavens ände, på stavens axel. Var inne i staven bildas bilden?

#facit[
  *Facit:* Använd avbildning genom en sfärisk gränsyta med $n = 1.00$, $n' = 1.50$, $s = 8.0 "cm"$ och $r = +2.0 "cm"$ (ytan buktar mot ljuset):
  $
    1.00 / 8.0 + 1.50 / s' = (1.50 - 1.00) / 2.0 = 0.25 "cm"^(-1) quad ==> quad 1.50 / s' = 0.125 "cm"^(-1),
  $
  vilket ger $s' = 12 "cm"$ in i staven.
]

= Bildtyper
Ett objekt flyttas längs den optiska axeln framför en lins. Fyll i tabellen med _reell/virtuell_, _rättvänd/upp och ned_ och _förstorad/förminskad_. Resonera med hjälp av strålkonstruktion eller formlerna $1 / f = 1 / s + 1 / s'$ och $M = -s' / s$.

#align(center, table(
  columns: 2,
  table.header[Situation][Bildens egenskaper],
  [Konvex lins, $s > 2f$], [],
  [Konvex lins, $s = 2f$], [],
  [Konvex lins, $f < s < 2f$], [],
  [Konvex lins, $s < f$], [],
  [Konkav lins, godtyckligt $s > 0$], [],
))

Vad händer med bilden när $s = f$ för en konvex lins?

#facit[
  *Facit:*
  #align(center, table(
    columns: 2,
    table.header[Situation][Bildens egenskaper],
    [Konvex lins, $s > 2f$], [Reell, upp och ned, förminskad],
    [Konvex lins, $s = 2f$], [Reell, upp och ned, lika stor ($M = -1$)],
    [Konvex lins, $f < s < 2f$], [Reell, upp och ned, förstorad],
    [Konvex lins, $s < f$], [Virtuell, rättvänd, förstorad],
    [Konkav lins, godtyckligt $s > 0$], [Virtuell, rättvänd, förminskad],
  ))
  När $s = f$ blir $1 / s' = 0$, dvs. $s' -> infinity$: strålarna lämnar linsen parallella och ingen bild bildas.
]

= Fotografera månen
Månen upptar en vinkel på ungefär $0.52 degree$ på himlen. Den fotograferas med en kamera vars sensor är $36 "mm" times 24 "mm"$.
+ Hur stor (i diameter) blir månens bild på sensorn med ett normalobjektiv med $f = 50 "mm"$? Med ett teleobjektiv med $f = 300 "mm"$?
+ Hur lång fokallängd skulle behövas för att månen precis ska fylla sensorns höjd? Kommentera resultatet.

#facit[
  *Facit:* Månen är ett objekt i oändligheten, så $h' = f tan alpha$ med $alpha = 0.26 degree$ (från axeln till månens kant).
  + Diametern $2 f tan 0.26 degree approx 0.45 "mm"$ för $f = 50 "mm"$ och $approx 2.7 "mm"$ för $f = 300 "mm"$.
  + $12 "mm" = f tan 0.26 degree$ ger $f approx 2.6 "m"$. En så lång lins vore opraktisk, vilket motiverar sammansatta linssystem eller teleskop.
]

= Den grunda bassängen
En simbassäng är $2.0 "m"$ djup. Du tittar rakt ned i vattnet ($n = 4 / 3$). Hur djup _ser_ bassängen ut att vara?

_Ledning:_ Betrakta en stråle från en punkt på botten som går nästan rakt upp, och utnyttja att $sin theta approx tan theta approx theta$ för små vinklar. Rita en figur!

#facit[
  *Facit:* En stråle från botten lämnar vattenytan på avståndet $x$ från lodlinjen genom punkten. Låt $theta_1$ vara strålens vinkel mot normalen i vattnet och $theta_2$ vinkeln i luften. Med verkligt djup $d$ och skenbart djup $d'$ gäller $x = d tan theta_1 = d' tan theta_2$. Snells lag, $n sin theta_1 = sin theta_2$, ger med små vinklar $theta_2 approx n theta_1$, så
  $
    d' = d theta_1 / theta_2 = d / n = (2.0) / (4 slash 3) = 1.5 "m".
  $
  Bassängen ser alltså ut att vara en fjärdedel grundare än den är.
]

= Glasögon
+ En närsynt person ser skarpt på avstånd upp till $50 "cm"$ (hens _fjärrpunkt_). Vilken styrka i dioptrier ska hens glasögon ha för att hen ska se föremål långt bort skarpt?
+ En översynt person kan inte se skarpt närmare än $1.0 "m"$ (hens _närpunkt_). Vilken styrka behövs för att hen ska kunna läsa en bok på $25 "cm"$ avstånd?

Försumma avståndet mellan glasögon och öga.

#facit[
  *Facit:* Glasögonen ska skapa en virtuell bild på ett avstånd där ögat ser skarpt.
  + Objekt i oändligheten ska avbildas i fjärrpunkten, $s' = -0.50 "m"$: $P = 1 / infinity + 1 / (-0.50) = -2.0 "D"$ (konkav).
  + Objekt på $s = 0.25 "m"$ ska avbildas i närpunkten, $s' = -1.0 "m"$: $P = 1 / 0.25 + 1 / (-1.0) = +3.0 "D"$ (konvex).
]

= Hörnreflektorn
Två plana speglar sätts ihop så att de bildar en rät vinkel, se figuren. En ljusstråle i figurens plan träffar först den ena spegeln och sedan den andra.

#align(center, cetz.canvas({
  import cetz.draw: *
  line((0, 3), (0, 0), (3, 0), stroke: 2pt)
  set-style(stroke: orange + 1.5pt, mark: (end: "stealth", fill: orange))
  line((2.5, 2), (0, 1))
  line((), (2.5, 0))
  line((), (5, 1))
}))

Visa att den utgående strålen alltid är parallell med den infallande strålen men går åt motsatt håll, oavsett infallsvinkel. Var i vardagen används denna princip?

#facit[
  *Facit:* Låt strålens riktning vara $(a, b)$. Reflektion i den lodräta spegeln byter tecken på den horisontella komponenten: $(-a, b)$. Reflektion i den vågräta spegeln byter tecken på den vertikala: $(-a, -b)$. Den utgående riktningen är alltså exakt motsatt den infallande.

  (Alternativt med vinklar: infallsvinkeln $theta$ mot den första spegelns normal blir $90 degree - theta$ mot den andra, och den totala avböjningen blir $2 theta + 2(90 degree - theta) = 180 degree$.)

  Principen (i tre dimensioner med tre speglar) används i reflexer på cyklar och vägskyltar, samt i de speglar som placerats på månen för att mäta avståndet dit med laser.
]

= Planparallell glasskiva
En ljusstråle i luft träffar en $5.0 "cm"$ tjock planparallell glasskiva ($n = 1.52$) med infallsvinkeln $60 degree$.
+ Visa att strålen som lämnar skivan på andra sidan är parallell med den infallande strålen.
+ Beräkna hur långt strålen har förskjutits i sidled (vinkelrätt avstånd mellan den infallande strålens förlängning och den utgående strålen).

#facit[
  *Facit:*
  + Vid första ytan: $sin 60 degree = 1.52 sin theta_2$. Ytorna är parallella, så strålen träffar den andra ytan med vinkeln $theta_2$ och Snells lag ger $1.52 sin theta_2 = sin theta_3$. Alltså $sin theta_3 = sin 60 degree$ och $theta_3 = 60 degree$.
  + $theta_2 = arcsin(sin 60 degree / 1.52) approx 34.7 degree$. Strålen går sträckan $L = t / (cos theta_2)$ i glaset, och avviker vinkeln $theta_1 - theta_2$ från den ursprungliga riktningen. Förskjutningen blir
    $
      d = L sin(theta_1 - theta_2) = (t sin(theta_1 - theta_2)) / (cos theta_2) = (5.0 sin 25.3 degree) / (cos 34.7 degree) approx 2.6 "cm".
    $
]

= Mät en konkav lins
Du har en konkav lins med okänd fokallängd, en konvex lins med känd fokallängd $f = 10 "cm"$, en linjal och ett solbelyst fönster. Konstruera ett experiment för att bestämma den konkava linsens fokallängd. Vilket krav måste den konkava linsens fokallängd uppfylla för att din metod ska fungera?

#facit[
  *Facit:* En konkav lins ger aldrig en reell bild av solen, så den går inte att mäta direkt. Lägg i stället linserna tätt ihop. Kombinationen har $P_"tot" = P_"konvex" + P_"konkav" = 10 "D" + P_"konkav"$. Om $P_"tot" > 0$ kan man avbilda solen (objekt i oändligheten) på ett papper och mäta avståndet till den skarpa bilden, som är $f_"tot"$. Då blir
  $
    P_"konkav" = 1 / f_"tot" - 10 "D", quad f_"konkav" = 1 / P_"konkav".
  $
  Metoden kräver att kombinationen är samlande, dvs. $|f_"konkav"| > 10 "cm"$. Är den konkava linsen starkare än så behövs en starkare konvex lins.
]

= Två linser i rad
Två konvexa linser står på den optiska axeln: lins 1 med $f_1 = 10 "cm"$ och, $40 "cm"$ bakom den, lins 2 med $f_2 = 15 "cm"$. Ett objekt placeras $15 "cm"$ framför lins 1.
+ Var hamnar den slutliga bilden? Är den reell eller virtuell?
+ Vad blir systemets totala förstoring? Är slutbilden rättvänd eller upp och ned?

_Ledning:_ Bilden från lins 1 fungerar som objekt för lins 2.

#facit[
  *Facit:*
  + Lins 1: $s'_1 = (15 dot 10) / (15 - 10) = 30 "cm"$. Denna bild ligger $s_2 = 40 - 30 = 10 "cm"$ framför lins 2, alltså innanför dess fokallängd. Lins 2: $s'_2 = (10 dot 15) / (10 - 15) = -30 "cm"$. Slutbilden är virtuell och ligger $30 "cm"$ framför lins 2, dvs. $10 "cm"$ bakom lins 1.
  + $M_1 = -30 / 15 = -2$, $M_2 = -(-30) / 10 = 3$. $M = M_1 M_2 = -6$: sexfaldigt förstorad och upp och ned.
]

= Optisk fiber
En optisk fiber består av en kärna med $n_1 = 1.50$ omgiven av en mantel med $n_2 = 1.46$. Ljus skickas in från luft genom fiberns plana ändyta.
+ Vad är den minsta vinkel (mot normalen) som ljuset får träffa gränsen mellan kärna och mantel med, för att totalreflekteras?
+ Vad är den största vinkel mot fiberns axel som ljuset får ha inne i kärnan, för att ledas genom fibern?
+ Vad är den största infallsvinkeln $theta_"max"$ i luften vid ändytan för att ljuset ska ledas genom fibern? Visa att $sin theta_"max" = sqrt(n_1^2 - n_2^2)$.

#facit[
  *Facit:*
  + $theta_c = arcsin(1.46 / 1.50) approx 76.7 degree$.
  + Ändytan är vinkelrät mot manteln, så vinkeln mot axeln är $phi = 90 degree - theta_c approx 13.3 degree$.
  + Snells lag vid ändytan: $sin theta_"max" = n_1 sin phi = n_1 cos theta_c = n_1 sqrt(1 - sin^2 theta_c) = n_1 sqrt(1 - n_2^2 / n_1^2) = sqrt(n_1^2 - n_2^2)$. Insättning ger $sin theta_"max" = sqrt(1.50^2 - 1.46^2) approx 0.344$, alltså $theta_"max" approx 20.1 degree$.
]
