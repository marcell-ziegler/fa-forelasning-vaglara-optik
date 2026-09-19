#import "preamble.typ": *
#show: main
#let el = [$e^-$]
#let ef = [$va(E)$]

#outline(title: [Elektromagnetism och Vågrörelselära - SK1114], depth: 3)

= Akustik

#emph-box[
  == Partikelförskjutning:
  $ S = S_0 sin(k x - omega t + delta) $
  Det vill säga att vågen har en tidskomponent $omega$, en lägeskomponent $k$ och en förskjutning $delta$. 
  #image("Våg.png")
]

#emph-box[
  == Partikelhastighet
  $ v = partialderivative(S,t) = - omega cos (k x - omega t + delta) $

  - $S = 0 <==> |v| = v_"max"$ kallas _jämviktsläge_.
  - $v = 0 <==> |S| = S_0$ kallas _vändläge_.
]

#emph-box[
  == Ljudtryck
  $ "tryckändring" Delta p = -B (Delta V) / V = -B S_0 k cos(k x - omega t + delta) $
  där $B$ är _kompressionsmodulus_ och $V$ är volymen. Kompressionsmodulus är en materialkonstant.
]
Beviset till ovan är att 
$ p = - B (Delta V) / V = - B (cancel(A) Delta S) / (cancel(A) Delta x) approx -B partialderivative(S,x) = -B S_0 k (k x - omega t + delta) qed $
#image("tryck.png")

== Intensitet
#emph-box([
  *Momentan intensitet*
  $ i = "effekt" / "area" = "energi" / "tid" dot "area" = ("kraft" dot "sträcka") / ("tid" dot "area") = "tryck" dot "hastighet" = p v\
  i = B S_0^2 omega k cos^2(k x - omega t + delta)
  $
],[
  *Ljudintensitet*
  $ I = B S_0 ^2 omega k dot 1/2 $
  det vill säga tidsmedelvärdet av den momentana intesiteten $i$. Med hjälp av våghastigheten $c$:
  $ c = omega / k\ c = sqrt(B / rho) $
  där $rho$ är densiteten. Om man sätter in detta ges $ I = 1/2 dot S_0^2 omega^2 rho c $
  där $rho c$ kallas den akustiska impedansen och är en materialkonstant. Akustisk impedans för luft är $rho c approx 1.225 punct "kg" / "m"^3 dot 343 punct "m"/"s" approx 420 punct"kg"/("m"^2 dot "s")$
],[
  *Ljudintensitetsnivå*
  $ beta = 10 dot log_10 (I/I_0) quad [ "dB" ] $
  Här är $I_0 = 10^(-12)  space.punct "W"slash "m"^2$ som också är hörbarhetsgränsen för ljud.
])

#exm[
  Intensitetsnivå vid hörbarhetsgränsen $I = 10^(-12) space.punct "W" slash "m"^2$:
  $ beta = 10 dot log(10^(-12)/10^(-12)) = 10 dot 0 = 0 "dB". $ 

  Och vi smärtgränsen $I = 1 punct "W" slash "m"^2$ ger
  $ beta = 10 dot log (1/10^(-12)) = 10 dot 12 = 120 "dB" $
]

#exm[
  Förändring i intensitetsnivå vid fördubblad intensitet.
  $ 
    &I_1, quad beta_1 = 10 dot log (I_1/I_0)\
    &I_2, quad beta_2 = 10 dot log (I_2 / I_0)
  $
  och $I_2 = 2I_1$.
  $
    beta_2 - beta_1 = 10(log(I_2/I_0) - log(I_1/I_0)) = 10 dot log ((I_2 slash cancel(I_0)) / (I_1 slash cancel(I_0))) = 10 dot log (I_2 / I_1)
  $
  och sätt nu in skillnaden för att få:
  $ beta_2 - beta _1 = 10 log ((2 cancel(I_1)) / cancel(I_2))= 10 dot log 2 approx 10 dot 0.3 = 3 "dB" $
]

== Spridning
#image("spridning.png")
Lagarna om intensitet gäller precis vid ljudkällan. Intensiteten är också effekt per enhet area. Däreför kan man i det sfäriska fallet ovan betrakta den sfäriska arean som ljudet sprid ut över:
$ I = "effekt" / (4 pi r^2) $
ifall spridningen sker sfäriskt utan absorbtion. Om ljudet absorberas längs vägen gäller att:
$ I = "effekt" / (4 pi r^2) dot e^(-a r) $
där $alpha$ är absorbansen som beror på materialet.

== Interferens
- Partikelförskjutningar kan adderas i en punkt för att få sammanlagd förskjutning.
- Vi har att $I prop S^2$ och att $S prop sqrt(I)$ för att beräkna liknande sambad för intensiteter.

Interferens för två käller beräknas sedan:

#image("interferens.png")
Låt förskjutningarna $S_1,S_2$ vara som
$ 
  S_1 = S_(1,0) dot sin(k_1 r_1 - omega_1 t + delta_1) = S_(1,0) sin Phi_1\
  S_2 = S_(2,0) dot sin(k_2 r_2 - omega_2 t + delta_2) = S_(2,0) sin Phi_2.
$

Eftersom $I prop S^2$ har vi att 
$
  I_"tot" prop (S_1 + S_2)^2 &= (S_(1,0) sin Phi_1 + S_(2,0) sin Phi_2)^2 \ &= S_(1,0)^2 sin^2 Phi_1 + S_(2,0)^2 sin^2 Phi_2 + 2 S_(1,0) S_(2,0) sin Phi_1 sin Phi_2.
$
Intensiteten räknas som tidsmedelvärde. Då ges att
$
  I_"tot" prop S_(1,0) underbrace(sin^2 Phi_1, 1 slash 2) + S_(2,0) underbrace(sin Phi_2, 1 slash 2) + cancel(2) S_(1,0) S_(2,0) dot 1/cancel(2) (underbrace(cos(Phi_1 + Phi_2), 0) + underbrace(cos(Phi_1 - Phi_2), "okänd")).
$

Den okända kan beteckans $overline(limits(cos(Phi_1 - Phi_2)))$ som sedan ger att

$ 
I_"tot" &prop S_(1,0)^2 dot 1/2 + S_(2,0)^2 dot 1/2 + S_(1,0) S_(2,0) dot overline(cos(Phi_1 - Phi_2))\
I_"tot" &prop 2 (I_1/2 + I_2/2 + sqrt(I_1 I_2) dot overline(cos(Phi_1 - Phi_2)))
$
#def(title: [=== Allmänna interferensformeln],[$ I_"tot" = I_1 + I_2 + 2 sqrt(I_1 I_2) dot overline(Phi_1 - Phi_2)) $],
[
  Olika situationer ger olika tolkningar:
  1. $delta_1 - delta_2$ varierar snabbt, ex. prat och buller, ger ingen interferens eftersom vågorna aldrig "kommer i synk"
  2. $delta_1 - delta_2$ hyfsat konstant och $omega_1 approx omega_2$, ex. musikinstruments stämning. Detta ger svävningar som
    $ I_"tot" = I_1 + I_2 + 2 sqrt(I_1 I_2) dot cos(k_1 r_1 - k_2 r_2 - (omega_1 - omega_2) t + delta_1 - delta_2) $
    Här är $r_1, r_2$ konstanter vilket medför att $I_"tot"$ varierar endast med tiden och frekvensen $ f = (omega_1 - omega_2)/(2 pi). $
  3. $omega_1 = omega_2$, $delta_1 - delta_2$ konstant medför att 
    $ I_"tot" = I_1 + I_2 + 2 sqrt(I_1 I_2) dot cos(k(r_1 - r_2) + underbrace(delta_1 - delta_2, "antag 0")) $
])
#def(title: heading(depth: 4)[Allmänna interferensformeln - forts])[
  Givet 3. från innan kommer vågorna att interferera utan svävningar på en av två sätt:
      - _Konstruktiv interferens:_
        $ cos(k(r_1 - r_2)) )= 1 ==> k(r_1 - r_2) = m dot 2 pi, quad m in ZZ $
        #cetz.canvas({
          plot.plot(size: (13,3),axis-style: "school-book", y-tick-step: .999, x-tick-step: calc.pi/2,{
            plot.add(domain:(0, calc.pi * 4), x => {calc.sin(x)})
            plot.add(domain:(0,calc.pi *4), x => {1.2 * calc.sin(x)})
            plot.add(domain:(0,calc.pi*4), x => {(1+1.2)*calc.sin(x)})
          })
        })
      
      - _Destruktiv interferens:_
        $ cos(k(r_1 - r_2)) )= -1 ==> k(r_1 - r_2) = m dot 2 pi, quad m in ZZ $
        #cetz.canvas({
          plot.plot(size: (14,4),axis-style: "school-book", y-tick-step: .999, x-tick-step: calc.pi/2,{
            plot.add(domain:(0, calc.pi * 4), x => {calc.sin(x)})
            plot.add(domain:(0,calc.pi *4), x => {-1.2 * calc.sin(x)})
            plot.add(domain:(0,calc.pi*4), x => {(1-1.2)*calc.sin(x)})
          })
        })
        
]

== Stående vågor
#image("stående våg.png")

I fallet av en stående våg finns ingen nettotransport av energi, alltså $S_"in" = S_"ut"$. Detta ger
$ 
  cases(S_"in" = S_0 sin (k x + omega t),,S_"ut" = S_0 sin(k x - omega t))\
  S_"tot" = S_"in" + S_"ut" = S_0 (sin(k x + omega t) + sin(k x - omega t)) = dots.c = 2 S_0 sin(k x) cos(omega t).
$
Vi har sedan följnade mönster vid olika tider:
#grid(columns: (1fr, 1fr), rows: (auto, auto),align: center, row-gutter: 20pt, 
text(fill: blue)[$ t = 0 ==> cos(omega t) = 1 $],
text(fill: red)[$ t = pi / omega ==> cos(omega t) = -1 $],
text(fill: green.darken(20%))[$ t = pi/(2 omega) ==> cos(omega t) = 0 $],
text(fill: yellow.darken(20%))[$ t = pi/(4 omega) ==> cos(omega t) = 1 / sqrt(2) $])

#cetz.canvas({
  plot.plot(size: (19,4),axis-style: "school-book", y-tick-step:none,x-tick-step: none,
    {
      plot.add(domain: (0,4 * calc.pi), x => {calc.sin(x)})
      plot.add(domain: (0,4 * calc.pi), x => {-calc.sin(x)})
      plot.add(domain: (0,4 * calc.pi), x => {0 * calc.sin(x)})
      plot.add(domain: (0,4 * calc.pi), x => {1 / calc.sqrt(2) * calc.sin(x)})
    }
  )
})

=== Stränginstrument
För en sträng som sitter fast i båda ändar har vi:
#image("SK1110 - Elektromagnetism och vågrörelselära.svg")
Där $ underbrace(L = lambda/2, "grundton") quad underbrace(L = lambda quad dots.c quad L = m dot lambda/2, "övertoner") quad m in ZZ $

#def[
  Spännkraft:
  $ f = 1 / (2 L) dot sqrt(F / mu) $
]

= Elektriska fält och elektrisk kraft.
I modern fysik finns 4 sorters växelverkan:
+ Den starka
+ Den svaga
+ Gravitationen (mekanik, *det försummas under EM delen av kursen*)
+ Elektromagnetism (EM)

$ F_"starka" >^(times 100) F_"EM" >^(times 1000) F_"svaga" >^(~ times 10^38) F_"gravitation"  $

- Massa, en positiv skalär, medför att gravitationskrafter adderas.
- Laddning, som kan vara "+" eller "-" kompenserar varandra vilket leder till färre makroskopiska observationer.

== Egenskaper av laddning
- Olika laddningar attraheras, samma repelleras
- Summan av alla laddningar i ett slutet system är konstant (laddning bevaras)
- Elementära laddningen $e = q_e = 1.6 dot 10^(-19) punct "C"$
  - Elektroner är laddade $-e$, protoner $+e$. Alla laddningar $Q = N e, quad N in NN$
- _Fria_ och _bundna_ elektroner ($e^-$) finns i materialet (Fria elektroner är ledare, bundna är isolatorer)

#sats(title: heading(depth:3, [Coulombs lag]))[
  Elektriska kraften mellan två punktladdningar är
  $
    va(F) = cal(k) (q_1 q_2)/r^2 dot va(e_r)
  $
  #align(center,cetz.canvas({
    import cetz.draw: *
    circle((-5,0), name: "left")
    circle((5,0), name: "right")
    set-style(mark: (end: "stealth"))
    content("left", [$+q_1$])
    content("right", [$-q_2$])
    line("left.east",(rel: (2,0)), name: "lefta")
    content("lefta.end", [$va(F_(2,1))$], anchor: "north-west")
    line("right.west",(rel: (-2,0)), name: "righta")
    content("righta.end", [$va(F_(1,2))$], anchor: "north-east")
    set-style(mark: (symbol: "stealth"))
    line((rel: (0,.5), to: "left.north"), (rel: (0,.5), to: "right.north"), name: "r")
    content("r.mid", anchor: "north", [$r$])
  }))
  Här är $va(e_r)$ enhetsvektorn i $r$ riktningen och $cal(k) = 1/(4 pi epsilon_0) = 8.98 dot 10^9 punct ("N" dot "m"^2)/"C"^2$, och $epsilon_0$ är _vakumpermittivitet_.
]

== Egenskaper av elektrostatiska krafter
1. va(F) är längs linjen som förbinder laddningar
2. $q_1, q_2$ är samma tecken $=>$ partiklarna repelleras, annars attraheras
3. Kraftfältet är konservativt (Arbtetet är vägobe roende)

== Elektriska fält från en punktladdning
Alla laddningar har $va(E)$-fält runt omkring sig. 

#grid(columns: (1fr, 1fr), align: center, cetz.canvas({
  import cetz.draw: *
  circle((0,0), name: "c")
  content("c", [$+q_s$])
  let f = (t,r) => (t,.8)

  let angles = for i in array.range(20) {(i*18deg,)}
  // (0deg,15deg,30deg,45deg,60deg,75deg,90deg,105deg,120deg,135deg,150deg,165deg,180deg,195deg,210deg,225deg,240deg,255deg,270deg,285deg,300deg,315deg,330deg,345deg,360deg)
  let rs = (1, 2.2)

  set-style(mark: (end: "stealth"), fill: black)
  for r in rs{
    for t in angles {
      let fe = f(t,r)
      line((t, r), (rel: fe))
    }
  }
  
}),cetz.canvas({
  import cetz.draw: *
  circle((0,0), name: "c")
  content("c", [$-q_s$])
  let f = (t,r) => (t,-.8)

  let angles = for i in array.range(20) {(i*18deg,)}
  // (0deg,15deg,30deg,45deg,60deg,75deg,90deg,105deg,120deg,135deg,150deg,165deg,180deg,195deg,210deg,225deg,240deg,255deg,270deg,285deg,300deg,315deg,330deg,345deg,360deg)
  let rs = (1+.8, 2.2+.8)

  set-style(mark: (end: "stealth"), fill: black)
  for r in rs{
    for t in angles {
      let fe = f(t,r)
      line((t, r), (rel: fe))
    }
  }
  
}))

Vi betraktar en källadning $q_s$ som genererar $va(E)$-fält (Elektriskt fält). Om en testladdning $q_t$ placeras i närheten, då upplever $q_t$ $va(E)$-fält från $q_s$. Detta har ekvation:
#emph-box[$ va(E) = va(F_t)/q_t <==> va(F_t) = q_t va(E) $
$ va(E) = 1 / (4 pi epsilon_0) q_s/(r^2) dot va(e_r) $]

== Elektriskt fält från lång rak ledare
Via Gauss sats nedan får vi att för en given Gaussyta, i detta fall en tunn cylinder (ledare) kommer elektriska flödet att vara
$ Phi_e = q_"inne" / epsilon_0 $
där vi för en ledare med linjär laddningsdensitet $lambda$ kan skriva att
$ Phi_e = (lambda l) / epsilon_0. $

Vi vet ävet att 
$ Phi_e = integral.surf ef dif va(A). $
För cylindern kommer "locken" att ta ut varandra, och eftersom elektriska fältet är konstant m.a.p. arean gäller att
$ Phi_e = E dot underbrace(2 pi r l,"mantelyta") $
vilket sedan kan sättas in i uttrycket ovan för att få
$ E = Phi_e / (2 pi r l) $
#emph-box[
  $ E = lambda / (2 pi epsilon_0 r) $
  där $r$ är avståndet från ledarens "axel".
]

== Egenskaper hos E-fält
1. E-fält finns överallt
2. E-fält visar förmåga för växelverkan mellan laddningar/partiklar/material.

== Fält vs. kraft
- Betydelsen av fältkonceptet (EM, magnet, gravitation): Fältstyrkan ($|va(E)|, |va(B)|, ...$) och _testobjektets_ egenskaper avgör växelverkans styrke: _kraften_.

- I mekaniken går man direkt från kraft till bana, men i EM måste man gå först från fält. 

#exm[
  en #el färdas med $v = 3 dot 10^6 punct "m" slash"s"$ i ett homogent $ef$-fält där $|ef| = 200 punct "N"/"C"$. vad är $va(a)$

  #align(center,cetz.canvas({
    import cetz.draw: *
      circle((-2,0), radius: .2, name: "e")
      set-style(stroke: (paint: black, dash: "dashed"))
      line((0,2), (rel: (0,-4)))
      line((rel: (4,4)), (rel: (0,-4)))
      set-style(stroke: (paint: blue, dash: none), mark: (end: "stealth"), fill: blue)
      line((1,-2), (rel: (0,4), update: false))
      line((rel: (1,0)), (rel: (0,4), update: false))
      line((rel: (1,0)), (rel: (0,4), update: false), name: "l")
      content("l.end", text(blue, [$va(E)$]), anchor: "south-west")
      line("e.east", (rel: (1,0)))
  }))
  
  1. $E_x$ = 0
  2. 
]

== Dipoler
- Dipol är ett par av punktladdningar med lika stor laddning medo lika tecken.

== Gauss Sats
- *Elektrostatik* (Laddningar utan rörelse skapar $ef$-fält runt sig)

=== Definitioner
- En _sluten yta_ är en ytan, som begränsar en volym helt inom sig t.ex. en sfär som begränsar ett klot.
- En _Gaussyta_ --- En abstrakt geometrisk figur (en sluten yta) som upprättas för beräkningen av $ef$-fält.
- Ytintegrering. Om laddningar är tmesetade på en yta med ytladdningsdensitet $sigma$, då är den totala laddningen på ytan $ Q_"tot" = integral.double_S sigma dif A. $
- Flöde ges i allmänhet som $ Phi = integral.double_S va(j) dot dif va(A) $ där $va(j) punct ["kg" / ("s" dot "m"^2)]$ är strömdensiteten och $va(A)$ är vektorarean av $S$ och definieras som $va(A) = A vectorunit(n)$ eller $dif va(A) = vectorunit(n) dif A$. 
- Flöde genom en sluten ytan betecknas $ Phi = integral.surf_S va(j) dot dif va(A) $

=== Flöde och $ef$-fält linjer
$ Phi_E = integral.double ef dif va(A) "för en yta" $
$ Phi_E = integral.surf ef dif va(A) "för en sluten yta" $
- Vilket i enkla uppgifter kan vara sådan att antal fältlinjer in $N_"in"$ och antal fältlinjer ut $N_"ut"$ ger flödet som $ Phi_E = N_"ut" - N_"in" $
#sats[
  För en sluten yta utanför en en laddningskälla gäller att $ Phi_E = 0. $
]
#sats(title: heading(depth: 3)[Gauss sats])[
  Om en punktladdning är omsluten av en sfäriskt yta (eller generellt en _Gaussyta_) med radien $r$ gäller att
  $ ef = 1 / (4 pi epsilon_0) dot q / (r^2) dot va(e_r), quad |va(e_r)| = 1. $
  $ Phi_E = integral.surf_S ef dif va(A) = integral.surf_S E dif A = E integral.surf_S dif A. $
  $ Phi_E = 1 / (cancel(4 pi) epsilon_0) dot q / cancel(r^2) dot cancel(4 pi r^2) = q / epsilon_0 quad (epsilon_0 = "vakumpermittivitet") $
  Vid flera laddningar gäller superpositionen av laddningarna s.a.
  $ Phi_E = integral.surf_S (E_1 + E_2 + dots.c + E_n) dif A = (q_1 + q_2 + dots.c + q_n) / epsilon_0 $
  det vill säga att
  #emph-box[
    $ Phi_E = Q_"innesluten" / epsilon_0 "för en godtycklig, sluten Gaussyta" $
  ]
]
- Hela elektromagnetismen beskrivs med Maxwells ekvationer varav Gauss sats är en
- För en lösbar integral över en godtycklig gaussyta krävs att minst en av följande är sant:
  1. $|ef|$ på Gaussytan är konstant (ofta pga. symmetri)
  2. $ef dot dif va(A) = |ef| dot q|dif va(A)|, quad ef arrows.tt dif va(A) $
  3. $ef dot dif va(A) = 0, quad ef perp dif va(A) $
  4. $|ef| = 0$

== Elektris potential, Kapacitans
- Ett $ef$-fält har en potentiall energi precis som ett gravitationsfält. 
- Den utträttar arbete likadant som tyngdkraft:
  $ dif W = va(F_e) dot dif va(s) = q ef dot dif va(s) $
- Ändringen i pontentiell energi pga. detta arbete är:
  $ dif U = - dif W = - q ef dot dif va(s) $
  $ Delta U_(A-B) = - q_0 integral_A^B ef dot dif va(s) $
- Vi kallar sedan den elektriska potentialen (spänningen)
  $ V = U / q $ som därmed ger att $ Delta V = (Delta U) / q - integral_A^B ef dot dif va(s) $
#emph-box[
  $
    "Potentiell energi": U, W_p punct ["J"]\
    limits("Potentialskillnad")_"(spänning)": Delta V, U punct [V]
  $
]

== Kondensatorer
- Kapacitansen $C$ uttrycker hur mycket laddning som kan lagras för en given potentialskillnad.
$ C = Q / (Delta V) punct ["F"] $

- Parallelkopplade kondensatorer är additiva dvs. att $ C_"tot" = C_1 + C_2 + dots.c + C_n $
  eftersom $Q = Q_1 + Q_2$ och $Delta V$ är samma oavsett hur du mäter den.
  #image("parallel cap.png")

- För seriekopplade kondensatorer gäller att
$ Q / C_"tot" = Q_1/C_1 + Q_2 / C_ 2 + dots.c + Q_n / C_n $
$ 1 / C_"tot" = 1 / C_1 + 1 / C_2 + dots.c + 1 / C_n = (C_1 C_2 dots.c C_n) / (C_1 + C_2 + dots.c + C_n) $

=== Parallell plattkondensator
Betrakta två plattor när intill varandra, både med ytladdningsdensitet $sigma$ respektive $- sigma$. För en platta ges att det elektriska fältet är $ E = sigma / (2 epsilon_0) $ eftersom gauss sats ger att för en godtyckligt vald gaussyta som innehåller en del av planet och en del av rummet utanför samt innanför planet, ex en cylinder vinkelrät mot planet med basyter parallell mot planet ger att
$ Phi = integral.surf_"cylinder" E dif A = Q_"innesluten" / epsilon_0. $
$Phi$ är 0 för alla ytor vinkelräta med planet så då lämnas cylinders 2 cirkulära yta med var sin area $a$ som sen ger att
$ 
  Phi = E dot 2a = Q / epsilon_0\
  E = Q / a dot 1 / (2 epsilon_0) = sigma / (2 epsilon_0).
$
Detta betyder då att två plattor med lika och motsatt laddning ger
$ E = sigma / epsilon_0. $

Vilket även ger att för ett avstånd $d$ mellan plattorna
$ Delta V = integral_0^d E dif s = E d = (sigma d ) / epsilon_0 $ 
vilket allra sist ger kapacitansen som
$ C = Q / (Delta V) = Q / ((sigma d) / epsilon_0) = Q / ((Q d) /  (A epsilon_0)) = (A epsilon_0) / (d) $

== Elektrisk effekt
- Potentiell energi lagras i kondensatorn/batteriet.
- Vid ström som går genom resistant utförs arbete som omvandlas till värme. 
  - På mikroskopisk nivå studsar elektroner mellan atomer som leder till mer rörelse och därmed högre värme.
- #underline[Potential faller över en resitans] (spänningsfall). 
- Förendringen av potentiell energi över tid är effekt:
$ P = derivative(U_e, t) = derivative(, t)(q Delta V) = derivative(q,t) dot Delta V = I Delta V -> {Delta V = I R} => P = I^2R $

== Likström och batteri
- Batterier är en källa till konstant spänning $Delta V$.
- En konstant spänning innebär konstant ström $==>$ likström.
- Maximal spänning i en sådan krets kallas _elektromotorisk spänning_ (EMS, $epsilon$).
- I praktiken har batteriet en, ofta försumbar, inre resitans $R_i$ som gör att $ Delta V_"max" = epsilon - I R_i approx epsilon $



== Resistorer
- Seriekoppling är additivt:
$ R_"tot" = R_1 + R_2 + dots.c + R_n $
- Parallelkoppling är reciprokalt:
$ 1 / R_"tot" = 1 / R_1 + 1 / R_2 + dots.c + 1 / R_n = (R_1
R_2 dots.c R_n) / (R_1 + R_2 + dots.c + R_n) $

== Kirschoffs lagar

- Första lagen säger att laddning bevaras, dvs. att $I_"in" - I_"ut" = 0$ för alla förgreningar i en likströmskrets.
- Den andra lagen säger att energi i systemet bevaras alltså att $sum Delta V = 0 $ i en sluten likströmskrets.
#exm[

  #align(center, cetz.canvas({
    import cetz.draw: *

    set-style(padding: .2)
    circle((-.5, 0), radius: .05, name: "+")
    content((), [$+$], anchor: "north")
    line("+.west", (rel: (-1,0)))
    line((), (rel: (0,1)), name: "left")
    line((), (rel:(1,0)))
    rect((rel: (0,.2)), (rel: (1,-.4)), name: "b")
    line((rel: (0,.2)), (rel: (1,0)))
    line((), (rel: (0,-1)), (rel: (-1,0)))
    circle((), radius: .05, anchor: "east")
    content((), [$-$], anchor:"north")

    line("left.end", (rel: (0,1.5)), (rel:(1,0)))
    rect((rel:(0,.2)),(rel: (1,-.4)), name: "t")
    line((rel: (0,.2)),(rel: (1,0)),(rel: (0,-1.5)))
    content("b.north", [$R_1$],anchor: ("south"))
    content("t.north", [$R_2$],anchor: ("south"))
  }))
  
  För en parallelkoppling av två resistorer som ovan gäller det att strömmen in i varje förgrening är lika med strömmarna ut. Så låt strömmen mot $R_1$ vara $I_1$ och mot $R_2$ vara $I_2$. Då har vi att totala strömmen vid strömkällan är $I = I_1 + I_2$ Vi har sedan att
  $ I = (Delta V) / R = (Delta V_1) / R_1 + (Delta V_2) / R_2 ==> 1 / R = 1 / R_1 + 1 / R_2\ I = (R (I_1 + I_2)) / R = (R_1 I_1) / (R_1) + (R_2 I_2) / R_2 $
  och spänningarna kan divideras bort eftersom $Delta V = Delta V_1 = Delta V_2$ då alla punkter på en ledare måste ligga på samma pontetial, därmed behöver också potentialskillnaden överresitorerna vara densamma.
]

== RC-kretsar
- Från likströmskretsar till växelströmskretsar ($I = I(t)$).
- I en RC krets som inte har strömtillförsel gällerl att
  $ V(t) = V_0 dot e^(-t / (R C)) $
#exm[
  #image("20250327_144633.jpg", width: 40%)
Vid $t = 0$ ansluts kontakten (lila pil) och kondensatorn börjar laddas. Den börjar dock på $q_i = 0 $. Den slutar på det fulladade laddning $q_f = Q$

Kirschoffs andra lag ger nu
  $ epsilon - q / C - I R = 0 $
  då spänningen över en kondensator är $Delta V = q slash C$.

  $q = q(t), I = I(t)$ söks här.

  $q_i = 0, t = 0 ==> I_i = epsilon slash R$ medan $ I_f = 0, t = t_f ==> Q = epsilon C $

  $ I = derivative(q,t) = epsilon / R - q / (R C) = (epsilon C) / (R C) - q / (R C)$
]
 
= Magnetism
- Strömmar och permanenta magneter alstrar magnetfält med styrka $va(B)$ som har enheten Tesla [T].
- Magnetiskt flöde $Phi_B$ har enheten Weber [Wb = $"T" dot "m"^2$]
- En ström (eller rörlig laddning) alstrar alltid ett magnetfält

== Kraften på en punktladdning
#emph-box[
  $ F = q va(v) times va(B) $
  #align(center,cetz.canvas({
    import cetz.draw: *
    for x in range(-3,4) {
      for y in range(-1,2) {
        content((x,y),text(blue, )[*$times$*])
      }
    }
    content((), text(blue)[$ va(B) $], padding: .5, anchor: "west")

    circle((-.5,0), radius: .1, fill: black, name: "dot")
    set-style(fill: black, mark: (end: "stealth"), stroke: black+2pt,padding: .1)
    line((),(rel: (0,1)))
    content((),[$ va(F) $], anchor: "south-west")

    set-style(stroke: orange+2pt, fill: orange)
    line("dot",(rel:(1,0)))
    content((),text(orange)[$ va(v) $], anchor: "north")
  }))
]

== Kraften på en lång rak ledare
#emph-box[
  $ F = l va(I) times va(B) $
  #align(center,cetz.canvas({
    import cetz.draw: *
    line((-4,0),(4,0), mark: (symbol: "stealth"), fill: black, stroke: black+1.5pt)
    for x in range(-3,4) {
      for y in range(-1,2) {
        content((x,y),text(blue, )[*$times$*])
      }
    }
    content((), text(blue)[$ va(B) $], padding: .5, anchor: "west")

    circle((-.5,0), radius: .1, fill: black, name: "dot")
    set-style(fill: black, mark: (end: "stealth"), stroke: black+2pt,padding: .1)
    line((),(rel: (0,1)))
    content((),[$ va(F) $], anchor: "south-west")

    set-style(stroke: orange+3pt, fill: orange)
    line("dot",(rel:(2,0)))
    content((),text(orange)[$ va(I) $], anchor: "north")
  }))
]

== Magnetfältet från en rörlig laddning
- Givet en laddning $q$ som har hastighet $va(v)$, vilket magnetfältstyrka $va(B)$ alstrar den på en given punkt?
  - Om punkten har oortsvektor $va(r)$ från utgående från laddningen och enhetsvektorn i samma riktning är $va(e_r)$ ges detta som
#emph-box[$ va(B) = mu_0 / (4 pi) dot (q va(v) times va(e_r))/r^2 $ $mu_0=4 pi dot 10^(-7) punct ["N" dot "s"^2 slash "C"^2]$ och kallas vakum#text(style: "italic")[permeabiliteten], OBS inte #box[_-permittivitet_]]

== Magnetfältet från en ledare
#align(center,cetz.canvas({
  import cetz.draw: *
  set-style(padding:.2)
  rect((-3,.5),(3,-.5))
  rect((-.5,.5),(.5,-.5), stroke: orange+2pt, name: "ds")
  content("ds.south", text(orange)[$ dif s $], anchor: "north")
  line((rel: (.2,0), to: "ds.east"), (rel: (1,0)), mark: (end: "stealth"), fill: black)
  content((),anchor: "west", [$ va(I) $])
}))
  För en laddning $dif q$ inom en volym $V = A dif s$ där $A$ är tvärsnittsarean av leldaren har vi relation mellan laddning, hastighet och ström som följande:
  $ dif q dot va(v) = overbrace(rho_e underbrace(A dif va(s), V), dif q) dot v = underbrace(I,rho_e A v) dot dif va(s) $
  och detta funkar eftersom $va(v)$ har samma riktning som $dif va(s)$ när $dif s -> 0$ och $a va(b) = b va(a)$ för två vektorer $va(a) parallel va(b)$. Sedan med insättning i formeln för punktladdning då $dif s -> 0$ ges som
  $ dif va(B) = mu_0 / (4 pi) dot (dif q dot va(v) times va(e_r))/r^2 = mu_0 / (4 pi) dot (I dif va(s) times va(e_r)) / r^2 $
  och med integration får vi
  #emph-box[$ va(B) = mu_0 / (4 pi) integral_"ledare" (I dif va(s) times va(e_r)) / r^2  $]
  vilket kallas _Biot-Savarts lag_.


=== Specialfall för rak ledare
För en kort, rak ledare gäller att $ B_z = (mu_0 I) / (4 pi R) (cos theta_1 - cos theta_2) $ 
där $theta_1, theta_2$ är vinklarna som utgörs mellan ledaren och en linje från testpunkten till ledarens början respektive slut och $R$ är minsta avstånden från ledaren till testpunkten.

Å andra sidan för en lång rak ledare är ju $theta_1 = theta_2 = 0$ givet att längden är stor nog vilket ger
$ B_z = (mu_0 I) / (2 pi R) $

=== Specialfall för strömslingor
#image("image (1).png")
Här ges i stället att $ B_z = (mu_0 I dot 2 pi R^2) / (4 pi r^3) = (mu_0 I S) / (2 pi r^3) $
där $S = pi R^2$ dvs. arean som spolen är rand till. Vi har även att $r = sqrt(R^2 + z^2)$.

Om $z = 0$ får vi att $ B_z = (mu_0 I) / (2 R) $

== Amperes lag
#emph-box[
  $ mu_0 I = integral.cont va(B) dot dif va(r) $
]
Lagen säger att en godtycklig cirkulation av $va(B)$ (ty $va(B)$ är konservativt) kommer att ge $mu_0 I$.

=== Lång rak med ampere
Integralen kan nu skrivas om som $ mu_0 I = integral.cont B dif r = B integral.cont dif r = B dot 2 pi R $
där integrationsvägen är vald att vara en cirkel och $R$ är avståndet från en lång, rak ledares mitt. Då gäller ovan sambad för en lång rak ledare som sagt:
$ B = (mu_0 I) / (2 pi R) $

== Magnetiska material
#image("image (2).png")
En magnetisk dipol (strömslinga i detta fall) orienterar sig alltid efter fältet och förstärker detta. Vi då att
$ va(B)_"tot" = mu_r dot va(B)_"yttre" $
där $mu_r$ är materialens _relativa permeabilitet_.

=== Diamagnetiska material
- Inga naturliga magnetiska dipuler om inget yttre magnetfält finns.
- Dipoler bildas om ett yttre magnetfält tillsätts.
- Det inducerade fältet är *motriktat* sitt ursprung.
  - De har $mu_r lt.tilde 1$, ex. silver med $mu_r = 0.999974$

=== Paramagnetiska material
- Dipoler finns naturligt.
- Om ett yttre fält tillsätts kommer vissa dipoler att rikta sig efter detta. 
  - Här har vi $mu_r gt.tilde 1$ med ex. aluminium med $mu_r = 1.000022$

=== Ferromagnetiska material
- Dipoler finns naturligt.
- De ställer lätt in sig efter ett yttre fält.
  - Detta ger $mu_r >> 1$4
  - Ex. järn, nickel, kobolt

== Hysteres och permanentmagneter
- Permanentmagneter bildas enligt följande process:
  + En naturlig järnklump.
  + Om ett svagt yttre magnetfält tillsätts kommer järnet att avmagnetiseras om fältet upphör.
  + Om ett starkt yttre magnetfält tillsätts kommer järnet att behålla magnetiseringen.
  + Mättnad: alla dipoler har ställt in sig.
  + Yttre fältet slås av men järnet är fortfarande magnetiserat.
  + Om man byter håll på det yttre fältet kommer järnet att plötsligt omvandla sin magnetism
  + Om man sedan vänder fältet igen kommer den lika plötsligt att byta till det andra hållet.

#align(center,cetz.canvas({
  import cetz.draw: *
  set-style(mark: (end: "stealth"), fill: black, content: (padding: .05))
  let size = 4
  line((0,-size),(0,size))
  content((), anchor: "south-west", [$B_"inre"$])
  line((-size*1.5,0),(1.5*size,0))
  content((), anchor: "south-west", [$B_"yttre"$])

  set-style(stroke: orange + 1.5pt, fill: orange,content: (padding: .15))
  line((0,0),(2,2), name: "a")
  content("a.start",[$1.$], anchor: "south-east")
  content("a.mid",[$2.$], anchor: "south-east")
  content("a.end",[$3.$], anchor: "south-east")
  bezier((2,2),(4,3),(3,3), fill: none, mark: none)
  line((),(rel: (1,0)), name: "b", mark: (symbol: "stealth"))
  content("b.mid",[$4.$], anchor: "south-east")
  
  // set-style(stroke: (dash: "dashed", paint: blue, thickness: 1.5pt))
  line("b.end",(0,3))
  content((),[$5.$], anchor: "south-west")

  // set-style(stroke: orange + 1.5pt)
  line((),(rel: (-3,0)))
  let (a,b,c,d) = ((-3,3),(-3.5,3), (-3.5,-2),(-4,-2))
  // line(a,b,c,d,stroke: gray)
  bezier(a,d,b,c,name: "c", fill: none, mark: none)
  content((rel: (0,0), to: "c.mid", update: false), anchor: "west", [$6.$])
  line((),(rel: (-1,0)))
}))

=== Avmangetisering
Kan ske genom:
- Uppvärmning
- Mekanisk skakning
- Snabba elektromagnetiska fält (ex. högtalare)

== Dipoler i magnetiska fält
- I ett homogent magnetiskt fält orienterar sig dipolen efter fältet och upplever ingen nettokraft.
- I ett inhomogent fält orienterar sig en dipol fortfarande efter fältet, men den upplever en nettokraft.
  - Nettokraften pekar åt det hållet där fältet är som starkast
#image("image (3).png", width: 30%)

= Integraler i EM
#table(columns: (auto, 1fr, 1fr), stroke: 1pt,
[],[*Elektriska fält*],[*Magnetiska fält*],
[*"Brutala"*\ (funkar för allt)], [$ va(E) = integral (dif q) / (4 pi epsilon_0 r^2) dot va(e_r) $], [$ va(B) = integral_"ledare" (I dif va(s) times va(e_r))/r^2 $],
[*Ytintegral*], [$ integral.surf ef dot dif va(s) = Q_"innesluten" / epsilon_0 $], [$ integral.surf va(B) dot dif va(s) = 0 $],
[*Linjeintegral*], [$ integral.cont ef dot dif va(r) = 0 $], [$ integral.cont va(B) dot dif va(r) = mu_0 I $],
[*Derivator*\ Maxwells ekvationer\ ($va(j)$ är strömtäthet)], [$ div ef = rho_e / epsilon_0\ curl ef = 0 $],[$ div va(B) = 0\ curl va(B) = mu_0 va(j) $]
)

= Induktion
Ändringen i ett magnetfält inducerar en ström i ledande material. Denna ström motsätter sig alltid sin uppkomst (Lenz lag).

#image("image (4).png")

I ovan krets har vi en kraft $va(F_q) = q va(v) times va(B)$ och en kraft $va(F_l) = integral I dif va(l) times va(B)$ där $l$ är ledaren. Vi får då för fallet i bilden att:
$ P = U I = (va(F_l) dot dif va(s)) / (dif t) = (B I l dot dif s) / (dif t). $
Om vi sedan definierar areadifferentialen $dif S = l dot dif s$ får vi sedan att
$ P = U I = (B I dif S) / (dif t) quad ==> quad U = B dot derivative(S,t) $
för detta specialfall. Allmänt gäller dock att
#emph-box[$ U = N derivative(,t)(va(B) dot va(S)) = N dot derivative(Phi_B,t) $ där $N$ är antal varv i en spole och $va(S)$ är vektorfroma tvärsnittsarean.]
#sats(title: heading(depth: 3)[Lenz lag])[För varje storhet som uppkommer pga. induktion, kommer denna storhet _alltid motverka_ orsaken till dess uppkomst för att bevara konserveringen av energi.]


== Induktion i strömslinga
För en slinga C som begränsar ytan S och är i vila samt med $va(B)(t)$ eller $Phi_B (t)$ gäller det att ems-en är $ epsilon = integral.double_S - partialderivative(va(B)(t),t) dif va(S) = - partialderivative(,t) (integral.double_S va(B) dif va(S)) = - partialderivative(Phi_B (t), t) $

Om slingan är i rörelse får man en extra term s.a.
$ epsilon = - partialderivative(Phi_B (t),t) + integral.cont_C (va(v) times va(B)) dif va(l)  $

== Induktans
#image("20250407_133343.jpg", width: 70%)
För två slutna slingor 1 och 2, den ena med en tidsvarierande ström $I_1(t)$ har vi att flödet $Phi_(B 12)$ skapar en spänning i slinga två s.a.
$ U_2 = N_2 derivative(,t)(va(B)_12 dot va(S)_2) = N_2 dot derivative(Phi_B,t) = M_(12) dot derivative(I_1 (t),t). $
Där $M_12$ kallas den _ömsesidiga induktansen_, gäller även i motsatt riktning och mäts i Henry [H]. Integration ger att
$
  N_2 Phi_(B 12) &= M_12 I_1(t)\
  M_12 &= N_2 dot Phi_(B 12) / (I_1(t))
  
$

Om man seriekopplar flera slingar med en gemensam yta $S_1$ respektive $S_2$ multipliceras flödet med antal var $N_1$ och den inducerade strömmen med $N_2$ vilket ger att ömsesidiga induktansen ($M$) ökar med $N_1 dot N_2$.

== Självinduktans
En ledning som alstrar ett magnetfält påverkar såklart också sig själv. Enligt formelrna ovan har vi att
$ U_"ind" = N dot derivative(Phi,t) = L derivative(I,t) $
där $L$ är en konstant som kallas för _självinduktansen_ och mäts i Henry. Integration ger oss för en spole att
$ 
  N dot Phi &= L dot I \
  L &= (N Phi) / I
$
Eftersom $Phi prop N$ gäller att $L prop N^2$.

== Transformatorn
I en ledning finns en ledningsresistans $R_l$ och en spänningsinmatning $U_"in"$ som alstrar en ström $I$. Den ger en spänningsförlust av $U_R = R_l I$. Den totala effekten av kretsen är $ P = U_"in" I $ men endast en del av detta är användbar effekt eftersom effekten förlorad i ledningen är $ P_R = U_R I$ och $U_R = R_l I$ så $ P_R = R I^2 $ medan den användbara spänningen $U_"anv" = U_"in" - U_R$ bidrar till den användbara effekten som $P_"anv" = I U_"anv"$.

Man vill allstå har låg ström och hög spänning i ledningar för att minimera förlusten.

=== Ekvation
Spänningen i en spole kan uttryckas som
$ U = N S derivative(B,t) + R I $
där $N$ är antal varv, $B$ är fältet och $S$ är tvärsnittsarean, dvs. induktion plus Ohms lag. För två spolar med olika varvtal men samma area och fält (pga. ex. en järnkärna) gäller då att
$
  U_1 &= N_1 S derivative(B,t) + cancel(R_1 I_1)\
  U_2 &= N_2 S derivative(B,t) + cancel(R_2 I_2)
$
där Ohms lag bidraget är försumbart eftersom derivatan av fältet tenderar att vara stor. Med det kan vi säga att
$ U_2 / U_1 = N_2 / N_1. $

== RL Krets
#image("image (5).png")

== LC Krets
#image("image (6).png")

== RLC Krets
#image("image (7).png")


= Optik

== EM Vågor
- Ljus är kombinationen av två mot varandra vinkelräta vågor, en som är elektrisk och en som är magnetisk.
- Ljushatighetenen i ett visst materical kan uttryckas
$ c = 1 / sqrt(mu_0 mu_r epsilon_0 epsilon_r) = 1 / sqrt(mu_0 epsilon_0) dot 1 / underbrace(sqrt(mu_r epsilon_r),n) = underbrace(1 / sqrt(mu_0 epsilon_0),c_"vac") dot 1 / underbrace(n,"brytningsindex") $
- Vi har även att ljusintensiteten är
$ I = (epsilon_0 c) / 2 dot abs(E)^2 quad ==> quad I prop E^2 $

== Geometrisk optik
Det finns tre huvusakliga lagar:
+ *Rätlinjig propagation:* Ljuset fortsätter i en rak linje tills den träffar någonting
+ *Reflektion:* Infallsvinkeln är lika med utfallsvinkeln
  $ theta_i = theta_u $
  #align(center,cetz.canvas(({
    import cetz.draw: *
    line((0,2),(rel: (0,-4)))
    set-style(stroke: orange+2pt, fill: orange, mark: (end: "stealth"))
    line((-2,1.5),(0,0),)
    line((),(-2,-1.5))
  
    set-style(stroke: (paint: black, thickness: 1pt, dash: "dashed"), mark: none, fill: none)
    line((0,0),(rel: (-2,0)))
    set-style(stroke: (dash: none))
    arc((-1,0),start: 180deg, delta: -calc.atan(1.5 / 2),radius: 1, name: "a")
    content((to: "a.mid", rel: (0,.06)), [$theta_i$],anchor: "east", padding: .2)
    arc((-1,0),start: 180deg, delta: calc.atan(1.5 / 2),radius: 1, name: "a")
    content((to: "a.mid", rel: (0,-.1)), [$theta_u$],anchor: "east", padding: .2)
  })))
+ *Refraktion:* Förhållandet mellan infalls- och utfallsvinkel vid brytning är'
  $ n_i sin theta_i = n_u sin theta_u  $
  #align(center,cetz.canvas(({
    import cetz.draw: *
    line((0,2),(rel: (0,-4)))
    set-style(stroke: orange+2pt, fill: orange, mark: (end: "stealth"))
    line((-2,1.5),(0,0),)
    line((),(2,-.8))
  
    set-style(stroke: (paint: black, thickness: 1pt, dash: "dashed"), mark: none, fill: none)
    line((2,0),(rel: (-4,0)))
    set-style(stroke: (dash: none))
    arc((-1,0),start: 180deg, delta: -calc.atan(1.5 / 2),radius: 1, name: "a")
    content((to: "a.mid", rel: (0,.06)), [$theta_i$],anchor: "east", padding: .2)
    arc((1,0),start: 0deg, delta: -calc.atan(.8 / 2),radius: 1, name: "a")
    content((to: "a.mid", rel: (0,-.1)), [$theta_u$],anchor: "west", padding: .2)
  
    content((-.5,1.8),[$n_i$])
    content((.5,1.8),[$n_u$])
  })))

=== Totalreflektion
För två material, om $n_1 > n_2$ kommer enligt Snells lag
$ sin theta_2 = n_1 / n_2 sin theta_1  $
stundvis sakna lösning ty $n_1 slash n_2 > 1$ när $n_1 > n_2$ vilket innebär att ekvationen ibland kräver $sin theta_2 > 1$ för vissa val av $theta_1$ och detta är givetvis omöjligt. Då uppstår totalreflektion, dvs. allt ljus skickas tillbaka.

=== Approximation av Snells lag
Ty sin är jobbigt har man gjort en s.k. _paraxial_ approximation av Snells lag genom en Taylorutveckling av $sin theta$:
$ sin theta approx theta "för små" theta quad ==> quad n_1 theta_1 = n_2 theta_2 "för små vinklar" $

== Avbildning
- Grundläggande princip: ljuset från en punkt på det verkliga objektet passerar igenom ditt avbildningsningsystem och landar i en annnan punkt på bilden. Denna nya punkt kan beräknas individuellt för varje punkt på objektet.

=== Sfärisk gränsyta
#align(center, cetz.canvas({
  import cetz.draw: *
  line((-5,0),(5,0))
  let dot = (-4, 0)
  circle(dot,fill: black, radius: .1, name: "dot")
  content((),[objekt],anchor: "south", padding:.2)
  let angle = 30deg
  let r = 3
  let offset = -3
  arc((-r * calc.cos(angle) - offset, r * calc.sin(angle)), radius: r, start: 180deg - angle, delta: 2 * angle)
  line(
    (-r * calc.cos(18deg) - offset, r * calc.sin(18deg)),
    (-offset,0),
    name: "r"
  )
  content("r.mid", [$r$], anchor: "south", padding: .1)

  for a in (-18deg, 12deg, -6deg, 7deg, 24deg) {
    line(
      "dot",
      (-r * calc.cos(a) - offset, r * calc.sin(a)),
      (-dot.at(0),dot.at(1)),
      stroke: orange +.5pt
    )
  }

  cetz.decorations.brace((dot.at(0),-1.5),(0,-1.5), flip: true, amplitude: .3,name: "b1", content-offset: .5)
  content("b1.content", text(11pt)[$s = "Objektavstånd"$])

  cetz.decorations.brace((-dot.at(0),-1.5),(0,-1.5), flip: false, amplitude: .3,name: "b1", content-offset: .5)
  content("b1.content", text(11pt)[$s' = "Bildavstånd"$])
}))

Får sådana ytor gäller att
$ n / s + n' / s' = (n - n') / r $
samt att ytor konvexa från vänster har positiv radie och ytor konkava från vänster har negativ radie.

För räta linjer antas $r -> infinity$ vilket get
$ n / s + n' / s' = 0. $
  
== Tunna linser
#align(center, cetz.canvas({
  import cetz.draw: *
  line((-6,0),(6,0))
  let angle = 30deg
  let r = 3
  let offset = 2.6
  arc((-r * calc.cos(angle) + offset, r * calc.sin(angle)), radius: r, start: 180deg - angle, delta: 2 * angle, name: "a1")
  arc((r * calc.cos(angle) - offset, -r * calc.sin(angle)), radius: r, start: - angle, delta: 2 * angle, name: "a2")

  line((-5,0),"a1.20%","a2.80%",(5,0), stroke: orange)
  content((0,.4),[$d$])
  content((0,-.4),[$n$])
  content((-.5,1.3),[$r_1$])
  content((.6,1.3),[$r_2$])
  cetz.decorations.brace((-5,-1),"a1.84%",flip: true, name: "b1")
  content("b1.content",[$s$])
  cetz.decorations.brace((5,-1),"a2.17%",flip: false, name: "b1")
  content("b1.content",[$s'$])
  circle((-5,0),fill: orange,stroke:orange,radius:.1)
  circle((5,0),fill: orange,stroke:orange,radius:.1)
}))
- _Brytningsstyrkan_ $P$ för sfärisk gränsyta är
  $ n / s + n' / s' = p = (n' - n) / r $
  och mäts i Dioptrier (D).
- För sammansatta, tunna linser med sfäriska gränsytor lägger man ihopbrytstyrkorna
  $ P_"tot" = P_1 + P_2 = (n - 1) / r_1 + (1 - n) / r = (n-1)(1 / r_1 - 1 / r_2) $
  om vi antar att linsen befinner sig i luft med $n = 1$
- Vi har även att brytkraften för en sammansatt lins är för små vinklar alltid:
  $ P = 1 / f = 1 / s + 1 / s'. $

=== Objekt i oändligheten
#image("image (8).png", width: 50%)
- För objekt lång från linsen kommer strålar att upplevas som parallela. 
- Objekt som inte ligger i den optiska axeln kommer att ha en s.k. _synvinkel_ mot den axeln om de placeras mot oändligheten.

=== Fokallängd
#image("image (9).png", width: 50%)
- Fokallängd $f$ är definierat som bildavståndet vid oändligheten. Vi har enligt formeln ovan att
  $
    1 / s + 1 / s' &= P, quad s -> infinity\
    1 / s' &= P\
    f = &s' = 1 / P
  $
- Fokallängden blir negativ för negativa linser.
- Detta utgår från approximationen av Snells lag och strålarna möts inte perfekt för stora vinklar mot linsen.

== Kameraapproxminationen
- För en kamera, och liknande optiska system, gäller det att objektsavståndet $s >>$ fokallängden $f$. Dett ger följande:
  $ s >> f quad ==> quad s' approx f $
  eftersom bilden verkar att komma från oändligheten.
- Av detta följer även att om vi har en infallsvinkel $alpha$ på en ljustråle som passerar genom mitten av linsen (obrutet) och därmed med samma utfallsvinkel $alpha$ kommer denna landa på en höjd $h'$ från optiska axeln på sensorsidan av linsen. Denna höjd kan beräknas som
  $ tan alpha = h' / f quad ==> quad h' = f tan alpha $

== Bildkonstruktion med reell bild
#image("image (10).png", width: 80%)
- En reell bild är en sådan bild att ljusstrålarna faktiskt möts efter avbildningssystemet
  - Du kan alltså placera en skärm där och se bilden.
    - Ex. ögat, kamera, projektor.
  - Reella bilder är alltid upp-och-ned.
- Förstoringen på en bild uttrycks som
  $ M = h' / h = -s' / s $
- $M < 0$ ger upp-och-ned bild, $abs(M) > 1$ är en förstorad bild och $abs(M) < 1$ är en förminskad bild.

== Bildkonstruktion med virtuell bild
#image("image (11).png",width: 80%)
- En virtuell bild är en sådan där strålarna inte möts efter avbildningssystemet. 
  - För en positiv lins innebär detta att objektet är innanför fokallängden. 
  - Negativa linser skapar alltid virtuella bilder.  
  - Ex. mikroskop, kikare, teleskop, lupp, förstoringsglas, AR, VR.
- Detta innebär att bilden hamnar framför linsen, inte bakom som med en reell bild.
- För att konstrukera at sådan måste man även ta hänsyn till förlängningden av strålarna.
- Exemplet ovan är virtuell, förstorad och rättvänd.

== Bildkonstruktion med negativ lins
#image("image (12).png",width: 80%)
- För negativa fokallängder används fokalpunkterna omvänt från positiva linser.
- Återigen används strålförlängningarna för bilden ty den är virtuell.

== Bildkonstruktion med virtuellt objekt
#image("image (22).png",width: 80%)

== System av linser
#image("image (13).png")
- För beräkningar i system räknas varje linse sekventiellt med hänsyn till virtuell objekt, dvs. objekt som befinner sig på höger sida om linsen. Detta är då  hjälpsamt:
  $ 1 / f = 1 / s' + 1 / s quad ==> quad s' = (s f) / (s - f). $
- Bildstorleken räknas ut, för objekt i oändligheten, med kameraapproximationen ovan för första linsen för att få:
  $ h' = f_1 tan alpha $
  och för den andra linsens höjd används förstoringsformeln:
  $ h'' = h' dot M_2 = - h' dot s'_2 / s_2. $
  Förstoringen kan skrivas om med hjälp av formeln i punkt 1:
  $ M_2 = - s'_2 / s_2 = -((s_2 f_2)/(s_2 - f_2))/s_2 = -f_2 / (s_2 - f_2) $
  Sätter vi in detta i formeln för $h''$ får vi att
  $ h'' = underbrace(+f_2 / (f_2 - s_2) dot f_1,f_e) tan alpha $
  där vi kan kalla delen före $tan alpha$ för _effektiv fokallängd_ $f_e$ eftersom $h = f tan alpha$ för objekt i oändligheten. Detta kan också förenklas ännu lite till m.h.a. att $s_2 = d - f_1$ där $d$ är avståndet mellan linserna. Detta gäller då $s_1 = f_1$ och $s_2$ mäts från lins 2 så deras avstånde ska bort. Detta ger då formeln för effektiv fokallängd:
  #emph-box[$ f_e = (f_1 f_2)/(f_2 + f_1 - d) $ den ekvivalenta linsen hamnar mitt emellan det två linser som utgör den.]

== Lupp och förstoringsglas
#image("image (14).png")
#image("image (15).png")
- Luppar och förstoringsglas är designade att låta strålar för ett objekt att verka komma från oändligheten så att ögat kan fokusera. Annars säger man att ögan edanst kan betrakta föremål 25 cm bort.
- Då avbildningen verkar kommma från oändligehten kan vi inte använda vanliga förstoringsformeln så man kollar på infalls-/utfallsvinklarna i stället.
- Genom paraxialapproximationen ($tan theta approx theta$ för små vinklar) kan vi säga att
  $ w' = h / f $
  och
  $ w = h / q $
  där $q = 250 punct"mm"$. Vinkelförstoringen är hur mycket större $w'$ är jämfört med $w$ om man hade kollat på ögats minsta fokusavstånd 250 mm. Då får vi att
  $ m = w' / w = q / f $

== Teleskop
#image("image (19).png")
- Ett teleskop är ett sådant system som är _afokalt_, dvs. att den har både bild och objekt i oändligheten. Detta medför
  $ d_12 = f_1 + f_2 $
  för dess linser nr. 1,2.
- Förstoringen för ett teleksop kan uttryckas med vinklar som
  $ m = beta / alpha = h' / h = (f_1 tan alpha) / (f_2 tan beta) approx (alpha f_1) / (beta f_2) ==> m = f_1 / f_2 $

== Glasögon
- Ett närsynt öga är ett sådan som är för start och har ett fokalplan framför näthinnan. För att korrigera detta behövs en negativ lins med fokallängd lika med det avstånd där ett förmål upplevs skarpt:
  $ f = -s_"skarpt" = 1 / P $
- Ett långsynt öga är ett sådant med en för svag lins. Här krävs en positiv lins som har fokallängd av avstånden mellana näthinnan och där ljuset från ett objekt i oändligheten fokuseras:
  $ f = s_"överskott" = 1 / P $

= Vågoptik

== Interferens
På grund av ljusets slumpartade natur kan ljus från två källor aldrig att interferera på något meningsfullt sätt. Endast ljus från samma källa kan skapa interferens.

Interferensen i ljus uttrycks med den allmänna interferensformeln från ljudet:
$ I = I_1 + I_2 + 2 sqrt(I_1 I_2) cos (phi_1 - phi_2) $
där $phi_1, phi_2$ är generella våguttrycket för varje ny punktkälla av ljus från en uppdelning av ursprungskällan:
$
  phi_1 &= k_1 r_1 - omega t + delta\
  phi_2 &= k_2 r_2 - omega t + delta
$
där tidsfrekvensen $omega$ och fasförskjutningen $delta$ alltid är samma för båda käller ty de kommer från samma ursprung. 

Anledningen att vågtalen $k_1,k_2$ inte är samma är att uppdelningen kan ha lett till att de två strålarna åker genom olika material vilket förändrar deras våglängd för att hålla hastigheten rätt.

Vågtalen beräknas som
$ k = (2 pi)/lambda dot n $
där $n$ är brytningsindex, eftersom våglängden för ljus i ett givet material med $n != 1$ ges av $lambda_n = lambda_0 slash n$.
Allts åför två källor: $k_1 = 2 pi dot n_1 slash lambda$ och $k_2 = 2 pi dot n_2 slash lambda$. Där $lambda$ utan index är i vakum.

Insättning i interferensformeln ger att
$ phi_1 - phi_2 = (2 pi n_1) / lambda dot r_1 - (2 pi n_2) / lambda dot r_2 $
alltså
$ phi_1 - phi_2 = (2 pi) / lambda underbrace((n_1 r_1 - n_2 r_2),"OPD, optisk vägskillnad"). $ 

Interferensen kommer då leda till ett maximum om $cos$ termen maximeras dvs. att
$ phi_1 - phi_2 = m dot 2 pi = (m - 1 /2) dot 2 pi, quad m in ZZ $
vilket medför att
$ n_1 r_1 - n_2 r_2 = m dot lambda $
och likadant för minimum vid minimering av $cos$ som
$ phi_1 - phi_2 = - pi + m dot 2 pi, quad m in ZZ $
vilket sedan ger
$ n_1 r_1 - n_2 r_2 = (m - 1 / 2) dot lambda $

== Interferens i tunna skikt
- Detta användbart ifall man vill minska reflektioner i ett annars reflektivt material, dvs. en antireflexbehandling.
- "Tunna" skikt är i storleksordning $lt.tilde 1 punct mu"m"$.
#image("image (17).png", width: 80%)
För att räkna ut interferensen använder vi den optiska vägskillnaden (dvs. vägen gånger brytningsindex). Mätningen sker vid där den strålen som har färdats längst lämnar skiktet och på motsvarande parallelställe på den strålen som färdats minst.

Vägen för stråle 1 beräknas med trigonometri som
$ r_1 = y sin i = underbrace(2 d tan i',y) dot underbrace(sin i, n_f sin i') = 2 d n_f dot tan i' sin i' $
vilket vi får genom snells lag ty $n_0 sin i = n_f sin i'$ givet brytningsindex $n_f$ för skiktet och $n_0 = 1$ för luften. Vägen för stråle 2 blir då
$ r_2 = 2 dot d / (cos i') $
Sen gör vi om detta till optiska vägskillnad
$ "OPD" = n_f r_2 - n_0 r_1 = n_f dot 2 dot d / (cos i') - 2 d n_f tan i' sin i'\ = 2 d n_f (1 / (cos i') - (sin^2 i') /( cos i')) = 2 n_f d dot (cos^2 i') / (cos i') = 2 n_f d cos i' $
#emph-box[$ "OPD" = 2 n_f d cos i' #text(fill: green.darken(40%))[$ (+ lambda / 2) $] $ för tunna skikt av storleksordning $d lt.tilde 1 punct mu"m"$ och där $n_f$ är brytningsindex i skitet samt om yttre materialet är luft med $n_0 = 1$. I detta fall är $i'$ den brutna vinkeln av ljuset som faller in i skiktet enligt bilden ovan.

Faskifte med $lambda slash 2$ läggs till om en, men inte båda, av reflektionerna sker mot ett tätare medium. Detta beror på att reflektion mot tjockare material ger ett faskifte på $lambda slash 2$. Alltså: $+ lambda / 2$ om $n_0 < n_f$ men $n_f > n_g$ eller vice versa för exemplet i bilden.
]

== Antireflexbehandling
- För att skapa en antireflexbehandling vill man att OPD för skiktet skall vara $1 / 2 lambda$.
- För vinkelrätt ljus kan man göra ett bra specialfall: OPD är $2d$ för vinkelrätt ljus bryts inte så $d = 1 / 4 lambda$ för rätt faskifte (givet att fasförskjutande reflektion inte sker). Man kan även säga att $ n_f = sqrt(n_0 dot n_g) $ där $n_g$ är glasets, eller annars ytan bakom skiktets, brytningsindex och $n_f$ är skiktets brytningsindex. Detta beror på följande formel för reflektansen (andel ljus reflekterat) av vinkelrätt ljusinfall:
  $ R = abs((n_1 - n_2) / (n_1 + n_2))^2 $
  där $n_1$ är det yttre mediet och $n_2$ är det inre (glaset, skiktet vid infall). För total reflektans 

== Diffraktion
#align(center,cetz.canvas({
  import cetz.draw: *
  line(
    (-.4,2),
    (-.4,2.5),
    (-2.5,2.5),
    (-2.5,-2),
    (2.5,-2),
    (2.5,2.5),
    (.4,2.5),
    (.4,2),
    (2,2),
    (2,-1.5),
    (-2,-1.5),
    (-2,2),
    (-.4,2)
  )
  line((-.4,2.25),(.4,2.25),mark: (symbol: "stealth"),fill: black, name: "a")
  content("a.mid",anchor: "south", padding: .4, [$a$])
  
  let angle = 30deg
  let dr = .6

  for i in range(3) {
    line((-2.5,2.5+3*dr - i*dr),(2.5,2.5+3*dr - i*dr),stroke: red)
  }
  
  line((-1.5,2.5+dr),(-1.5,2.5+2*dr),mark: (symbol: "stealth"),fill: black, name: "a")
  content("a.mid",anchor: "west", padding: .3, [$lambda$])

  
  for i in range(5) {
    arc(
      (((i)*(dr)+2)*calc.cos(-90deg-angle/2),(i*dr+.2)*calc.sin(-90deg-angle/2)+1.8),
      start: -90deg-angle/2,
      delta: angle,
      radius: i*dr+2,
      stroke: red
    )
  }
  line((-.4,2),(-.4,-1.5),stroke: (dash: "dashed"))
  line((-.4,2),(rel: (radius: 3.64, angle: -90deg - angle / 2)),stroke: (dash: "dashed"))
  arc((((2)*(dr)+2)*calc.cos(-90deg-angle/2),(2*dr+.2)*calc.sin(-90deg-angle/2)+1.8),start: -90deg-angle/2, delta: 8deg,radius: 2*dr+2,name: "a")
  content("a.mid",anchor: "east",padding: .4,[$theta$])
}))

- Huygen upptäckte att diffraktionsvinkeln $theta$ förhåller sig till öppningens storlek som $ sin theta approx lambda / a ==> theta approx lambda / a quad "för små vinklar." $
- Exempelvis som i en hamnbassäng ovan så är storleksordningen $lambda approx 10 punct dash.en 20 punct "m"$ och $a approx 20 punct dash.en 30 punct "m"$. Detta ger $sin theta approx 0.3 punct dash.en 1$
  - Diffraktion mellan bredare splater som öar ger ingen effekt i praktiken eftersom $lambda approx 10 punct dash.en 20 punct "m"$ medan $a gt.tilde 1 punct "km"$ som ger $theta lt.tilde 0.01$.

== Diffraktion i spalt
- Minimum vid $sin theta = m dot lambda / a$ där $m in ZZ \\ {0}$ 

== Difraktion i cirkel
- Första minimum hamnar på $sin theta = 1.22 dot lambda / 2$
  - Detta är viktigt eftersom diffraktionsmönstret vid cirklar kallas för _airy disc_ och dess radie är avståndet från mitten till första minimum och betecknas $r_a$.

== Upplösning i ex. kamera
Betrakta en kameralins med öppningsdiameter $D$. Enligt cirkeldiffraktion kommer denna att sprida ljuset i en skiva vars radie är definieras ovan som $ r_a = sin theta dot r approx theta r quad "för små vinklar" $
och där $r$ ör avstånd från hål till skärm. För kameralinsen, då vi betraktar små vinklar i detta fall ges
$ 
  theta approx 1.22 lambda / D quad ==> quad r_a approx 1.22 lambda / d dot s' 
$
där $s'$ är bildavståndet.

Upplösning i detta sammanhang är ifall två punkter kan urskiljas som olika eller inte. För detta krävs att _Rayleigh-kriteriet_ uppfylls, dvs. att två punkter är urkiljbara, upplösta, om först min. för den enas _airy disk_ sammanfaller med den andras mitt.

Rent praktiskt gäller följande om avståndet mellan två punkters mittpunkter på bildskärmen $h'$ får vi att $h' > r_a$ är väl upplöst, $h' = r_a$ är gränsfall (Rayleigh) och $h' < r_a$ är inte upplöst.

== Gitter
- Om spaltavståndet i ett gitter är $d$ kommer varje maximipunkt ligga på $sin theta  = m dot lambda / d quad <==> d sin theta = m lambda$ där $m in ZZ$.
- Som ovan uppstår första diffraktionsmin. vid $sin theta = lambda / a$ i en enkelspalt, vilket är den största övertonen i ett gitter. Här är $a$ spaltbredden i gittret.
- Eftersom spaltavstånd $d$ mäts över både öppning och spaltvägg kommer alltid $d > a$ vilket betyder att $1 / a > 1 / d$ och därmed kommer åtminstone max. vid $lambda / d$ synas bra.
- Notera att vinklarna beror på våglängd och delar upp ljus i sitt spektrum.
- Vinklar ökar också med tätare gitter, mindre $d$

== Polarisation
Det elektiska och magnetiska fältet i en EM-våg är egentligen en vektor som har en riktning vilket är polarisationen. Ljus från "naturliga" källor är sällan polariserat. Opolariserat ljus har ingen särskild svängningsriktning.

Ta det elektriska fältet till en början det kan delas in i x- och y-komponent enligt
$ va(E) = vec(E_x = A_x sin(k z - omega t + delta_x), E_y = A_y sin(k z - omega t + delta_y)). $
de två komponenterna kan ha olika amplitud och fas, men måste ha samma frekvens/våglängd.

=== Linjär polarisering
Om vi har att $ delta_x - delta_y = m pi, quad m in ZZ $ gäller det att båda komponenter befinner sig på "samma ställe" men på "motsatt sida" av sin våg och kommer därför svänga i en linje om man plottar x- och y-komponent i planet. Alltså:
#align(center, cetz.canvas({
  import cetz.draw: *
  set-style(stroke: black+1.5pt, mark: (end: "stealth"))
  line((-2.5,0),(2.5,0))
  content((),[$ E_x $], anchor: "south-west")
  line((0,-2.5),(0,2.5))
  content((),[$ E_y $], anchor: "north-west", padding: (x: .2))
  set-style(stroke: orange+3pt, mark: none)
  line((angle: -90deg-45deg, radius: 1),(angle: 45deg, radius:1))
}))

=== Cirkulär polarisering
Om vi i stället har att $ delta_x - delta_y = pi / 2 + m pi, quad m in ZZ $ får vi att komponeneterna befinner sig på "motsatt ställe" på vågen så när man plottar de blir det en cirkel:
#align(center, cetz.canvas({
  import cetz.draw: *
  set-style(stroke: black+1.5pt, mark: (end: "stealth"))
  line((-2.5,0),(2.5,0))
  content((),[$ E_x $], anchor: "south-west")
  line((0,-2.5),(0,2.5))
  content((),[$ E_y $], anchor: "north-west", padding: (x: .2))
  set-style(stroke: orange+3pt, mark: none)
  circle((0,0))
}))

=== Elliptisk polarisering
När fasskillnaden inte är jämna multipler som ovan kommer polariseringen att ta en elliptisk form som ett mellanting mellan linje och cirkel. 

== Polarisationsfilter
Polarisationsfilter består av tunna ledande linjer. För att ett filter skall funka krävs det att:
- Spaltbredden $d < lambda$
- Linjerna är av ledande material.

Ljus som är vinkelrätt mot de ledande linjerna släpps igenom. Ljus som är parallel med linjerna (verkar passera genom "spalterna") kommer absorberas av elektronerna i de ledande trådarna.

=== Passage genom filtret
- För opolariserat ljus som passerar ett polarisationsfilter gäller det att intesiteten $I_"efter" = I_0 slash 2$. 
- För linjärt polariserat ljus som passerar ett filter beror intensiteten av ljuset på vinkeln mellan polariseringen och genomsläppsriktningen som:
  $ I_"efter" = I_0 dot cos theta $
#image("image (18).png")

== Dubbelbrytning
- Ett material som har olika brytningsindex för olika polariseringar kallas fördubbelbrytande.
- För dubbelbrytande material skiljer man på brytning för _ordinärt_ ljus med brytningsindex $n_"o"$ för ljus med den "föredragna" polarisationen och sedan _extraordinär_ brytning med index $n_"eo"$ för allt annat ljus.
- För dubbelbrytande material är optisk vägskillnad
  $ "OPD" = (n_"oe" - n_"o")d $
- Fasskillnaden för materialen är liknande och uttrycks
  $ delta phi = (2 pi) / lambda d (n_"eo" - n_"o") $

== Reflektans
#wrap-content(image("image (21).png", width: 60%), align: top+left, inset: 0pt, column-gutter: 0pt, row-gutter: 0pt,)[Reflektansen är definierad som
$ R = I_R / I_"in". $
Motsatsen till refletans är transmittans och är alltid det som blir över efter reflektion:
$ I_"in" = I_R + I_T. $

Beroende på hur ljuset är polariserat kommer reflektion att ske olika. Man skilar på s- och p-polariserat ljus. S-polariserat, eller vinkelrätt polariserat, ljus svänger vinkelrätt mot infallsvinkeln medan p-polariserat eller parallelpolariserat svänger i samma riktning som vinkeln.
Formlerna för detta blir 
$ R_s = (sin^2 (i - i')) / (sin^2 (i + i')) quad quad quad R_p = (tan^2  (i-i')) / (tan^2 (i + i')) $]

För opolariserat ljus tar man medelvärdet av dessa:
$ R = (R_s +  R_p) / 2. $
Sedan för små-vinkel-approx kan man förenkla uttrycken till
$ R_s approx (i - i')^2 / (i + i')^2 = (i - n / n' i)^2 / (i + n / n' i)^2 = ((n' - n) / (n' + n))^2 approx R_p $
eftersom $tan theta approx sin theta approx theta$ för små vinklar. Detta ger i sin tur den allmänna reflektansformeln för vinkelrätt infallande ljus:
#emph-box[$ R = ((n'-n)/(n'+n))^2 $]

=== Brewstervinkel
Om man kollar på hur reflektansen ser ut för stora vinklar får man
#align(center, cetz.canvas({
  let n = 1
  let np = 1.66
  plot.plot(size: (8,5),axis-style: "left",y-tick-step: none,x-tick-step: none,y-min: -.1,y-max:1.1,x-min: -.1,legend: auto,
  y-ticks: (0,0.5,1),
  x-ticks: ((0,[$ 0degree $]),(calc.pi / 4, [$ 45degree $]),(calc.pi / 2, [$ 90degree $]),(0.98027,[$ i_b $])),
  {
    plot.add(domain: (0.000000001,calc.pi/2),label: [$ (sin^2 (i - i')) / (sin^2 (i + i')) $],x => {
      calc.pow(calc.sin(x - n / np *x) / calc.sin(x + n / np * x),2)
    })
    plot.add(domain: (0.000000001,calc.pi / 2),label: [$ (tan^2 (i - i')) / (tan^2 (i + i')) $],x => {
      calc.pow(calc.tan(x - n / np * x) / calc.tan(x + n / np * x),2)
    },style: (stroke: (dash: "loosely-dash-dotted", paint: red, thickness: 1.5pt, cap: "round")))
    plot.add(domain: (-.1,calc.pi / 2),x => {0},style: (stroke: (paint: black, dash: "dashed")))
    plot.add-vline(0.98027, style: (stroke: (paint: black, dash: "dashed")))
  })
}))
Vid den speciella s.k. _Brewstervinkeln_ $i_b$ får man att $R_p=0$ vilket betyder att man endast reflekterar s-polariserat ljus. Kriterier för detta är att
$ tan^2(i_b + i'_b) = 0 quad ==> quad i_b + i'_b = 90degree. $
Från Snells lag får vi sen att
$ n sin i_b = n' sin i'_b = n sin (90degree - i_b) = n' cos i_b $
alltså att
$ (sin i_b) / (cos i_b) = n' / n quad ==> quad tan i_b = n' / n. $
  
= Formelsamling
#align(center,grid(columns: (1fr,2fr),inset: 12pt, align: horizon+right,stroke: 1pt+black,
  [*Vågtal*],[$ k = (2 pi) / lambda $],
  [*Vinkelfrekvens*],[$ omega = 2 pi f $],
  [*Våghastighet*],[$ c = lambda f $],
  [*Partikelförskjutning*],[$ S(x,t) = S_0 sin(k x - omega t + delta) $],
  [*Intensitet*\ ($rho c$ är materialkonstant)],[$ I = P / A = 1/2 S_0^2 omega^2 rho c = P_"max"/(2 rho c) $],
  [*Ljudintensitetsnivå*\ ($I_0 = 10^(-12) punct "W" slash "m"^2$)],[$ beta = 10 dot log_10 (I / I_0) $],))

#align(center, grid(columns: (1fr, auto), inset: 12pt, align: horizon+right, stroke: 1pt+black,
  [*Elektriskt fält*], [$ va(E) = va(F)/q_t <==> va(F_t) = q_t va(E) $],
  [*$ef$-fält runt en punktladdning*], [$ ef = 1 / (4 pi epsilon_0) dot q / r^2 dot va(e_r) $],
  [*$E$-fält runt en linjeladdning*\ $lambda punct ["C"/"m"]$ är linjeladdningsdensiteten], [$ E = lambda / (2 pi epsilon_0 r) $],
  [*$E$-fält för en plan ytladdning*\ $sigma punct ["C" / "m"^2]$ är ytladdningsdensiteten], [$ E = sigma / (2 epsilon_0) "(oberoende av avstånd)" $],
  [*Laddningars additivititet*], [$ ef_"tot" = sum_i ef_i = cases(sum_i 1 / (4 pi epsilon_0) dot q_i / r_i^2 dot va(e_r_i) "diskret", 1 / (4 pi epsilon_0) integral (dif q_i) / r_i^2 dot va(e_r_i) "kontiuerlig") $],
  [*Elektriskt flöde ur en gaussyta $S$*], [$ Phi_E = integral.double_S ef dif va(A) $],
  [*Kapacitansen av en parallell plattkondensator*], [$ C = (A epsilon_0) / (d) $],
  [*Energi i en kondensator*], [$ 1 / 2 C V^2 = 1 / 2 Q V = 1 / 2 Q^2 / C $]
))