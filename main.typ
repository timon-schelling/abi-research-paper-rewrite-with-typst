#import "template.typ": *

#show: project.with(
  title: "Pi and seek - Pi ohne Kreis? Wird Pi ohne den Zusammenhang mit der Geometrie eines Kreises verwendet?",
  authors: (
    "Timon Schelling",
  ),
  date: "April 27, 2023",
  bib: "refs.bib",
  bib-title: "Literatur",
)

#let color0 = rgb("#000000")
#let color1 = rgb("#C10000")
#let color2 = rgb("#149900")
#let color3 = rgb("#0F00B6")
#let color4 = rgb("#A3006A")
#let color5 = rgb("#B6A400")
#let color6 = rgb("#BD4800")
#let color7 = rgb("#8617C2")
#let color8 = rgb("#00ADA8")
#let color9 = rgb("#81BD00")

#let bgcolor0 = color0.lighten(85%)
#let bgcolor1 = color1.lighten(85%)
#let bgcolor2 = color2.lighten(85%)
#let bgcolor3 = color3.lighten(85%)
#let bgcolor4 = color4.lighten(85%)
#let bgcolor5 = color5.lighten(85%)
#let bgcolor6 = color6.lighten(85%)
#let bgcolor7 = color7.lighten(85%)
#let bgcolor8 = color8.lighten(85%)
#let bgcolor9 = color9.lighten(85%)

#let default_coordinate_system(body) = rect(width: 240pt, height: 240pt, inset: 0pt, stroke: none)[
  #place(center + horizon, help_lines())
  #place(center + horizon, axes())
  #place(right + horizon, dy: -8pt, [$ x $])
  #place(center + top, dx: 8pt, [$ y $])
  #place(center + horizon, rect(width: 200pt, height: 200pt, inset: 0pt, stroke: none)[
    #body
  ])
]

= Einleitung

Seit die Idee der Kreiszahl $pi$ (sie wird im Weiteren noch genauer definiert und analysiert) sich in der Mathematik etabliert hat, wurden (und werden) immer wieder Methoden entwickelt (absichtlich und auch zufällig), um ihren Wert mit einer gewissen Präzision zu berechnen. In der Bibel (wichtigste Textsammlung des Judentums und Christentums) ist beispielweise indirekt ein Wert von $3$ für $pi$ erwähnt. #cite("ARTICLE:The-Quest-for-Pi:1996") Eine der frühsten erhaltenen Aufzeichnungen eines Wertes für die Kreiszahl $pi$ geht ungefähr auf das Jahr $-2000$ ($2000$ BC. / $2000$ v. Chr. nach dem Gregorianischen Kalender) zurück und beträgt nach Annäherung der Babylonier $3 + frac(1, 8)$. Zu den moderneren Formen der Berechnung von $pi$ zählt unter anderem der Chudnovsky-Algorithmus; $pi$ ist darin wie folgt definiert. #cite("ARTICLE:A-DETAILED-PROOF-OF-THE-CHUDNOVSKY-FORMULA-WITH-MEANS-OF-BASIC-COMPLEX-ANALYSIS:2020")


$ frac(1, pi) = 12 sum^infinity_(k=0) frac((-1)^k (6k)! (545140134k + 13591409), (3k)!(k!)^3 640320^(3k + 3/2)) $


Wie beim Chudnovsky-Algorithmus ist es in der Mathematik oft nicht klar ersichtlich ob und wenn, welche Verbindung zwischen der Verwendung von $pi$ und der Geometrie des Kreises besteht. Da jedoch $pi$ erst durch die Geometrie des Kreises definiert ist, kann sachlogisch die Hypothese aufgestellt werden, dass wenn $pi$ auftaucht, ein Zusammenhang mit der Geometrie des Kreises bestehen müsste. #cite("VIDEO:Why-is-pi-here-And-why-is-it-squared-A-geometric-answer-to-the-Basel-problem:2018") Den Chudnovsky-Algorithmus zu erklären, würde weit über den Rahmen dieser Arbeit hinaus gehen. #cite("ARTICLE:A-DETAILED-PROOF-OF-THE-CHUDNOVSKY-FORMULA-WITH-MEANS-OF-BASIC-COMPLEX-ANALYSIS:2020") Aus diesem Grund werden weniger komplexe Sachverhalte als Beispiel heran gezogen, um die zuvor erwähnte und im Weiteren ausformulierte Hypothese zu überprüfen.


== Ideenfindung

Das Thema dieser Arbeit ist aus der Methode, die Kreiszahl $pi$ zu berechnen, die erstmalig vom Mathematiker Gregory Galperin in seiner Arbeit "PLAYING POOL WITH PI (THE NUMBER PI FROM A BILLIARD POINT OF VIEW)" vorgestellt wurde, abgeleitet. #cite("ARTICLE:PLAYING-POOL-WITH-PI:2003", "VIDEO:The-most-unexpected-answer-to-a-counting-puzzle:2019") Diese Methode soll es ermöglichen, $pi$ bis zu jeder Genauigkeit/Präzision zu berechnen, ohne technische Hilfsmittel zu nutzen. #cite("ARTICLE:PLAYING-POOL-WITH-PI:2003") Ihre genaue Funktionsweise wird im Hauptteil dieser Arbeit näher erläutert.

== Forschungsfrage

Pi ohne Kreis? Wird Pi ohne den Zusammenhang mit der Geometrie eines Kreises verwendet? (Existieren Sachverhalte, in denen Pi ohne Zusammenhang mit der Geometrie eines Kreises Verwendung findet?)

=== Warum stellt sich die Frage?

Die von Gregory Galperin in seinem Artikel "PLAYING POOL WITH PI (THE NUMBER PI FROM A BILLIARD POINT OF VIEW)" vorgestellte Methode, um Stellen von $pi$ zu berechnen(die gestellte Frage nach der Anzahl an Kollisionen zweier Billardkugeln in einem dynamischen System), kann mit Hilfe des Energie- und Impulserhaltungssatzes in ein geometrisches Problem umgewandelt werden, das tatsächlich einen Kreis enthält #cite("ARTICLE:Throwing-Pi-at-a-wall:2019", "VIDEO:How-colliding-blocks-act-like-a-beam-of-light-to-compute-pi.:2019", "ARTICLE:PLAYING-POOL-WITH-PI:2003", "VIDEO:Why-do-colliding-blocks-compute-pi:2019") (der genaue Weg wird im Hauptteil dieser Arbeit erläutert und nachvollzogen). Aus diesem Grund stellt sich die Frage, ob nicht bei allen Verwendungen von $pi$ auf eine solche oder ähnliche Art ein Zusammenhang zur Geometrie des Kreises mathematisch bewiesen werden kann.


=== Welche Relevanz hat die Frage?

Im Fachbereich der Philosophischen Mathematik wird versucht, Gegenstand, Voraussetzungen, Natur und Methoden der Mathematik zu ergründen und zu verstehen. Es werden unter anderem Überlegungen angestellt, ob die Mathematik ein von Menschen erdachtes Konzept ist oder ob Menschen sie lediglich entdeckt haben, gerade entdecken oder noch entdecken werden. #cite("BOOK:New-Directions-in-the-Philosophy-of-Mathematics:1998") Wenn $pi$ nicht nur in einem direkten oder indirekten Zusammenhang, mit der Geometrie bewiesen werden kann, liegt die Vermutung nahe, dass die Menschen ihre Bedeutung nicht oder nicht in Gänze verstehen, $pi$ in Verbindung mit Kreisen nur ein Indiz für eine tiefgreifendere mathematische Wahrheit ist. Wir als Menschheit (genauer Mathematiker) haben $pi$ im Zusammenhang mit Kreisen definiert. Wenn $pi$ demnach an anderer Stelle ohne Verbindung zu unserer menschlichen Definition Verwendung findet, spricht eben diese Tatsache eher für eine von Menschen entdeckte Mathematik. Das Ergebnis dieser Arbeit wird demnach als Argument für die eine oder andere Perspektive benutzt werden können, kann in jedem Fall zu einem besseren Verständnis der Mathematik im Allgemeinen und der Zahl $pi$ im Speziellen beitragen.

== Hypothese

Die Zahl $pi$ ist definiert als das Verhältnis des Durchmessers eines Kreises und seines Umfanges. Demnach muss ihre Verwendung immer einen Zusammenhang mit jenem Verhältnis und damit zur Geometrie des Kreises haben. Die Frage ist nicht ob, sondern auf welchem Wege (über welche mathematischen Zusammenhänge und mathematischen Fachgebiete) solch ein Zusammenhang besteht.

== Abgrenzungen

Es geht in dieser Arbeit nahezu ausschließlich um den Zusammenhang zwischen $pi$ und der Geometrie des Kreises. Die Geschichte der Zahl $pi$ wird zwar erwähnt, es wird dabei allerdings keineswegs Vollständigkeit angestrebt, sondern eher darauf gedachtet, welche Teile helfen, die Verständlichkeit der restlichen Arbeit zu verbessern. Gleiches gilt für den Kreis, seine Geometrie und Geschichte. Es werden auch Grundlagen aus anderen Feldern der Mathematik vorausgesetzt, wie beispielsweise die Analysis (besonders Integralrechnung) oder Grundlagen der Geometrie (Satzgruppe des Pythagoras, Strahlensätze, Kreiswinkelsatz).

== Methoden

In der vorliegenden Arbeit wird versucht, deduktiv die schon erläuterte Hypothese zu überprüfen, indem an einzelnen Sachverhalten ihre Anwendbarkeit mathematisch bewiesen wird. Es werden allerdings auch Beweise anderer Autoren in Folge von Literaturarbeit mit in die Auswertung einbezogen. Die Auswahl der Sachverhalte ist dabei nicht nach einem festgelegten Schema erfolgt, vielmehr wurde bei der Auswahl darauf geachtet, dass sich die Ergebnisse leicht von etwaigen Rezipienten nachvollziehen lassen. Allerdings ist wichtig anzumerken, dass die gewählten Sachverhalte dennoch als repräsentativ eingestuft werden, denn die Rechereche wurde ergebnissoffen durchgeführt, bedeutet es wurde gleichermaßen versucht, die These zu belegen, als auch sie zu widerlegen. Für die Fallanalyse wurde im Voraus festgelegt, in welche Kategorien einzelne Sachverhalte eingeordnet werden und wie diese zu bewerten sind. Jede Kategorie, die dabei mindestens einmal auftrat, wurde mindestens ebenso häufig mit einem Beispiel in der Arbeit repräsentiert.

= Hauptteil

== Mathematische Grundlagen

Im folgenden Teil werden mathematische Grundlagen, die für die weitere Arbeit von besonderer Bedeutung, sind näher beleuchtet. Es werden auch andere allgemein anerkannte mathematische Grundlagen und Methoden  vorausgesetzt.


=== Division

Um die Kreiszahl $pi$ zu definieren, wird neben Grundlagen der Geometrie noch die Rechenart der Division benötigt. Sie ist eine der vier Grundrechenarten der Mathematik, genauergenommen der Arithmetik, definiert als Umkehroperation der Multiplikation. Es wird ein Dividend durch einen Divisor dividiert, das Resultat nennt sich Quotient. #cite("WEB:Division-Wolfram-Research:2021")


$ underbrace(a, "Dividend") : underbrace(b, "Divisor") = underbrace(c, "Wert des Quotienten") $

Wenn eine Zahl $a$ und eine Zahl $b$ mulltipiziert werden, ergibt sich aus dem Ergebnis $c$ durch Dividieren durch $a$ wieder $b$ und durch Dividieren durch $b$ wieder $a$, sofern $a$ und $b$ nicht Null sind. #cite("WEB:Division-Wolfram-Research:2021") Es gilt demnach das folgende Gleichungssystem.

$
a dot b    &= c  \
frac(c, a) &= b  \
frac(c, b) &= a  \
a          &!= 0 \
b          &!= 0 \
$

Diese Erkentnisse über die Division reichen aus, um im Folgenden eine formale Definition von $pi$ zu konstruieren.

=== Kreiszahl Pi

Um $pi$ als Kreiszahl zu begreifen, fehlt an dieser Stellen noch das Verständnis der Geometrie des Kreises. Aus diesem Grund wird im Folgenden seine Definition genauer untersucht. Ein Kreis ist definiert als zweidimensionale Fläche. Sie wird begrenzt durch eine konstant gekrümmte Linie, verlaufend auf allen Punkten, die in einer Entfernung von $r$ von einem Mittelpunkt $O$ liegen. Die Strecke $r$ wird Radius genannt. Der zweifache Radius nennt sich Durchmesser $d$. Er beschreibt eine Strecke verlaufend durch den Mittelpunkt und begrenzt an beiden Enden durch einen Punkt, der auf der Begrenzung des Kreises liegt. #cite("BOOK:Einfuehrung-Mathematik-Primarstufe-Geometrie:2015", "BOOK:Pi-Unleashed:2001", "BOOK:A-History-of-Pi:2015") Diese Definition besteht schon sehr lange, schon Euklid verwendete sie. Er soll den Kreis wie folgt definierte haben: \glqq{}A circle is a plane figure bounded by one curved line, and such that all straight lines drawn from a certain point within it to the bounding line, are equal. The bounding line is called its circumference and the point, its centre.\grqq{} #cite("BOOK:Euclid-books-I-II:1883") Diese Definition für einen Kreis mit dem Radius $r = 1$ kann grafisch folgendermaßen dargestellt werden. #cite("BOOK:Einfuehrung-Mathematik-Primarstufe-Geometrie:2015", "BOOK:Pi-Unleashed:2001", "BOOK:A-History-of-Pi:2015")

#figure(
  [
    #rect(width: 200pt, height: 200pt, inset: 0pt, stroke: none)[
      #place(center + horizon, circle(radius: 100pt, stroke: color0))
      #place(center + horizon, line(length: 200pt, angle: 90deg, stroke: color1))
      #place(center + horizon, line(start: (50%, 0%), end: (100%, 0%), stroke: color2))
      #place(center + horizon, circle(radius: 2pt, fill: color3))
      #place(center + horizon, dx: 8pt, dy: -8pt, text(fill: color3, [$ O $]))
      #place(left + horizon, dx: 4pt, [$ c = d pi = 2 pi $])
      #place(center + horizon, dx: 25%, dy: 7pt, text(fill: color2, [$ r = 1 $]))
      #place(center + horizon, dx: 15%, dy: -25%, text(fill: color1, [$ d = 2 r = 2 $]))
    ]
  ],
  caption: [
    Kreis mit dem Radius $r = 1$
  ]
)

Mathematiker entdeckten eine besondere Eigenschaft des Kreises: ein jeder Kreis mit einem beliebig gewählten Radius $r$ ($r > 0$) und damit auch Durchmesser $d$, hat einen Umfang $c$ ($c$ für das englische Wort "Circumference"), der dem Durchmesser $d$ multipliziert mit einem konstanten Faktor entspricht. Dieser Faktor wurde über die Zeit als Kreiszahl $pi$ standartisiert. $pi$ entspricht demnach dem Verhälnis von Umfang $c$ und Durchmesser $r$. #cite("BOOK:A-History-of-Pi:2015", "BOOK:Pi-Unleashed:2001", "ARTICLE:The-Tau-Manifesto:2010")

$
d dot pi &= c space.quad | : d \
pi       &= frac(c, d)         \
$
Wird an gleicher Stelle statt des Durchmessers $d$ der Radius $r$ gewählt, erhält man die ebenfalls standardisierte Zahl $tau$. #cite("ARTICLE:The-Tau-Manifesto:2010")


$
r dot tau & = c space.quad | : r \
tau       & = frac(c, r)         \
$


$tau$ entspricht exakt dem Zweifachen von $pi$. #cite("ARTICLE:The-Tau-Manifesto:2010")

$
tau                 & = frac(c, r)                & | dot frac(1, 2) \
tau dot frac(1, 2)  & = frac(c, r) dot frac(1, 2) &                  \
frac(tau, 2)        & = frac(c, 2r)               & | dot 2r         \
frac(tau, 2) dot 2r & = c                         &                  \
frac(tau, 2) dot 2r & = c = pi dot d              &                  \
frac(tau, 2) dot 2r & = pi dot d                  &                  \
frac(tau, 2) dot d  & = pi dot d                  & | : d            \
frac(tau, 2)        & = pi                        & | dot 2          \
tau                 & = 2pi                       &                  \
$

Aus dieser Erkenntnis folgt, in der Mathematik kann, wann immer $2pi$ Verwendung findet, statt seiner auch $tau$ verwendet werden. Für diese Arbeit ist vorallem interessant, dass $tau$ genau wie $pi$ eine direkte Verbindung zu Kreisen hat, wir $tau$ wie $pi$ erst über die Geometrie des Kreises definieren. #cite("ARTICLE:The-Tau-Manifesto:2010")

$pi$ ist ebenfalls essenziell um den Flächeninhalt eins Kreises zu berechnen, denn der Radius $r$ eines Beliebigen Kreises zum Quadrat $r^2$, multipliziert mit $pi$ entspricht dem Flächeninhalt $A$ des Kreises. #cite("ARTICLE:AREA-INSIDE-THE-CIRCLE-INTUITIVE-AND-RIGOROUSPROOFS:2017") Dies kann wie folgt grafisch dargestellt werden.

#figure(
  [
    #rect(width: 200pt, height: 200pt, inset: 0pt, stroke: none)[
      #place(center + horizon, circle(radius: 100pt, fill: bgcolor0, stroke: color0))
      #place(center + horizon, line(start: (50%, 0%), end: (100%, 0%), stroke: color2))
      #place(center + horizon, circle(radius: 2pt, fill: color3))
      #place(center + horizon, dx: 8pt, dy: -8pt, text(fill: color3, [$ O $]))
      #place(center + bottom, dy: -25%, [$ A = pi r^2 = pi 1^2 = pi $])
      #place(center + horizon, dx: 25%, dy: 7pt, text(fill: color2, [$ r = 1 $]))
    ]
  ],
  caption: [
    Flächeninhalt $A$ eines Kreises mit Radius $r = 1$
  ]
)

Schon Archimedes erkannte und bewies mathematisch, $pi$ ist eine Konstante. #cite("ARTICLE:CIRCULAR-REASONING-WHO-FIRST-PROVED-THAT-C/d-IS-A-CONSTANT:2013") Daraus folgt, $pi$ kann berechnet werden, damit auch der Umfang eines jeden Kreises. Außerdem ist es mathematisch bewiesen, dass $pi$ eine irrationale Zahl ist (nicht als Bruch dargestellt werden kann), es daher nicht möglich ist, ihren genauen Wert zu erfahren. Es kann nur numerische Annäherungen mit einer gewissen Präzision geben. #cite("ARTICLE:On-Discovering-and-Proving-that-Pi-Is-Irrational:2010") Nun zu einer Möglichkeit wie $pi$ berechnet werden kann. Wie bereits erwähnt, sind Mathematikern zahlreiche solcher Methoden bekannt, weit mehr als es im Zuge dieser Arbeit Sinn hätte, zu erläutern. #cite("ARTICLE:The-Quest-for-Pi:1996", "ARTICLE:A-DETAILED-PROOF-OF-THE-CHUDNOVSKY-FORMULA-WITH-MEANS-OF-BASIC-COMPLEX-ANALYSIS:2020", "BOOK:Pi-Unleashed:2001", "BOOK:A-History-of-Pi:2015") Aus diesem Grund wird für diesen Teil nur beispielhaft Archimedes Methode erläutert. Er bemerkte, dass regelmäßige Polygone, die innerhalb und außerhalb eines Kreises gezeichnet werden, einen Umfang haben, der nahezu dem Umfang des Kreises entspricht. Dabei gilt, je mehr Seiten das genutzte Polygon hat, um so näher liegt sein Umfang an dem des Kreises. #cite("BOOK:Pi-Unleashed:2001", "BOOK:A-History-of-Pi:2015", "ARTICLE:The-Quest-for-Pi:1996") Im Folgenden für einige Polygone dargestellt.

#figure(
  [
    #rect(width: 295pt, height: 290pt, inset: 0pt, stroke: none)[
      #place(top + left, rect(width: 140pt, height: 140pt, inset: 0pt, stroke: none, [
        #place(horizon + center, circle(radius: 70pt, stroke: (paint: color1, dash: "densely-dashed")))
        #place(horizon + center, regular_polygon(sides: 4, radius: 70pt))
        #place(horizon + center, regular_polygon(sides: 4, radius: 70pt, inner: true))
      ]))
      #place(top + right, rect(width: 140pt, height: 140pt, inset: 0pt, stroke: none, [
        #place(horizon + center, circle(radius: 70pt, stroke: (paint: color1, dash: "densely-dashed")))
        #place(horizon + center, regular_polygon(sides: 6, radius: 70pt))
        #place(horizon + center, regular_polygon(sides: 6, radius: 70pt, inner: true))
      ]))
      #place(bottom + left, rect(width: 140pt, height: 140pt, inset: 0pt, stroke: none, [
        #place(horizon + center, circle(radius: 70pt, stroke: (paint: color1, dash: "densely-dashed")))
        #place(horizon + center, regular_polygon(sides: 8, radius: 70pt))
        #place(horizon + center, regular_polygon(sides: 8, radius: 70pt, inner: true))
      ]))
      #place(bottom + right, rect(width: 140pt, height: 140pt, inset: 0pt, stroke: none, [
        #place(horizon + center, circle(radius: 70pt, stroke: (paint: color1, dash: "densely-dashed")))
        #place(horizon + center, regular_polygon(sides: 12, radius: 70pt))
        #place(horizon + center, regular_polygon(sides: 12, radius: 70pt, inner: true))
      ]))
    ]
  ],
  caption: [
    Regelmäßige Polygone zur Annäherung von $pi$
  ]
)

Archimedes definierte $pi$ nicht genau, sondern als zwischen dem Umfang des kleineren Polygons $U_1$ und dem Umfang des größeren Polygons $U_2$ liegenden $U_1 > pi > U_2$. #cite("BOOK:Pi-Unleashed:2001", "BOOK:A-History-of-Pi:2015", "ARTICLE:The-Quest-for-Pi:1996")

== Fallanalyse

Im Weiteren wird in dieser Arbeit an Beispielen der Zusammenhang zwischen $pi$ an verschiedenen Stellen der Mathematik und seiner Definition über den Kreis untersucht werden. Um diese Ergebnisse zur Beantwortung der hier gestelleten Frage aufzubereiten, ist es nützlich, sie bereits im Voraus zu kategorisieren und die Bewertung dann anhand dieser Kategorien vorzunehmen. Zu unterscheiden ist erst einmal zwischen einem bestehenden und einem nicht bestehenden Zusammenhang zur Geometrie des Kreises. Bei einem bewiesenen bestehenden Zusammenhang wird zwischen einem geometrischen und einem algebraischen Beweis unterschieden. Wenn kein Zusammenhang besteht, muss noch unterschieden werden, ob beweisbar ist, dass jener nicht besteht oder ob nur eine Vermutung diesen Schluss begründet. Es ergeben sich die folgenden Kategorien.

#table(
  columns: (2.5cm, auto, auto),
  [*Kategorie*], [*Definition*], [*Bewertung*],
  [Kategorie 1:\ Bestehender Zusammenhang mit algebraischem Beweis], [Es besteht ein Zusammenhang zwischen der Verwendung von $pi$ und dem Kreis der algebraisch formal bewiesen werden kann. Der entsprechende Sachverhalt kann formal ausgedrückt werden und anschließend über beliebig viele Schritte in Verbindung zu einer formalen Form des Kreises gebracht werden.], [Ist dies bei einem Sachverhalt der Fall, so besteht zweifellos ein Zusammenhang zwischen der Verwendung von $pi$ und dem Kreis, solange keine Mängel im Vorgehen bewiesen sind.],
  [Kategorie 2:\ Bestehender Zusammenhang mit geometrischem Beweis], [Es besteht ein Zusammenhang zwischen der Verwendung von $pi$ und dem Kreis, der geometrisch gezeigt werden kann. Es muss eindeutig, die gemetrische Form des Kreises die im Sachverhalt verborgen liegt, gezeigt werden.], [Ist dies bei einem Sachverhalt der Fall, so besteht ein Zusammenhang zwischen der Verwendung von $pi$ und dem Kreis, solange keine Mängel im Vorgehen bewiesen sind. Allerdings ist der Zusammenhang vermutlich nicht vollends ergründet. Es sollte daher nach Möglichkeiten gesucht werden, einen formalen Beweis zum besseren Verständnis zu finden.],
  [Kategorie 3:\ Nicht bestehender Zusammenhang als Vermutung], [Es ist weder möglich, einen Zusammenhang zwischen der Verwendung von $pi$ und dem Kreis geometrisch oder algebraisch zu beweisen noch zu wiederlegen. Es kann jedoch aufgrund erheblichen Aufwandes, der in die Untersuchung geflossen ist, vermutet werden, dass eventuell kein Zusammenhang besteht.], [Ist dies bei einem Sachverhalt der Fall, so kann keine genaue Aussage über das Bestehen oder Nichtbestehen eines Zusammenhangs zwischen der Verwendung von $pi$ und dem Kreis getroffen werden. Es kann nur vermutet werden, dass möglicherweise kein Zusammenhang besteht.],
  [Kategorie 4:\ Nicht bestehender Zusammenhang mit algebraischem Beweis], [Es besteht kein Zusammenhang zwischen der Verwendung von $pi$ und dem Kreis, was algebraisch formal bewiesen werden kann.], [Ist dies bei einem Sachverhalt der Fall, so besteht zweifellos kein Zusammenhang zwischen der Verwendung von $pi$ und dem Kreis, solange keine Mängel im Vorgehen bewiesen sind.]
)

Die vierte Kategorie ist für diese Arbeit besonders interessant, weil, wenn auch nur ein Sachverhalt in diese Kategorie fällt, die Frage mit der sich diese Arbeit beschäftigt, sicher beantwortet werden kann. Wenn jedoch kein solcher Sachverhalt im Laufe dieser Arbeit gefunden werden sollte, kann die Frage nicht final beantworten werden, denn es könnte Sachverhalte geben, die nicht berücksichtigt werden konnten oder die (noch) nicht bekannt sind. Im Folgenden werden einzelne Sachverhalten den vier oben erläuterten Kategorien zugeordnet.

=== Pi als Integral

Die folgende Formel wurde im Laufe dieser Arbeit entwickelt, um $pi$ mit beliebiger Genauigkeit berechenen zu können, ohne dass viel Vorwissen nötig ist, um ihre Herleitung nach zu vollziehen.

$
pi = lim_(n -> infinity) frac(2, n) sum_(k=1)^(n) sqrt(1 - (-1 + (k - 1) dot frac(2, n))^2) + sqrt(1 - (-1 + k dot frac(2, n))^2)
$

Statt hier nur zu beweisen, dass besagte Formel eine Verbindung zum Kreis hat, wird im Folgenden ihre Entwicklung reproduziert. Es wird gezeigt werden, dass ihr zugrunde die Geometrie des Kreises liegt, da sie sich aus eben jener ableiten lässt. Dafür ist an dieser Stelle ein mathematischer Zusammenhang mit $pi$ und dem Kreis, der weiter oben schon erwähnt wurde, wichtig. Zur Erinnerung: der Radius $r$ eines beliebigen Kreises zum Quadrat $r^2$ multipliziert mit $pi$ entspricht der Fläche $A$ des Kreises. #cite("BOOK:Euclid-books-I-II:1883")

#figure(
  [
    #rect(width: 200pt, height: 200pt, inset: 0pt, stroke: none)[
      #place(center + horizon, circle(radius: 100pt, fill: bgcolor0, stroke: color0))
      #place(center + horizon, line(start: (50%, 0%), end: (100%, 0%), stroke: color2))
      #place(center + horizon, circle(radius: 2pt, fill: color3))
      #place(center + horizon, dx: 8pt, dy: -8pt, text(fill: color3, [$ O $]))
      #place(center + bottom, dy: -25%, [$ A = pi r^2 = pi 1^2 = pi $])
      #place(center + horizon, dx: 25%, dy: 7pt, text(fill: color2, [$ r = 1 $]))
    ]
  ],
  caption: [
    Flächeninhalt $A$ eines Kreises mit Radius $r = 1$
  ]
)

Daraus folgt, wenn es möglich ist ohne Verwendung von $pi$ den Flächeninhalt $A$ eines Kreises näherungsweise zu berechnen, kann diese Methode auch verwendet werden, um $pi$ mit einer gewissen Präzision zu berechnen. Zur Vereinfachung wählen wir einen Kreis mit dem Radius $r = 1$ und platzieren diesen sogenannten Einheitskreis auf dem Ursprung eines zweidimensionalen Koordinatensystems.

#figure(
  [
    #default_coordinate_system([
      #place(center + horizon, circle(radius: 100pt))
      #place(right + top, rect(width: 100pt, height: 100pt, inset: 0pt, stroke: none)[
        #line(length: 100%, start: (0%, 100%), angle: -45deg, stroke: color2)
      ])
      #place(center + horizon, dx: 25%, dy: -7pt, text(fill: color2, [$ r = 1 $]))
    ])
  ],
  caption: [
    Flächeninhalt $A$ eines Kreises mit Radius $r = 1$
  ]
)

Bei einem Kreis mit dem Radius $r = 1$ entspricht der Flächeninhalt $A$ exakt $pi$.

$
r &= 1 \
A &= pi r^2 \
A &= pi 1^2 \
A &= pi \
$

Folglich kann das Ergebnis für den Flächeninhalt $A$ direkt, ohne weitere Umformungen als Wert für $pi$ verwendet werden.
Die Idee im nächten Schritt: den Kreis mit Flächen anzunähern, deren Inhalt sich leichter berechnen lässt, als der des Kreises. Optimalerweise so, dass endlos neue Flächen hinzugefügt oder in ihrer Form nach einem festgelegten Schema verändert werden können, um die Genauigkeit mit jeder Ite­ra­ti­on der Berechungen zu verbessern (es wird ein Grenzprozess konstruiert). Eines der besten mathematischen Instrumente, um eine solche Vorgehensweise zu entwickeln, ist die Analysis, genauer die Integralrechnung. #cite("BOOK:Das-kleine-Buch-der-Integralrechnung:2013") Bekannt ist an dieser Stelle die allgemeinen Definition des Kreises. Aus dieser muss nun eine Funktion für das Interval $[-1;1]$ gebildet werden, zum Beispiel über den Satz des Pythagoras. #cite("BOOK:Beweise-zur-Satzgruppe-des-Pythagoras-Analyse-und-Vergleich-ihrer-Behandlung-in-ausgewaehlten-gymnasialen-Unterrichtswerken-der-Jahrgangsstufe-9:2011") Aus jedem Punkt des Kreises kann ein rechtwinkliges Dreieck konstruiert werden. Die Hypotenuse hat dabei immer die Länge des Kreisradius $r$, denn genau diese Eigenschaft definiert den Kreis überhaupt. Die Kathete $a$ wird dem $x$-Wert und Kathete $b$ dem $y$-Wert zugeordnet. Es kann beispielsweise das folgende Dreieck konstruiert werden.

#figure(
  [
    #default_coordinate_system([
      #place(center + horizon, circle(radius: 100pt))
      #place(right + top, rect(width: 100pt, height: 100pt, inset: 0pt, stroke: none)[
        #place(left + bottom, rect(width: 50pt, height: 86.602540pt, inset: 0pt, stroke: none)[
          #place(center + horizon, line(start: (100%, 100%), end: (100%, 0%), stroke: color3))
          #place(center + horizon, line(start: (0%, 100%), end: (100%, 0%), stroke: color2))
          #place(center + horizon, line(start: (0%, 100%), end: (100%, 100%), stroke: color1))
          #place(left + horizon, dx: 8pt, dy: -30%, text(fill: color2, [$ c = r $]))
          #place(right + horizon, dx: 28pt, text(fill: color3, [$ b = y $]))
          #place(center + bottom, dy: 8pt, text(fill: color1, [$ a = x $]))
        ])
      ])
    ])
  ],
  caption: [
    Konstruiertes rechtwinkliges Dreieck im Einheitskreis
  ]
)

Der Satz des Pythagoras kann aus seiner allgemeinen Form $a^2 + b^2 = c^2$ wie folgt in zwei Funktionen in der Form $y = f(x)$ umgeformt werden.

$
a   & = x         \
b   & = y         \
c   & = r         \
c^2 & = a^2 + b^2 \
$

Aus dieser allgemeinen Form wird durch Einsetzen von $x$, $y$ und $r$:

$
r^2 = x^2 + y^2
$

Daraus ergibt sich nach anschließendem Auflösen nach $y$, $f_1(x)$ und $f_2(x)$.

$
r^2       & = x^2 + y^2 space.quad          & | - x^2  \
r^2 - x^2 & = y^2                           & | sqrt(()) \
y         & = minus.plus sqrt(r^2 - x^2)    &          \
f_1(x)    & = sqrt(r^2 - x^2)               &          \
f_2(x)    & = - sqrt(r^2 - x^2)             &          \
$

$r$ wurde, um $pi$ zu berechnen, weiter oben als $r = 1$ definiert. Durch Einsetzen von $r = 1$ und anschließendes Vereinfachen ergeben sich die Funktionen $f_1(x) = sqrt(1 - x^2)$ und $f_2(x) = - sqrt(1 - x^2)$ für einen Kreis mit dem Radius $r = 1$ (Einheitskreis). $f_1(x)$ stellt die obere und $f_2(x)$ die untere Seite des Kreises dar. Wie die obere und untere Seite des Kreises, sind auch $f_1(x)$ und $f_2(x)$ die Spiegelung der jeweils anderen Funktion an der $x$-Achse ($f_1(x) = - f_2(x)$). #cite("ARTICLE:CIRCULAR-REASONING-WHO-FIRST-PROVED-THAT-C/d-IS-A-CONSTANT:2013", "BOOK:Einfuehrung-Mathematik-Primarstufe-Geometrie:2015")


#figure(
  [
    #rect(width: 320pt, height: 240pt, inset: 0pt, stroke: none)[
      #place(left + horizon,
        default_coordinate_system([
          #place(center + horizon,
            rect(width: 200pt, height: 200pt, inset: 0pt, stroke: none,
              move(dx: 50%, dy: 50%,
                path(
                  stroke: color3,
                  closed: false,
                  ..arc(start: -90deg, end: 90deg)
                )
              )
            )
          )
          #place(center + horizon,
            rect(width: 200pt, height: 200pt, inset: 0pt, stroke: none,
              move(dx: 50%, dy: 50%,
                path(
                  stroke: color1,
                  closed: false,
                  ..arc(start: 90deg, end: 270deg)
                )
              )
            )
          )
        ])
      )
      #place(right + horizon, rect(width: 88pt, height: 240pt, inset: 0pt, stroke: none)[
        #place(left + horizon, dy: -36pt, [
          #set text(fill: color3)
          $ f_1(x) = sqrt(1 - x^2) $
        ])
        #place(left + horizon, dy: 28pt, [
          #set text(fill: color1)
          $ f_1(x) = - sqrt(1 - x^2) $
        ])
      ])
    ]
  ],
  caption: [
    Einheitskreis als Funktionen $f_1(x)$ und $f_2(x)$
  ]
)

Der Flächeninhalt des Kreises entspricht der Summe der Integrale $integral_(-1)^1 f_1(x) d x$ und $integral_(-1)^1 f_2(x) d x$ als Flächeninhalt (ihrem absoluten Wert). Um die Integrale zu berechnen (ohne Nutzung von $pi$ selbst oder mit $pi$ verbunden Funktionen, wie der Sinusfunktion $sin(x)$) bietet sich an, die Trapezsumme zu verwenden. #cite("BOOK:Das-kleine-Buch-der-Integralrechnung:2013", "BOOK:Encyclopaedia-of-Mathematics-Stochastic-Approximation-Zygmund-Class-of-Functions:1993") Die Trapezsumme teilt das Integral in viele Trapeze auf (im Grenzprozess unendlich viele Trapeze). Der Flächeninhalt aller Trapeze summiert ist der Grenzwert für das jeweilige Integral. #cite("BOOK:Encyclopaedia-of-Mathematics-Stochastic-Approximation-Zygmund-Class-of-Functions:1993") Die Trapezsumme wird genauer, je schmaler die Trapeze werden und erfüllt damit perfekt die Anprüche, die es, wie oben schon erwähnt, an eine Methode zur Berechnung von $pi$ gibt. Um $pi$ genauer zu berechnen, kann die Breite $l$ (im weiteren wird die Breite der Trapeze repräsentiert durch $l$) der Trapeze verkleinert werden. Im Folgenden ist diese Methode grafisch für $l = frac(1, 2)$ und $l = frac(1, 5)$ dargestellt.

#figure(
  [
    #rect(width: 320pt, height: 240pt, inset: 0pt, stroke: none)[
      #place(left + horizon,
        default_coordinate_system([

          #let trapezoid(..args) = place(center + horizon,
            rect(width: 200pt, height: 200pt, inset: 0pt, stroke: none,
              move(dx: 50%, dy: 50%,
                path(
                  fill: bgcolor2,
                  stroke: color2,
                  closed: true,
                  ..args
                )
              )
            )
          )
          #trapezoid((-100pt, 0pt), (-50pt, 86.6pt), (-50pt, -86.6pt))
          #trapezoid((-50pt, 86.6pt), (-50pt, -86.6pt), (0pt, -100pt), (0pt, 100pt))
          #trapezoid((50pt, -86.6pt), (50pt, 86.6pt), (0pt, 100pt), (0pt, -100pt))
          #trapezoid((100pt, 0pt), (50pt, -86.6pt), (50pt, 86.6pt))

          #place(center + horizon,
            line(length: 100%, stroke: color2)
          )
          #place(center + horizon,
            rect(width: 200pt, height: 200pt, inset: 0pt, stroke: none,
              move(dx: 50%, dy: 50%,
                path(
                  stroke: color3,
                  closed: false,
                  ..arc(start: -90deg, end: 90deg)
                )
              )
            )
          )
          #place(center + horizon,
            rect(width: 200pt, height: 200pt, inset: 0pt, stroke: none,
              move(dx: 50%, dy: 50%,
                path(
                  stroke: color1,
                  closed: false,
                  ..arc(start: 90deg, end: 270deg)
                )
              )
            )
          )
        ])
      )
      #place(right + horizon, rect(width: 88pt, height: 240pt, inset: 0pt, stroke: none)[
        #place(left + horizon, dy: -36pt, [
          #set text(fill: color3)
          $ f_1(x) = sqrt(1 - x^2) $
        ])
        #place(left + horizon, dy: 28pt, [
          #set text(fill: color1)
          $ f_1(x) = - sqrt(1 - x^2) $
        ])
      ])
    ]
  ],
  caption: [
    Integrale von $f_1(x)$ und $f_2(x)$ angenähert über die Trapezsumme für $l = frac(1, 2)$
  ]
)

#figure(
  [
    #rect(width: 320pt, height: 240pt, inset: 0pt, stroke: none)[
      #place(left + horizon,
        default_coordinate_system([

          #let trapezoid(..args) = place(center + horizon,
            rect(width: 200pt, height: 200pt, inset: 0pt, stroke: none,
              move(dx: 50%, dy: 50%,
                path(
                  fill: bgcolor2,
                  stroke: color2,
                  closed: true,
                  ..args
                )
              )
            )
          )
          #trapezoid((-100pt, 0pt), (-80pt, 60pt), (-80pt, -60pt))
          #trapezoid((-80pt, 60pt), (-80pt, -60pt), (-60pt, -80pt), (-60pt, 80pt))
          #trapezoid((-60pt, -80pt), (-60pt, 80pt), (-40pt, 91.65pt), (-40pt, -91.65pt))
          #trapezoid((-40pt, 91.65pt), (-40pt, -91.65pt), (-20pt, -97.97pt), (-20pt, 97.97pt))
          #trapezoid((-20pt, -97.97pt), (-20pt, 97.97pt), (0pt, 100pt), (0pt, -100pt))
          #trapezoid((20pt, -97.97pt), (20pt, 97.97pt), (0pt, 100pt), (0pt, -100pt))
          #trapezoid((40pt, 91.65pt), (40pt, -91.65pt), (20pt, -97.97pt), (20pt, 97.97pt))
          #trapezoid((60pt, -80pt), (60pt, 80pt), (40pt, 91.65pt), (40pt, -91.65pt))
          #trapezoid((80pt, 60pt), (80pt, -60pt), (60pt, -80pt), (60pt, 80pt))
          #trapezoid((100pt, 0pt), (80pt, 60pt), (80pt, -60pt))

          #place(center + horizon,
            line(length: 100%, stroke: color2)
          )
          #place(center + horizon,
            rect(width: 200pt, height: 200pt, inset: 0pt, stroke: none,
              move(dx: 50%, dy: 50%,
                path(
                  stroke: color3,
                  closed: false,
                  ..arc(start: -90deg, end: 90deg)
                )
              )
            )
          )
          #place(center + horizon,
            rect(width: 200pt, height: 200pt, inset: 0pt, stroke: none,
              move(dx: 50%, dy: 50%,
                path(
                  stroke: color1,
                  closed: false,
                  ..arc(start: 90deg, end: 270deg)
                )
              )
            )
          )
        ])
      )
      #place(right + horizon, rect(width: 88pt, height: 240pt, inset: 0pt, stroke: none)[
        #place(left + horizon, dy: -36pt, [
          #set text(fill: color3)
          $ f_1(x) = sqrt(1 - x^2) $
        ])
        #place(left + horizon, dy: 28pt, [
          #set text(fill: color1)
          $ f_1(x) = - sqrt(1 - x^2) $
        ])
      ])
    ]
  ],
  caption: [
    Integrale von $f_1(x)$ und $f_2(x)$ angenähert über die Trapezsumme für $l = frac(1, 5)$
  ]
)

Für den an dieser Stelle vorliegenden Sachkontext ergibt sich, dass jedes Trapez an seinen beiden Parallelen durch die Funktionen $f_1(x)$ und $f_2(x)$ begrenzt wird. Wenn eine Seite (ein Parallele zur $y$-Achse) des Trapezes an der Stelle $x$ liegt, dann ist ihre Länge gleich der Differenz zwischen $f_1(x)$ und $f_2(x)$ an genau dieser Stelle $x$. Es lässt sich die Funktion $g(x) = f_1(x) - f_2(x)$ für die Länge einer Trapezseite an einer Stelle $x$ aufstellen. #cite("BOOK:Encyclopaedia-of-Mathematics-Stochastic-Approximation-Zygmund-Class-of-Functions:1993", "BOOK:Das-kleine-Buch-der-Integralrechnung:2013") $g(x)$ kann wie folgt vereinfacht werden.

$
g(x) &= f_1(x) - f_2(x)                    \
g(x) &= (sqrt(1 - x^2))-(- sqrt(1 - x^2))  \
g(x) &= sqrt(1 - x^2) + sqrt(1 - x^2)      \
g(x) &= 2 dot sqrt(1 - x^2) = 2 dot f_1(x) \
$

$g(x)$ kann nun in die allgemeine Form der Trapezsumme als Funktion zur Berechung der Seitenlängen eingesetz werden. Allgemein kann die Trapezsumme wie folgt geschrieben werden. #cite("BOOK:Encyclopaedia-of-Mathematics-Stochastic-Approximation-Zygmund-Class-of-Functions:1993", "BOOK:Das-kleine-Buch-der-Integralrechnung:2013", "BOOK:Einfuehrung-Mathematik-Primarstufe-Geometrie:2015")

$
integral_(a)^(b) t(x) d x = frac(b - a, n) sum_(k=1)^(n) frac(t(a + (k - 1) dot frac(b - a, n)) + t(a + k dot frac(b - a, n)), 2)
$

$n$ steht dabei für die Anzahl der Trapeze, $a$ ist der Anfang und $b$ das Ende des Integrals. #cite("BOOK:Encyclopaedia-of-Mathematics-Stochastic-Approximation-Zygmund-Class-of-Functions:1993", "BOOK:Das-kleine-Buch-der-Integralrechnung:2013", "BOOK:Einfuehrung-Mathematik-Primarstufe-Geometrie:2015") Im Sachkontext sind die Integralgrenzen als $a = -1$ und $b = 1$ festgelegt, denn in diesem Bereich befindet sich der Einheitskreis ($f_1(x)$, $f_2(x)$ und demnach auch $g(x)$ sind nur im Intervall $[-1,1]$ überhaupt definiert), durch Einsetzen der Werte und Vereinfachen ergibt sich folgende Form.
