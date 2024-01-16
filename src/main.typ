#import "template.typ": *

#show: project.with(
  title: "Pi and seek - Pi ohne Kreis? Wird Pi ohne den Zusammenhang mit der Geometrie eines Kreises verwendet?",
  authors: (
    "Timon Schelling",
  ),
  date: "27. April 2023",
  bib: "refs.bib",
  bib-title: "Literatur",
)

#let color0 = rgb("#000000")
#let color1 = rgb("#C10000")
#let color2 = rgb("#149900")
#let color3 = rgb("#0F00B6")
#let color4 = rgb("#A3006A")
#let color5 = rgb("#F5C000")
#let color6 = rgb("#BD4800")
#let color7 = rgb("#8617C2")
#let color8 = rgb("#00ADA8")
#let color9 = rgb("#81BD00")

#let bgcolor0 = color0.lighten(80%)
#let bgcolor1 = color1.lighten(70%)
#let bgcolor2 = color2.lighten(70%)
#let bgcolor3 = color3.lighten(70%)
#let bgcolor4 = color4.lighten(70%)
#let bgcolor5 = color5.lighten(70%)
#let bgcolor6 = color6.lighten(70%)
#let bgcolor7 = color7.lighten(70%)
#let bgcolor8 = color8.lighten(70%)
#let bgcolor9 = color9.lighten(70%)

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

Seit die Idee der Kreiszahl $pi$ (sie wird im Weiteren noch genauer definiert und analysiert) sich in der Mathematik etabliert hat, wurden (und werden) immer wieder Methoden entwickelt (absichtlich und auch zufällig), um ihren Wert mit einer gewissen Präzision zu berechnen. In der Bibel (wichtigste Textsammlung des Judentums und Christentums) ist beispielweise indirekt ein Wert von $3$ für $pi$ erwähnt. #cite(<ARTICLE:The-Quest-for-Pi:1996>) Eine der frühsten erhaltenen Aufzeichnungen eines Wertes für die Kreiszahl $pi$ geht ungefähr auf das Jahr $-2000$ ($2000$ BC. / $2000$ v. Chr. nach dem Gregorianischen Kalender) zurück und beträgt nach Annäherung der Babylonier $3 + frac(1, 8)$. Zu den moderneren Formen der Berechnung von $pi$ zählt unter anderem der Chudnovsky-Algorithmus; $pi$ ist darin wie folgt definiert. #cite(<ARTICLE:A-DETAILED-PROOF-OF-THE-CHUDNOVSKY-FORMULA-WITH-MEANS-OF-BASIC-COMPLEX-ANALYSIS:2020>)


$ frac(1, pi) = 12 sum^infinity_(k=0) frac((-1)^k (6k)! (545140134k + 13591409), (3k)!(k!)^3 640320^(3k + 3/2)) $


Wie beim Chudnovsky-Algorithmus ist es in der Mathematik oft nicht klar ersichtlich ob und wenn, welche Verbindung zwischen der Verwendung von $pi$ und der Geometrie des Kreises besteht. Da jedoch $pi$ erst durch die Geometrie des Kreises definiert ist, kann sachlogisch die Hypothese aufgestellt werden, dass wenn $pi$ auftaucht, ein Zusammenhang mit der Geometrie des Kreises bestehen müsste. #cite(<VIDEO:Why-is-pi-here-And-why-is-it-squared-A-geometric-answer-to-the-Basel-problem:2018>) Den Chudnovsky-Algorithmus zu erklären, würde weit über den Rahmen dieser Arbeit hinaus gehen. #cite(<ARTICLE:A-DETAILED-PROOF-OF-THE-CHUDNOVSKY-FORMULA-WITH-MEANS-OF-BASIC-COMPLEX-ANALYSIS:2020>) Aus diesem Grund werden weniger komplexe Sachverhalte als Beispiel heran gezogen, um die zuvor erwähnte und im Weiteren ausformulierte Hypothese zu überprüfen.


== Ideenfindung

Das Thema dieser Arbeit ist aus der Methode, die Kreiszahl $pi$ zu berechnen, die erstmalig vom Mathematiker Gregory Galperin in seiner Arbeit "PLAYING POOL WITH PI (THE NUMBER PI FROM A BILLIARD POINT OF VIEW)" vorgestellt wurde, abgeleitet. #cite(<ARTICLE:PLAYING-POOL-WITH-PI:2003>) #cite(<VIDEO:The-most-unexpected-answer-to-a-counting-puzzle:2019>) Diese Methode soll es ermöglichen, $pi$ bis zu jeder Genauigkeit/Präzision zu berechnen, ohne technische Hilfsmittel zu nutzen. #cite(<ARTICLE:PLAYING-POOL-WITH-PI:2003>) Ihre genaue Funktionsweise wird im Hauptteil dieser Arbeit näher erläutert.

== Forschungsfrage

Pi ohne Kreis? Wird Pi ohne den Zusammenhang mit der Geometrie eines Kreises verwendet? (Existieren Sachverhalte, in denen Pi ohne Zusammenhang mit der Geometrie eines Kreises Verwendung findet?)

=== Warum stellt sich die Frage?

Die von Gregory Galperin in seinem Artikel "PLAYING POOL WITH PI (THE NUMBER PI FROM A BILLIARD POINT OF VIEW)" vorgestellte Methode, um Stellen von $pi$ zu berechnen(die gestellte Frage nach der Anzahl an Kollisionen zweier Billardkugeln in einem dynamischen System), kann mit Hilfe des Energie- und Impulserhaltungssatzes in ein geometrisches Problem umgewandelt werden, das tatsächlich einen Kreis enthält #cite(<ARTICLE:Throwing-Pi-at-a-wall:2019>) #cite(<VIDEO:How-colliding-blocks-act-like-a-beam-of-light-to-compute-pi.:2019>) #cite(<ARTICLE:PLAYING-POOL-WITH-PI:2003>) #cite(<VIDEO:Why-do-colliding-blocks-compute-pi:2019>) (der genaue Weg wird im Hauptteil dieser Arbeit erläutert und nachvollzogen). Aus diesem Grund stellt sich die Frage, ob nicht bei allen Verwendungen von $pi$ auf eine solche oder ähnliche Art ein Zusammenhang zur Geometrie des Kreises mathematisch bewiesen werden kann.


=== Welche Relevanz hat die Frage?

Im Fachbereich der Philosophischen Mathematik wird versucht, Gegenstand, Voraussetzungen, Natur und Methoden der Mathematik zu ergründen und zu verstehen. Es werden unter anderem Überlegungen angestellt, ob die Mathematik ein von Menschen erdachtes Konzept ist oder ob Menschen sie lediglich entdeckt haben, gerade entdecken oder noch entdecken werden. #cite(<BOOK:New-Directions-in-the-Philosophy-of-Mathematics:1998>) Wenn $pi$ nicht nur in einem direkten oder indirekten Zusammenhang, mit der Geometrie bewiesen werden kann, liegt die Vermutung nahe, dass die Menschen ihre Bedeutung nicht oder nicht in Gänze verstehen, $pi$ in Verbindung mit Kreisen nur ein Indiz für eine tiefgreifendere mathematische Wahrheit ist. Wir als Menschheit (genauer Mathematiker) haben $pi$ im Zusammenhang mit Kreisen definiert. Wenn $pi$ demnach an anderer Stelle ohne Verbindung zu unserer menschlichen Definition Verwendung findet, spricht eben diese Tatsache eher für eine von Menschen entdeckte Mathematik. Das Ergebnis dieser Arbeit wird demnach als Argument für die eine oder andere Perspektive benutzt werden können, kann in jedem Fall zu einem besseren Verständnis der Mathematik im Allgemeinen und der Zahl $pi$ im Speziellen beitragen.

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

Um die Kreiszahl $pi$ zu definieren, wird neben Grundlagen der Geometrie noch die Rechenart der Division benötigt. Sie ist eine der vier Grundrechenarten der Mathematik, genauergenommen der Arithmetik, definiert als Umkehroperation der Multiplikation. Es wird ein Dividend durch einen Divisor dividiert, das Resultat nennt sich Quotient. #cite(<WEB:Division-Wolfram-Research:2021>)


$ underbrace(a, "Dividend") : underbrace(b, "Divisor") = underbrace(c, "Wert des Quotienten") $

Wenn eine Zahl $a$ und eine Zahl $b$ mulltipiziert werden, ergibt sich aus dem Ergebnis $c$ durch Dividieren durch $a$ wieder $b$ und durch Dividieren durch $b$ wieder $a$, sofern $a$ und $b$ nicht Null sind. #cite(<WEB:Division-Wolfram-Research:2021>) Es gilt demnach das folgende Gleichungssystem.

$
a dot b    &= c  \
frac(c, a) &= b  \
frac(c, b) &= a  \
a          &!= 0 \
b          &!= 0 \
$

Diese Erkentnisse über die Division reichen aus, um im Folgenden eine formale Definition von $pi$ zu konstruieren.

=== Kreiszahl Pi

Um $pi$ als Kreiszahl zu begreifen, fehlt an dieser Stellen noch das Verständnis der Geometrie des Kreises. Aus diesem Grund wird im Folgenden seine Definition genauer untersucht. Ein Kreis ist definiert als zweidimensionale Fläche. Sie wird begrenzt durch eine konstant gekrümmte Linie, verlaufend auf allen Punkten, die in einer Entfernung von $r$ von einem Mittelpunkt $O$ liegen. Die Strecke $r$ wird Radius genannt. Der zweifache Radius nennt sich Durchmesser $d$. Er beschreibt eine Strecke verlaufend durch den Mittelpunkt und begrenzt an beiden Enden durch einen Punkt, der auf der Begrenzung des Kreises liegt. #cite(<BOOK:Einfuehrung-Mathematik-Primarstufe-Geometrie:2015>) #cite(<BOOK:Pi-Unleashed:2001>) #cite(<BOOK:A-History-of-Pi:2015>) Diese Definition besteht schon sehr lange, schon Euklid verwendete sie. Er soll den Kreis wie folgt definierte haben: "A circle is a plane figure bounded by one curved line, and such that all straight lines drawn from a certain point within it to the bounding line, are equal. The bounding line is called its circumference and the point, its centre." #cite(<BOOK:Euclid-books-I-II:1883>) Diese Definition für einen Kreis mit dem Radius $r = 1$ kann grafisch folgendermaßen dargestellt werden. #cite(<BOOK:Einfuehrung-Mathematik-Primarstufe-Geometrie:2015>) #cite(<BOOK:Pi-Unleashed:2001>) #cite(<BOOK:A-History-of-Pi:2015>)

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

Mathematiker entdeckten eine besondere Eigenschaft des Kreises: ein jeder Kreis mit einem beliebig gewählten Radius $r$ ($r > 0$) und damit auch Durchmesser $d$, hat einen Umfang $c$ ($c$ für das englische Wort "Circumference"), der dem Durchmesser $d$ multipliziert mit einem konstanten Faktor entspricht. Dieser Faktor wurde über die Zeit als Kreiszahl $pi$ standartisiert. $pi$ entspricht demnach dem Verhälnis von Umfang $c$ und Durchmesser $r$. #cite(<BOOK:A-History-of-Pi:2015>) #cite(<BOOK:Pi-Unleashed:2001>) #cite(<ARTICLE:The-Tau-Manifesto:2010>)

$
d dot pi &= c space.quad | : d \
pi       &= frac(c, d)         \
$
Wird an gleicher Stelle statt des Durchmessers $d$ der Radius $r$ gewählt, erhält man die ebenfalls standardisierte Zahl $tau$. #cite(<ARTICLE:The-Tau-Manifesto:2010>)


$
r dot tau & = c space.quad | : r \
tau       & = frac(c, r)         \
$


$tau$ entspricht exakt dem Zweifachen von $pi$. #cite(<ARTICLE:The-Tau-Manifesto:2010>)

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

Aus dieser Erkenntnis folgt, in der Mathematik kann, wann immer $2pi$ Verwendung findet, statt seiner auch $tau$ verwendet werden. Für diese Arbeit ist vorallem interessant, dass $tau$ genau wie $pi$ eine direkte Verbindung zu Kreisen hat, wir $tau$ wie $pi$ erst über die Geometrie des Kreises definieren. #cite(<ARTICLE:The-Tau-Manifesto:2010>)

$pi$ ist ebenfalls essenziell um den Flächeninhalt eins Kreises zu berechnen, denn der Radius $r$ eines Beliebigen Kreises zum Quadrat $r^2$, multipliziert mit $pi$ entspricht dem Flächeninhalt $A$ des Kreises. #cite(<ARTICLE:AREA-INSIDE-THE-CIRCLE-INTUITIVE-AND-RIGOROUSPROOFS:2017>) Dies kann wie folgt grafisch dargestellt werden.

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

Schon Archimedes erkannte und bewies mathematisch, $pi$ ist eine Konstante. #cite(<ARTICLE:CIRCULAR-REASONING-WHO-FIRST-PROVED-THAT-C-over-d-IS-A-CONSTANT:2013>) Daraus folgt, $pi$ kann berechnet werden, damit auch der Umfang eines jeden Kreises. Außerdem ist es mathematisch bewiesen, dass $pi$ eine irrationale Zahl ist (nicht als Bruch dargestellt werden kann), es daher nicht möglich ist, ihren genauen Wert zu erfahren. Es kann nur numerische Annäherungen mit einer gewissen Präzision geben. #cite(<ARTICLE:On-Discovering-and-Proving-that-Pi-Is-Irrational:2010>) Nun zu einer Möglichkeit wie $pi$ berechnet werden kann. Wie bereits erwähnt, sind Mathematikern zahlreiche solcher Methoden bekannt, weit mehr als es im Zuge dieser Arbeit Sinn hätte, zu erläutern. #cite(<ARTICLE:The-Quest-for-Pi:1996>) #cite(<ARTICLE:A-DETAILED-PROOF-OF-THE-CHUDNOVSKY-FORMULA-WITH-MEANS-OF-BASIC-COMPLEX-ANALYSIS:2020>) #cite(<BOOK:Pi-Unleashed:2001>) #cite(<BOOK:A-History-of-Pi:2015>) Aus diesem Grund wird für diesen Teil nur beispielhaft Archimedes Methode erläutert. Er bemerkte, dass regelmäßige Polygone, die innerhalb und außerhalb eines Kreises gezeichnet werden, einen Umfang haben, der nahezu dem Umfang des Kreises entspricht. Dabei gilt, je mehr Seiten das genutzte Polygon hat, um so näher liegt sein Umfang an dem des Kreises. #cite(<BOOK:Pi-Unleashed:2001>) #cite(<BOOK:A-History-of-Pi:2015>) #cite(<ARTICLE:The-Quest-for-Pi:1996>) Im Folgenden für einige Polygone dargestellt.

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

Archimedes definierte $pi$ nicht genau, sondern als zwischen dem Umfang des kleineren Polygons $U_1$ und dem Umfang des größeren Polygons $U_2$ liegenden $U_1 > pi > U_2$. #cite(<BOOK:Pi-Unleashed:2001>) #cite(<BOOK:A-History-of-Pi:2015>) #cite(<ARTICLE:The-Quest-for-Pi:1996>)

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

Statt hier nur zu beweisen, dass besagte Formel eine Verbindung zum Kreis hat, wird im Folgenden ihre Entwicklung reproduziert. Es wird gezeigt werden, dass ihr zugrunde die Geometrie des Kreises liegt, da sie sich aus eben jener ableiten lässt. Dafür ist an dieser Stelle ein mathematischer Zusammenhang mit $pi$ und dem Kreis, der weiter oben schon erwähnt wurde, wichtig. Zur Erinnerung: der Radius $r$ eines beliebigen Kreises zum Quadrat $r^2$ multipliziert mit $pi$ entspricht der Fläche $A$ des Kreises. #cite(<BOOK:Euclid-books-I-II:1883>)

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
        #place(bottom + left, rect(width: 100pt, height: 100pt, inset: 0pt, stroke: none)[
          #line(length: 100%, start: (0%, 100%), angle: -45deg, stroke: color2)
        ])
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
Die Idee im nächten Schritt: den Kreis mit Flächen anzunähern, deren Inhalt sich leichter berechnen lässt, als der des Kreises. Optimalerweise so, dass endlos neue Flächen hinzugefügt oder in ihrer Form nach einem festgelegten Schema verändert werden können, um die Genauigkeit mit jeder Ite­ra­ti­on der Berechungen zu verbessern (es wird ein Grenzprozess konstruiert). Eines der besten mathematischen Instrumente, um eine solche Vorgehensweise zu entwickeln, ist die Analysis, genauer die Integralrechnung. #cite(<BOOK:Das-kleine-Buch-der-Integralrechnung:2013>) Bekannt ist an dieser Stelle die allgemeinen Definition des Kreises. Aus dieser muss nun eine Funktion für das Interval $[-1;1]$ gebildet werden, zum Beispiel über den Satz des Pythagoras. #cite(<BOOK:Beweise-zur-Satzgruppe-des-Pythagoras-Analyse-und-Vergleich-ihrer-Behandlung-in-ausgewaehlten-gymnasialen-Unterrichtswerken-der-Jahrgangsstufe-9:2011>) Aus jedem Punkt des Kreises kann ein rechtwinkliges Dreieck konstruiert werden. Die Hypotenuse hat dabei immer die Länge des Kreisradius $r$, denn genau diese Eigenschaft definiert den Kreis überhaupt. Die Kathete $a$ wird dem $x$-Wert und Kathete $b$ dem $y$-Wert zugeordnet. Es kann beispielsweise das folgende Dreieck konstruiert werden.

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
r^2       & = x^2 + y^2                        & | - x^2       \
r^2 - x^2 & = y^2                              & | sqrt(space) \
y         & = minus.plus sqrt(r^2 - x^2) space &               \
f_1(x)    & = sqrt(r^2 - x^2)                  &               \
f_2(x)    & = - sqrt(r^2 - x^2)                &               \
$

$r$ wurde, um $pi$ zu berechnen, weiter oben als $r = 1$ definiert. Durch Einsetzen von $r = 1$ und anschließendes Vereinfachen ergeben sich die Funktionen $f_1(x) = sqrt(1 - x^2)$ und $f_2(x) = - sqrt(1 - x^2)$ für einen Kreis mit dem Radius $r = 1$ (Einheitskreis). $f_1(x)$ stellt die obere und $f_2(x)$ die untere Seite des Kreises dar. Wie die obere und untere Seite des Kreises, sind auch $f_1(x)$ und $f_2(x)$ die Spiegelung der jeweils anderen Funktion an der $x$-Achse ($f_1(x) = - f_2(x)$). #cite(<ARTICLE:CIRCULAR-REASONING-WHO-FIRST-PROVED-THAT-C-over-d-IS-A-CONSTANT:2013>) #cite(<BOOK:Einfuehrung-Mathematik-Primarstufe-Geometrie:2015>)


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

Der Flächeninhalt des Kreises entspricht der Summe der Integrale $integral_(-1)^1 f_1(x) d x$ und $integral_(-1)^1 f_2(x) d x$ als Flächeninhalt (ihrem absoluten Wert). Um die Integrale zu berechnen (ohne Nutzung von $pi$ selbst oder mit $pi$ verbunden Funktionen, wie der Sinusfunktion $sin(x)$) bietet sich an, die Trapezsumme zu verwenden. #cite(<BOOK:Das-kleine-Buch-der-Integralrechnung:2013>) #cite(<BOOK:Encyclopaedia-of-Mathematics-Stochastic-Approximation-Zygmund-Class-of-Functions:1993>) Die Trapezsumme teilt das Integral in viele Trapeze auf (im Grenzprozess unendlich viele Trapeze). Der Flächeninhalt aller Trapeze summiert ist der Grenzwert für das jeweilige Integral. #cite(<BOOK:Encyclopaedia-of-Mathematics-Stochastic-Approximation-Zygmund-Class-of-Functions:1993>) Die Trapezsumme wird genauer, je schmaler die Trapeze werden und erfüllt damit perfekt die Anprüche, die es, wie oben schon erwähnt, an eine Methode zur Berechnung von $pi$ gibt. Um $pi$ genauer zu berechnen, kann die Breite $l$ (im weiteren wird die Breite der Trapeze repräsentiert durch $l$) der Trapeze verkleinert werden. Im Folgenden ist diese Methode grafisch für $l = frac(1, 2)$ und $l = frac(1, 5)$ dargestellt.

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

          #place(center + horizon, dx: 25pt, dy: 50pt,
            axis(length: 46pt, stroke: color2, fill: color2)
          )
          #place(center + horizon, dx: 25pt, dy: 50pt,
            axis(length: 46pt, stroke: color2, fill: color2, angle: 180deg)
          )
          #place(center + horizon, dx: 25pt, dy: 38pt, [
            #set text(fill: color2)
            $frac(1, 2)$
          ])

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

          #place(center + horizon, dx: 10pt, dy: 50pt,
            axis(length: 16pt, stroke: color2, fill: color2)
          )
          #place(center + horizon, dx: 10pt, dy: 50pt,
            axis(length: 16pt, stroke: color2, fill: color2, angle: 180deg)
          )
          #place(center + horizon, dx: 10pt, dy: 37pt, [
            #set text(fill: color2)
            $frac(1, 5)$
          ])

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

Für den an dieser Stelle vorliegenden Sachkontext ergibt sich, dass jedes Trapez an seinen beiden Parallelen durch die Funktionen $f_1(x)$ und $f_2(x)$ begrenzt wird. Wenn eine Seite (ein Parallele zur $y$-Achse) des Trapezes an der Stelle $x$ liegt, dann ist ihre Länge gleich der Differenz zwischen $f_1(x)$ und $f_2(x)$ an genau dieser Stelle $x$. Es lässt sich die Funktion $g(x) = f_1(x) - f_2(x)$ für die Länge einer Trapezseite an einer Stelle $x$ aufstellen. #cite(<BOOK:Encyclopaedia-of-Mathematics-Stochastic-Approximation-Zygmund-Class-of-Functions:1993>) #cite(<BOOK:Das-kleine-Buch-der-Integralrechnung:2013>) $g(x)$ kann wie folgt vereinfacht werden.

$
g(x) &= f_1(x) - f_2(x)                    \
g(x) &= (sqrt(1 - x^2))-(- sqrt(1 - x^2))  \
g(x) &= sqrt(1 - x^2) + sqrt(1 - x^2)      \
g(x) &= 2 dot sqrt(1 - x^2) = 2 dot f_1(x) \
$

$g(x)$ kann nun in die allgemeine Form der Trapezsumme als Funktion zur Berechung der Seitenlängen eingesetz werden. Allgemein kann die Trapezsumme wie folgt geschrieben werden. #cite(<BOOK:Encyclopaedia-of-Mathematics-Stochastic-Approximation-Zygmund-Class-of-Functions:1993>) #cite(<BOOK:Das-kleine-Buch-der-Integralrechnung:2013>) #cite(<BOOK:Einfuehrung-Mathematik-Primarstufe-Geometrie:2015>)

$
integral_(a)^(b) t(x) d x = frac(b - a, n) sum_(k=1)^(n) frac(t(a + (k - 1) dot frac(b - a, n)) + t(a + k dot frac(b - a, n)), 2)
$

$n$ steht dabei für die Anzahl der Trapeze, $a$ ist der Anfang und $b$ das Ende des Integrals. #cite(<BOOK:Encyclopaedia-of-Mathematics-Stochastic-Approximation-Zygmund-Class-of-Functions:1993>) #cite(<BOOK:Das-kleine-Buch-der-Integralrechnung:2013>) #cite(<BOOK:Einfuehrung-Mathematik-Primarstufe-Geometrie:2015>) Im Sachkontext sind die Integralgrenzen als $a = -1$ und $b = 1$ festgelegt, denn in diesem Bereich befindet sich der Einheitskreis ($f_1(x)$, $f_2(x)$ und demnach auch $g(x)$ sind nur im Intervall $[-1,1]$ überhaupt definiert), durch Einsetzen der Werte und Vereinfachen ergibt sich folgende Form.

$
integral_(a)^(b) t(x) d x  &= frac(b - a, n) &sum_(k=1)^(n) frac(t(a + (k - 1) dot frac(b - a, n)) + t(a + k dot frac(b - a, n)), 2) \
integral_(-1)^(1) t(x) d x &= frac(2, n) &sum_(k=1)^(n) frac(t(-1 + (k - 1) dot frac(2, n)) + t(-1 + k dot frac(2, n)), 2)           \
$

Der Term $t(-1 + (k - 1) dot frac(2, n))$ steht für die eine und $t(-1 + k dot frac(2, n))$ für die andere Seitenlängen jedes der den Kreis füllenden Trapeze. $g(x)$ wurde weiter oben als Funktion, die genau dafür steht, definiert. Wird die Funktion $g(x)$ für $t(x)$ in diese Form eingesetzt, aufgelöst und $n$ gegen Unendliche laufen gelassen, so ergibt sich eine Formel zur Berechnung von $pi$.

$
& pi = lim_(n -> infinity) frac(2, n) sum_(k=1)^(n) frac(g(-1 + (k - 1) dot frac(2, n)) + g(-1 + k dot frac(2, n)), 2)                                                                            \
& pi = lim_(n -> infinity) frac(2, n) sum_(k=1)^(n) frac(2 dot sqrt(1 - (-1 + (k - 1) dot frac(2, n))^2) + 2 dot sqrt(1 - (-1 + k dot frac(2, n))^2), 2)                                          \
& pi = lim_(n -> infinity) frac(2, n) sum_(k=1)^(n) frac(2 dot sqrt(1 - (-1 + (k - 1) dot frac(2, n))^2), 2) + frac(2 dot sqrt(1 - (-1 + k dot frac(2, n))^2), 2)                                 \
& pi = lim_(n -> infinity) frac(2, n) sum_(k=1)^(n) frac(cancel(2) dot sqrt(1 - (-1 + (k - 1) dot frac(2, n))^2), cancel(2)) + frac(cancel(2) dot sqrt(1 - (-1 + k dot frac(2, n))^2), cancel(2)) \
& pi = lim_(n -> infinity) frac(2, n) sum_(k=1)^(n) sqrt(1 - (-1 + (k - 1) dot frac(2, n))^2) + sqrt(1 - (-1 + k dot frac(2, n))^2)                                                               \
$

Wenn $n$ beispielsweise bis $n = 1000000$ läuft, dann entspricht das Ergebnis bis zur neunten Nachkommanstelle dem tatsächlichen Wert von $pi$. #cite(<BOOK:Pi-Unleashed:2001>) #cite(<BOOK:A-History-of-Pi:2015>) #cite(<ARTICLE:The-Quest-for-Pi:1996>)

$
& n = 1000000                                                                                                                            \
& pi approx frac(2, n) sum_(k=1)^(n) sqrt(1 - (-1 + (k - 1) dot frac(2, n))^2) + sqrt(1 - (-1 + k dot frac(2, n))^2) = 3.14159265 02636 \
$

Wichtig ist an dieser Stelle anzumerken, dass diese komplexe Formel zur Berechnung von $pi$ eindeutig vom Kreis und seiner Geometrie abgeleitet ist. Ihr liegt die Idee, den Einheitskreis als Funktion zu repräsentieren und dann ihr Integral, somit logischerweise auch den Flächeninhalt des Kreises, mit Hilfe der Trapezsumme anzunähern und so $pi$ zu bestimmen. Die entwickelte Fromel:

$
pi = lim_(n -> infinity) frac(2, n) sum_(k=1)^(n) sqrt(1 - (-1 + (k - 1) dot frac(2, n))^2) + sqrt(1 - (-1 + k dot frac(2, n))^2)
$

kann zweifellos der 1. Kategorie zugeordnet werden, denn ihr Zusammenhang mit der Geometrie des Kreises wurde im Zuge ihrer Entwicklung eindeutig belegt.

=== Gregory Galperins Billiard Problem

Gregory Galperin stellt in seiner Arbeit "PLAYING POOL WITH PI (THE NUMBER PI FROM A BILLIARD POINT OF VIEW)", eine Methode zur Berechung von $pi$ vor. #cite(<ARTICLE:PLAYING-POOL-WITH-PI:2003>) #cite(<ARTICLE:Throwing-Pi-at-a-wall:2019>) #cite(<ARTICLE:The-Dynamics-of-Digits-Calculating-Pi-with-Galperins-Billiards:2017>) #cite(<VIDEO:The-most-unexpected-answer-to-a-counting-puzzle:2019>) Sie ist nicht darauf angelegt besonders schnell, effektiv oder effizient zu sein, aber sie wird von zahlreichen Mathematikern als sehr elegant und lehreich angesehen. #cite(<ARTICLE:PLAYING-POOL-WITH-PI:2003>) #cite(<ARTICLE:The-Dynamics-of-Digits-Calculating-Pi-with-Galperins-Billiards:2017>) #cite(<ARTICLE:Throwing-Pi-at-a-wall:2019>) #cite(<VIDEO:The-most-unexpected-answer-to-a-counting-puzzle:2019>) #cite(<VIDEO:Why-do-colliding-blocks-compute-pi:2019>) Im Folgenden wird sie genau erklärt, um sie im Anschluss einer der oben genannten Kategorien zu zuordnen. Die folgende Erläuterung weicht von Galperins ursprünglicher Methode in Teilen ab, verändert aber nichts an der zu Grunde liegenden Mathematik. #cite(<ARTICLE:The-Dynamics-of-Digits-Calculating-Pi-with-Galperins-Billiards:2017>)

Ein Objekt der Masse $M$ bewegt sich mit der Geschwindigkeit $V$ entlang einer Gerade auf ein zweites Objekt der Masse $m$ zu, das stationär ist (seine Geschwindigkeit $v$ ist Null), bevor es perfekt elastisch damit kollidiert (d. h. vor und nach der Kollision hat das System dieselbe Energie), #cite(<ARTICLE:The-Dynamics-of-Digits-Calculating-Pi-with-Galperins-Billiards:2017>) #cite(<ARTICLE:PLAYING-POOL-WITH-PI:2003>) das zweite Objekt in Richtung einer unbeweglichen Wand (gedacht könnte die Wand eine unendliche Masse haben) treibt. #cite(<VIDEO:The-most-unexpected-answer-to-a-counting-puzzle:2019>) #cite(<ARTICLE:PLAYING-POOL-WITH-PI:2003>) #cite(<ARTICLE:The-Dynamics-of-Digits-Calculating-Pi-with-Galperins-Billiards:2017>) Das zweite Objekt wird nach einer weiteren perfekten elastischen Kollision mit der Wand reflektiert und kollidiert erneut mit dem ersten Objekt. Dieser Vorgang wiederholt sich, bis sich beide Objekte von der Wand entfernen und die Geschwindigkeit $V$ des ersten Objekts die Geschwindigkeit $v$ des zweiten Objekts übersteigt. Es gelten dabei nur der Energie- und Impulserhaltungssatz, keine anderen physikalischen Gesetze. #cite(<ARTICLE:PLAYING-POOL-WITH-PI:2003>) #cite(<ARTICLE:The-Dynamics-of-Digits-Calculating-Pi-with-Galperins-Billiards:2017>) #cite(<VIDEO:The-most-unexpected-answer-to-a-counting-puzzle:2019>) Das beschriebene System ist in der folgenden Grafik für die ersten zwei Kollisionen modelhaft dargestellt.

#figure(
  [
    #rect(width: 350pt, height: 350pt, inset: 0pt, stroke: none)[
      #place(top + center, rect(width: 100%, height: 100pt, inset: 0pt, stroke: none)[
        #place(horizon + left, line(length: 100%, stroke: black, angle: 90deg))
        #place(horizon + right, rect(width: 60pt, height: 60pt, inset: 0pt, stroke: color0, fill: bgcolor0, [
          $ M $
          #place(horizon + left, dx: -44%, axis(length: 85%, angle: 180deg))
          #place(horizon + left, dx: -50%, dy: 10pt, [$ V_0 $])
        ]))
        #place(horizon + center, dx: 5%, rect(width: 60pt, height: 60pt, inset: 0pt, stroke: color0, fill: bgcolor0, [
          $ m $
        ]))
      ])
      #place(horizon + center, rect(width: 100%, height: 100pt, inset: 0pt, stroke: none)[
        #place(horizon + left, line(length: 100%, stroke: black, angle: 90deg))
        #place(horizon + center, dx: 15%, rect(width: 60pt, height: 60pt, inset: 0pt, stroke: color0, fill: bgcolor0, [
          $ M $
          #place(horizon + left, dx: -29%, axis(length: 55%, angle: 180deg))
          #place(horizon + left, dx: -33.5%, dy: 10pt, [$ V_1 $])
        ]))
        #place(horizon + left, dx: 15%, rect(width: 60pt, height: 60pt, inset: 0pt, stroke: color0, fill: bgcolor0, [
          $ m $
          #place(horizon + left, dx: -29%, axis(length: 55%, angle: 180deg))
          #place(horizon + left, dx: -33.5%, dy: 10pt, [$ v_1 $])
        ]))
      ])
      #place(bottom + center, rect(width: 100%, height: 100pt, inset: 0pt, stroke: none)[
        #place(horizon + left, line(length: 100%, stroke: black, angle: 90deg))
        #place(horizon + center, dx: 5%, rect(width: 60pt, height: 60pt, inset: 0pt, stroke: color0, fill: bgcolor0, [
          $ M $
          #place(horizon + left, dx: -29%, axis(length: 55%, angle: 180deg))
          #place(horizon + left, dx: -33.5%, dy: 10pt, [$ V_1 $])
        ]))
        #place(horizon + left, dx: 7.5%, rect(width: 60pt, height: 60pt, inset: 0pt, stroke: color0, fill: bgcolor0, [
          $ m $
          #place(horizon + right, dx: 29%, axis(length: 55%))
          #place(horizon + right, dx: 33.5%, dy: 10pt, [$ v_1 $])
        ]))
      ])
    ]
  ],
  caption: [
    Galperins Billiard Problem für die ersten zwei Kollision modelhaft dargestellet
  ]
)

Um Galperins Methode durchzuführen, ist hier die Wahl eines Verhältnisses $d$ der beiden Massen $M$ und $m$ ($d = frac(M, n)$) erforderlich. Für $d$ muss dabei gelten $d = 10^(2(n-1)) and n in NN^*$. Theoretisch könnten alle Kollisionen gezählt werden. Nennen wir diese Anzahl an Kollisionen $K$. Wie Galperin beschreibt, ergäbe sich für $K = floor(pi dot 10^((n-1)))$. $K$ kann nur ganzzahlige Werte haben, denn im definierten System existieren nur ganze Kollisionen, die gezählt werden können. #cite(<ARTICLE:PLAYING-POOL-WITH-PI:2003>) #cite(<ARTICLE:Throwing-Pi-at-a-wall:2019>) $K$ ist equivalent zu den ersten $n$ Stellen von $pi$ somit ist $Pi = frac(K, 10^((n-1)))$ ein Näherungswert für $pi$, der für immer größere $n$ gegen $pi$ strebt. In der folgenden Tabelle sind Werte für $K$, $d$ und dem daraus berechnenten Näherungswert $Pi$ für $pi$ bis $n=9$ aufgelistet.

#figure(
  [
    #table(
      inset: 8pt,
      columns: (auto, auto, auto, auto),
      [$n$], [$K$], [$d$], [$Pi$],
      [
        $1$ \
        $2$ \
        $3$ \
        $4$ \
        $5$ \
        $6$ \
        $7$ \
        $8$ \
        $9$ \
      ],
      align(left)[
        $3$        \
        $31$       \
        $314$      \
        $3141$     \
        $31415$    \
        $314159$   \
        $3141592$  \
        $31415926$ \
        $314159265$\
      ],
      align(left)[
        $10^0$    \
        $10^2$    \
        $10^4$    \
        $10^6$    \
        $10^8$    \
        $10^(10)$ \
        $10^(12)$ \
        $10^(14)$ \
        $10^(16)$ \
      ],
      align(left)[
        $3$          \
        $3.1$        \
        $3.14$       \
        $3.141$      \
        $3.1415$     \
        $3.14159$    \
        $3.141592$   \
        $3.1415926$  \
        $3.14159265$ \
      ]
    )
  ],
  caption: [
    Galperins Billiard Problem für die ersten zwei Kollision modelhaft dargestellet
  ]
)

Diese Werte können mittels einer Physiksimulation bestätigt werden. #cite(<ARTICLE:Throwing-Pi-at-a-wall:2019>) #cite(<VIDEO:How-colliding-blocks-act-like-a-beam-of-light-to-compute-pi.:2019>) #cite(<VIDEO:The-most-unexpected-answer-to-a-counting-puzzle:2019>) #cite(<VIDEO:Why-do-colliding-blocks-compute-pi:2019>) Wie bereits erwähnt, gelten in der gedachten Welt, in der Galperins Methode durchgeführt wird, der Energie- und Impulserhaltungssatz. Der Energieerhaltungssatz kann für $M$, $m$ und den dazugehörigen $V$, $v$ wie folgt geschrieben werden. Nennen wir dabei die gesamt Energie des Systems $q$, $q$ ist eine Konstante.

$
q  = frac(1, 2) M V^2 + frac(1, 2) m v^2
$

Am Anfang bewegt sich das zweite Objekt nicht $v_0 = 0$, $q$ entspricht deshalb der Anfangsenergie des ersten Objekts.

$
q & = frac(1, 2) M V_0^2 + frac(1, 2) m v_0^2            \
q & = frac(1, 2) M V_0^2 + frac(1, 2) m dot 0^2         \
q & = frac(1, 2) M V_0^2 + cancel(frac(1, 2) m dot 0^2) \
q & = frac(1, 2) M V_0^2                                \
$

Der Energieerhaltungssatz lässt sich auch grafisch darstellen. Dazu werden die Geschwindigkeiten beider Objekte jeweils durch eine Koordinate in einem zweidimensionalen Koordinatensystem repräsentiert (jeder Punkt entspricht einem Paar an Geschwindigkeiten $V$ und $v$), ein Problem der Dynamik wird zu einem der Geomentrie. #cite(<ARTICLE:PLAYING-POOL-WITH-PI:2003>) #cite(<VIDEO:Why-do-colliding-blocks-compute-pi:2019>) Sei dafür $x = V$ und $y = v$ im Konfigurationsraum (zweidimensionales Koordinatensystem mit $x$ und $y$-Achse, denen jeweils ein Wert oder Freiheitsgrad eines dynamischen Systems zugeordnet wird), so ergibt sich aus dem Energieerhaltungssatz eine Ellipse mit der Gleichung $q = frac(1, 2) M x^2 + frac(1, 2) m y^2$. #cite(<ARTICLE:The-Dynamics-of-Digits-Calculating-Pi-with-Galperins-Billiards:2017>) #cite(<VIDEO:Why-do-colliding-blocks-compute-pi:2019>)

#figure(
  [
    #default_coordinate_system([
      #place(center + horizon, ellipse(height: 200pt, width: 200pt/3, stroke: color3))
    ])
  ],
  caption: [
    Energieerhaltungssatz als Ellipse im Konfigurationsraum
  ]
)

An dieser Stelle wird eine Verbindung zum Kreis gesucht, eine Neuskalierung des Koordinatensystems ist von Vorteil. #cite(<ARTICLE:The-Dynamics-of-Digits-Calculating-Pi-with-Galperins-Billiards:2017>) #cite(<VIDEO:Why-do-colliding-blocks-compute-pi:2019>) Skalierung der beiden Achsen $x = V$ und $y = v$ durch multiplizieren mit der Wurzel der jeweiligen Masse ($M$ und $m$) ermöglicht eine Umformung des Energieerhaltungssatzes zu einer Form, die der eines Kreises entspricht. Im ersten Schritt wird die Gleichung der Ellipse $q = frac(1, 2) M x^2 + frac(1, 2) m y^2$, die im Konfigurationsraum den Energieerhaltungssatzes repräsentiert, vereinfacht.

$
q  &= frac(1, 2) M V^2 + frac(1, 2) m v^2 \
2q &= M V^2 + m v^2                       \
$

Für $x$ ergibt sich durch multiplizieren mit $sqrt(M)$ Folgendes.

$
		x   &= sqrt(M) V         \
		x   &= sqrt(M) sqrt(V^2) \
		x   &= sqrt(M V^2)       \
		x^2 &= M V^2             \
$

Und für $y$ in ähnlicher Form.

$
		y   &= sqrt(m) v         \
		y   &= sqrt(m) sqrt(v^2) \
		y   &= sqrt(m v^2)       \
		y^2 &= m v^2             \
$

Für $M V^2$ lässt sich dementsprechend $x^2$ und für $m v^2$ gleichermaßen $y^2$ einsetzen.


$
		2q &= M V^2 + m v^2 \
		2q &= x^2 + m v^2    \
		2q &= x^2 + y^2     \
$

Durch Auflösen nach $y$ ergibt sich die Funktion $E_1(x) = sqrt(2q - x^2)$ für die untere und die Funktion $E_2(x) = - sqrt(2q - x^2)$ für die obere Hälfte des Kreises.


$
		2q     & = x^2 + y^2                 \
		y^2    & = 2q + x^2                  \
		y      & = minus.plus sqrt(2q - x^2) \
		E_1(x) & = sqrt(2q - x^2)            \
		E_2(x) & = - sqrt(2q - x^2)          \
$

Die Funktionen $E_1(x) = sqrt(2q - x^2)$ und $E_2(x) = - sqrt(2q - x^2)$ beschreiben einen Kreis zentriert auf dem Ursprung, mit einem Radius $r$ von $r = sqrt(2q)$.

#figure(
  [
    #rect(width: 335pt, height: 240pt, inset: 0pt, stroke: none)[
      #place(left + horizon,
        default_coordinate_system([
          #place(center + horizon,
            circle(radius: 100pt, stroke: color3)
          )
          #place(right + top, rect(width: 100pt, height: 100pt, inset: 0pt, stroke: none)[
            #place(left + bottom, rect(width: 100pt, height: 100pt, inset: 0pt, stroke: none)[
              #line(length: 100%, start: (0%, 100%), angle: -45deg, stroke: color2)
            ])
          ])
          #place(center + horizon, dx: 25%, dy: -9pt, text(fill: color2, [$ r = sqrt(2q) $]))
        ])
      )
      #place(right + horizon, rect(width: 100pt, height: 240pt, inset: 0pt, stroke: none)[
        #place(left + horizon, dy: -36pt, [
          #set text(fill: color3)
          $ E_1(x) = sqrt(2q - x^2) $
        ])
        #place(left + horizon, dy: 28pt, [
          #set text(fill: color3)
          $ E_2(x) = - sqrt(2q - x^2) $
        ])
      ])
    ]
  ],
  caption: [
    Energieerhaltungssatz als $E_1(x)$ und $E_2(x)$ im Konfigurationsraum
  ]
)


Bei jeder Kollision befindet sich der Punkt, der die beiden Geschwindigkeiten der Objekte beschreibt, vor und nach der Kollision auf dem Kreis. Durch den Impulserhaltungssatz wird vorgegeben, wo sich auf dem Kreis, der im Konfigurationsraum den Energieerhaltungssatz repräsentiert, der Punkt befindet, der die Geschwindigkeiten $V$ und $v$ der beiden Objekte nach einer Kollision abbildet. Sei der Gesamtimpuls des Systems $w$, so schreibt sich der Impulserhaltungssatz wie folgt.

$
w = M V + m v
$

Durch Skalierung unter Berücksichtigung des durch $x = sqrt(M) V$ und $y = sqrt(m) v$ definierten Konfigurationsraums und anschließender Umformung nach $y$ ergibt sich die lineare Funktion $I(x) = frac(w - sqrt(M) x, sqrt(m))$ mit der Steigung $I'(x) = - frac(sqrt(M), sqrt(m))$. #cite(<ARTICLE:Throwing-Pi-at-a-wall:2019>) #cite(<VIDEO:Why-do-colliding-blocks-compute-pi:2019>)

$
x         &= sqrt(M) V                    \
y         &= sqrt(m) v                    \
w         &= M V + m v                    \
w         &= sqrt(M) x + sqrt(m) y        \
sqrt(m) y &= w - sqrt(M) x                \
y         &= frac(w - sqrt(M) x, sqrt(m)) \
I(x)      &= frac(w - sqrt(M) x, sqrt(m)) \
$

Diese Funktion $I(x)$ hat zwei Schnittpunkte $P_0$ und $P_1$ mit der Funktion $E_2(x)$. Im Folgenden dargestellt für $M = m = 1$, $V = V_0 = -1$ und $v = v_0 = 0$.

#figure(
  [
    #rect(width: 335pt, height: 240pt, inset: 0pt, stroke: none)[
      #place(left + horizon,
        default_coordinate_system([
          #place(center + horizon,
            circle(radius: 100pt, stroke: color3)
          )
          #place(center + horizon, rect(width: 220pt, height: 220pt, inset: 0pt, stroke: none)[
            #place(left + bottom, line(start: (0pt, 0pt), end: (120pt, 120pt), stroke: color1))
          ])
          #place(left + horizon, dx: -3pt,
            circle(radius: 3pt, stroke: color2, fill: bgcolor2)
          )
          #place(center + bottom, dy: 3pt,
            circle(radius: 3pt, stroke: color2, fill: bgcolor2)
          )
          #place(left + horizon, dx: 4pt, dy: -10pt, [
            #set text(fill: color2)
            $P_0$
          ])
          #place(center + bottom, dx: 10pt, dy: -6pt, [
            #set text(fill: color2)
            $P_1$
          ])
        ])
      )
      #place(right + horizon, rect(width: 100pt, height: 240pt, inset: 0pt, stroke: none)[
        #place(left + horizon, dy: -36pt, [
          #set text(fill: color3)
          $ E_1(x) = sqrt(2q - x^2) $
        ])
        #place(left + horizon, dy: 28pt, [
          #set text(fill: color3)
          $ E_2(x) = - sqrt(2q - x^2) $
        ])
        #place(left + horizon, dy: 90pt, [
          #set text(fill: color1)
          $ I(x) = frac(w - sqrt(M) x, sqrt(m)) $
        ])
      ])
    ]
  ],
  caption: [
    Erste Kollision im Konfigurationsraum
  ]
)

$P_0$ ist der Punkt, der den Zustand des Systems vor der ersten Kollision symbolisiert und dementsprechend $P_1$ der Punkt, der das System nach der Kollision dargestellt. Nur eine Änderung von $V$ und $v$, so dass sie durch den Punkt $P_1$ repräsentiert werden kann, erfüllt sowohl den Energie- als auch den Impulserhaltungssatz und ist damit die einzig mögliche. Nach der ersten Kollision der beiden Objekte wird das zweite Objekt mit der Masse $m$ mit der Wand kollidieren. Jede Kollision mit der Wand reflektiert, wie auch von Galperin definiert, das Objekt, seine Geschwindigkeit $v$ wird negiert (Vorzeichen ändert sich $v_2 = -v_1$). Im Konfigurationsraum ist diese Kollision mit der Wand repräsentiert durch Spiegelung an der $x$-Achse. #cite(<ARTICLE:Throwing-Pi-at-a-wall:2019>) #cite(<VIDEO:Why-do-colliding-blocks-compute-pi:2019>)

#figure(
  [
    #rect(width: 335pt, height: 240pt, inset: 0pt, stroke: none)[
      #place(left + horizon,
        default_coordinate_system([
          #place(center + horizon,
            circle(radius: 100pt, stroke: color3)
          )
          #place(center + horizon, rect(width: 220pt, height: 220pt, inset: 0pt, stroke: none)[
            #place(left + bottom,line(start: (0pt, 0pt), end: (120pt, 120pt), stroke: color1))
          ])
          #place(center + horizon, line(length: 100%, angle: 90deg, stroke: color2))
          #place(left + horizon, dx: -3pt,
            circle(radius: 3pt, stroke: color2, fill: bgcolor2)
          )
          #place(center + bottom, dy: 3pt,
            circle(radius: 3pt, stroke: color2, fill: bgcolor2)
          )
          #place(center + top, dy: -3pt,
            circle(radius: 3pt, stroke: color2, fill: bgcolor2)
          )
          #place(left + horizon, dx: 4pt, dy: -10pt, [
            #set text(fill: color2)
            $P_0$
          ])
          #place(center + bottom, dx: 10pt, dy: -6pt, [
            #set text(fill: color2)
            $P_1$
          ])
          #place(center + top, dx: -10pt, dy: 6pt, [
            #set text(fill: color2)
            $P_2$
          ])
        ])
      )
      #place(right + horizon, rect(width: 100pt, height: 240pt, inset: 0pt, stroke: none)[
        #place(left + horizon, dy: -36pt, [
          #set text(fill: color3)
          $ E_1(x) = sqrt(2q - x^2) $
        ])
        #place(left + horizon, dy: 28pt, [
          #set text(fill: color3)
          $ E_2(x) = - sqrt(2q - x^2) $
        ])
        #place(left + horizon, dy: 90pt, [
          #set text(fill: color1)
          $ I(x) = frac(w - sqrt(M) x, sqrt(m)) $
        ])
      ])
    ]
  ],
  caption: [
    Zweite Kollision im Konfigurationsraum
  ]
)

Wichtig ist anzumerken, dass bei dieser Re­fle­xi­on der Impulserhaltungssatz nicht erfüllt ist und durch Definition nicht erfüllt sein muss, denn die Wand hat eine gedachte unendliche Masse, sie ist nach Definition unbeweglich. #cite(<VIDEO:Why-do-colliding-blocks-compute-pi:2019>) #cite(<ARTICLE:PLAYING-POOL-WITH-PI:2003>) #cite(<ARTICLE:Throwing-Pi-at-a-wall:2019>)

Dieser Vorgang von Kollision der beiden Objekte und anschließender Kollision des zweiten Objekts mit der Wand wiederholt sich, bis sich beide Objekte von der Wand entfernen ($v lt.eq 0$ und $V lt.eq 0$) und die Geschwindigkeit $V$ des ersten Objekts die Geschwindigkeit $v$ des zweiten Objekts übersteigt ($V lt.eq v$). Im Konfigurationsraum dargestellt durch ein Dreieck zwischen der $x$-Achse (repräsentiert $v lt.eq 0$ und $V lt.eq 0$) und einer Line $v = V$ (repräsentiert $V lt.eq v$ und damit die Objekte können nicht mehr kollidieren). #cite(<VIDEO:Why-do-colliding-blocks-compute-pi:2019>) #cite(<ARTICLE:PLAYING-POOL-WITH-PI:2003>) #cite(<ARTICLE:Throwing-Pi-at-a-wall:2019>)

#figure(
  [
    #rect(width: 335pt, height: 240pt, inset: 0pt, stroke: none)[
      #place(left + horizon,
        default_coordinate_system([
          #place(center + horizon, rect(width: 220pt, height: 220pt, inset: 0pt, stroke: none)[
            #place(left + bottom, line(start: (0pt, 0pt), end: (120pt, 120pt), stroke: color1))
            #place(right + top, polygon(fill: bgcolor5, (0.5pt, 109.5pt), (110pt, 0pt), (110pt, 109.5pt)))
            #place(right + top, line(start: (0pt, 110pt), end: (110pt, 0pt), stroke: color5))
          ])
          #place(center + horizon,
            circle(radius: 100pt, stroke: color3)
          )
          #place(center + horizon, line(length: 100%, angle: 90deg, stroke: color2))
          #place(left + horizon, dx: -3pt,
            circle(radius: 3pt, stroke: color2, fill: bgcolor2)
          )
          #place(center + bottom, dy: 3pt,
            circle(radius: 3pt, stroke: color2, fill: bgcolor2)
          )
          #place(center + top, dy: -3pt,
            circle(radius: 3pt, stroke: color2, fill: bgcolor2)
          )
          #place(left + horizon, dx: 4pt, dy: -10pt, [
            #set text(fill: color2)
            $P_0$
          ])
          #place(center + bottom, dx: 10pt, dy: -6pt, [
            #set text(fill: color2)
            $P_1$
          ])
          #place(center + top, dx: -10pt, dy: 6pt, [
            #set text(fill: color2)
            $P_2$
          ])
        ])
      )
      #place(right + horizon, rect(width: 100pt, height: 240pt, inset: 0pt, stroke: none)[
        #place(left + horizon, dy: -36pt, [
          #set text(fill: color3)
          $ E_1(x) = sqrt(2q - x^2) $
        ])
        #place(left + horizon, dy: 28pt, [
          #set text(fill: color3)
          $ E_2(x) = - sqrt(2q - x^2) $
        ])
        #place(left + horizon, dy: 90pt, [
          #set text(fill: color1)
          $ I(x) = frac(w - sqrt(M) x, sqrt(m)) $
        ])
      ])
    ]
  ],
  caption: [
    Definition der letzen Kollision im Konfigurationsraum
  ]
)

$P_2$ befindet sich in diesem Beispiel noch nicht in der definierten Zone (das Dreieck), der erste Schritt, der die Kollision der zwei Objekte abbildet, wiederholt sich. Bei der Kollision mit der Wand hat sich der Wert für den Gesamtimpuls $w$ so geändert, dass die Funktion $I(x)$ durch $P_2$ verläuft, der Schnittpunkt $P_3$ von $I(x)$ und $E_2(x)$. Befindet sich in der definierten Zone, es wird keine weiteren Kollisionen geben, die es zu zählen gilt. #cite(<VIDEO:Why-do-colliding-blocks-compute-pi:2019>) #cite(<ARTICLE:PLAYING-POOL-WITH-PI:2003>) #cite(<ARTICLE:Throwing-Pi-at-a-wall:2019>)

#figure(
  [
    #rect(width: 335pt, height: 240pt, inset: 0pt, stroke: none)[
      #place(left + horizon,
        default_coordinate_system([
          #place(center + horizon, rect(width: 220pt, height: 220pt, inset: 0pt, stroke: none)[
            #place(right + top, polygon(fill: bgcolor5, (0.5pt, 109.5pt), (110pt, 0pt), (110pt, 109.5pt)))
            #place(left + bottom, line(start: (0pt, 0pt), end: (120pt, 120pt), stroke: color1))
            #place(right + top, line(start: (0pt, 0pt), end: (120pt, 120pt), stroke: color1))
            #place(right + top, line(start: (0pt, 110pt), end: (110pt, 0pt), stroke: color5))
          ])
          #place(center + horizon,
            circle(radius: 100pt, stroke: color3)
          )
          #place(center + horizon, line(length: 100%, angle: 90deg, stroke: color2))
          #place(left + horizon, dx: -3pt,
            circle(radius: 3pt, stroke: color2, fill: bgcolor2)
          )
          #place(center + bottom, dy: 3pt,
            circle(radius: 3pt, stroke: color2, fill: bgcolor2)
          )
          #place(center + top, dy: -3pt,
            circle(radius: 3pt, stroke: color2, fill: bgcolor2)
          )
          #place(right + horizon, dx: 3pt,
            circle(radius: 3pt, stroke: color2, fill: bgcolor2)
          )
          #place(left + horizon, dx: 4pt, dy: -10pt, [
            #set text(fill: color2)
            $P_0$
          ])
          #place(center + bottom, dx: 10pt, dy: -6pt, [
            #set text(fill: color2)
            $P_1$
          ])
          #place(center + top, dx: -10pt, dy: 6pt, [
            #set text(fill: color2)
            $P_2$
          ])
          #place(right + horizon, dx: -4pt, dy: 9pt, [
            #set text(fill: color2)
            $P_4$
          ])
        ])
      )
      #place(right + horizon, rect(width: 100pt, height: 240pt, inset: 0pt, stroke: none)[
        #place(left + horizon, dy: -36pt, [
          #set text(fill: color3)
          $ E_1(x) = sqrt(2q - x^2) $
        ])
        #place(left + horizon, dy: 28pt, [
          #set text(fill: color3)
          $ E_2(x) = - sqrt(2q - x^2) $
        ])
        #place(left + horizon, dy: 90pt, [
          #set text(fill: color1)
          $ I(x) = frac(w - sqrt(M) x, sqrt(m)) $
        ])
      ])
    ]
  ],
  caption: [
    Dritte Kollision im Konfigurationsraum
  ]
)

Die Summe der die Punkte verbindenen Linien ergibt $K$ (im Beispiel $K = 3$). Alle Linien, die eine Kollision mit der Wand repräsentieren, verlaufen parallel zueinander (und zur $y$-Achse) und alle Linien, die eine Kollision der beiden Objekte repräsentieren, haben die Steigung $I'(x) = - frac(sqrt(M), sqrt(m))$, verlaufen somit auch parallel zueinander. An jedem Schnittpunkt $P$ bilden die jeweiligen Linien, wie im Folgenden dargestellt, einen überall equivalenten Winkel $phi$.

#figure([
    #default_coordinate_system([
      #place(center + horizon, rect(width: 220pt, height: 220pt, inset: 0pt, stroke: none)[
        #place(left + bottom, line(start: (0pt, 0pt), end: (120pt, 120pt), stroke: color1))
        #place(right + top, line(start: (0pt, 0pt), end: (120pt, 120pt), stroke: color1))
      ])
      #place(center + horizon,
        circle(radius: 100pt, stroke: color3)
      )
      #place(left + horizon, line(length: 100%, angle: 90deg, stroke: color2))
      #place(center + horizon, line(length: 100%, angle: 90deg, stroke: color2))
      #place(right + horizon, line(length: 100%, angle: 90deg, stroke: color2))
      #place(left + horizon, dx: -3pt,
        circle(radius: 3pt, stroke: color2, fill: bgcolor2)
      )
      #place(center + bottom, dy: 3pt,
        circle(radius: 3pt, stroke: color2, fill: bgcolor2)
      )
      #place(center + top, dy: -3pt,
        circle(radius: 3pt, stroke: color2, fill: bgcolor2)
      )
      #place(right + horizon, dx: 3pt,
        circle(radius: 3pt, stroke: color2, fill: bgcolor2)
      )
      #place(left + horizon, rect(width: 100pt, height: 100pt, inset: 0pt, stroke: none, [
        #move(dx: 0%, dy: 25%,
          path(
            closed: false,
            ..arc(radius: 50pt, start: 135deg, end: 180deg)
          )
        )
      ]))
      #place(center + bottom, rect(width: 100pt, height: 100pt, inset: 0pt, stroke: none, [
        #move(dx: 0%, dy: 0%,
          path(
            closed: false,
            ..arc(radius: 50pt, start: 315deg, end: 360deg)
          )
        )
      ]))
      #place(center + top, rect(width: 100pt, height: 100pt, inset: 0pt, stroke: none, [
        #move(dx: 17.5%, dy: 0%,
          path(
            closed: false,
            ..arc(radius: 50pt, start: 135deg, end: 180deg)
          )
        )
      ]))
      #place(right + horizon, rect(width: 100pt, height: 100pt, inset: 0pt, stroke: none, [
        #move(dx: 0%, dy: 0%,
          path(
            closed: false,
            ..arc(radius: 50pt, start: 315deg, end: 360deg)
          )
        )
      ]))
      #place(left + horizon, dx: 4pt, dy: -10pt, [
        #set text(fill: color2)
        $P_0$
      ])
      #place(center + bottom, dx: 10pt, dy: -6pt, [
        #set text(fill: color2)
        $P_1$
      ])
      #place(center + top, dx: -10pt, dy: 6pt, [
        #set text(fill: color2)
        $P_2$
      ])
      #place(right + horizon, dx: -4pt, dy: 9pt, [
        #set text(fill: color2)
        $P_4$
      ])
      #place(left + horizon, dx: 10pt, dy: 33pt, [$phi$])
      #place(center + bottom, dx: -15pt, dy: -34pt, [$phi$])
      #place(center + top, dx: 14pt, dy: 29pt, [$phi$])
      #place(right + horizon, dx: -11pt, dy: -37.5pt, [$phi$])
    ])
  ],
  caption: [
    Winkel $phi$ im Konfigurationsraum
  ]
)

Mit Hilfe des Kreiswinkelsatzes lässt sich beweisen, dass sich alle Kreisbögen zwischen benachbarten Punkten $P$ mit $2 phi$ bemessen lassen.

#figure([
    #default_coordinate_system([
      #place(center + horizon, rect(width: 200pt, height: 200pt, inset: 0pt, stroke: none)[
        #place(left + bottom, line(start: (0pt, 0pt), end: (100pt, 100pt), stroke: color1))
        #place(left + horizon, line(length: 100pt, stroke: color1))
      ])
      #place(center + horizon,
        circle(radius: 100pt, stroke: color3)
      )
      #place(center + horizon, line(length: 100%, angle: 90deg, stroke: color2))
      #place(left + horizon, dx: -3pt,
        circle(radius: 3pt, stroke: color2, fill: bgcolor2)
      )
      #place(center + bottom, dy: 3pt,
        circle(radius: 3pt, stroke: color2, fill: bgcolor2)
      )
      #place(center + top, dy: -3pt,
        circle(radius: 3pt, stroke: color2, fill: bgcolor2)
      )
      #place(center + horizon,
        circle(radius: 3pt, stroke: color2, fill: bgcolor2)
      )
      #place(center + bottom, rect(width: 100pt, height: 100pt, inset: 0pt, stroke: none, [
        #move(dx: 0%, dy: 0%,
          path(
            closed: false,
            ..arc(radius: 50pt, start: 315deg, end: 360deg)
          )
        )
      ]))
      #place(center + horizon, rect(width: 100pt, height: 100pt, inset: 0pt, stroke: none, [
        #move(dx: 0%, dy: 0%,
          path(
            closed: false,
            ..arc(radius: 50pt, start: 270deg, end: 360deg)
          )
        )
      ]))
      #place(left + horizon, dx: 4pt, dy: -10pt, [
        #set text(fill: color2)
        $P_0$
      ])
      #place(center + bottom, dx: 10pt, dy: -6pt, [
        #set text(fill: color2)
        $P_1$
      ])
      #place(center + top, dx: -10pt, dy: 6pt, [
        #set text(fill: color2)
        $P_2$
      ])
      #place(center + bottom, dx: -15pt, dy: -34pt, [$phi$])
      #place(center + horizon, dx: -20pt, dy: -22pt, [$2 phi$])
    ])
  ],
  caption: [
    Winkel $phi$ im Konfigurationsraum
  ]
)

Ein ganzer Kreis hat einen Winkel von $2pi$. Statt die Kollisionen zu zählen, kann also auch berechnet werden, wie oft $2phi$ summiert werden kann, bevor es größer gleich $2pi$ ist oder vereinfacht, wie oft $phi$ summiert werden kann, bevor es größer gleich $pi$ ist. Für $K$ ergibt sich dementsprechend:

$
K dot phi < pi and (K+1) dot phi gt.eq pi and K in NN^*
$

Der Winkel $phi$ berechnet sich aus der Steigung von $I(x)$, $I'(x) = - frac(sqrt(M), sqrt(m))$.

#figure(
  rect(width: 150pt, height: 150pt, inset: 0pt, stroke: none)[

    #place(center + horizon, line(start: (0pt, 0pt), end: (100%, 100%), stroke: color1))
    #place(center + horizon, rect(width: 120pt, height: 120pt, inset: 0pt, stroke: none)[
      #place(center + top, line(length: 100%, stroke: color3))
      #place(right + horizon, line(length: 100%, angle: 90deg, stroke: color2))
      #place(center + bottom, rect(width: 100pt, height: 100pt, inset: 0pt, stroke: none, [
        #move(dx: 60%, dy: 0%,
          path(
            closed: false,
            ..arc(radius: 50pt, start: 315deg, end: 360deg)
          )
        )
      ]))
      #place(right + bottom, dx: -11pt, dy: -34pt, [$phi$])
      #place(center + top, dy: -11pt, [
        #set text(fill: color3)
        $1$
      ])
    ])
    #place(left + bottom, dy: -30pt, [
      #set text(fill: color1)
      $I(x) = frac(w - sqrt(M) x, sqrt(m))$
    ])
    #place(right + horizon, dx: 5pt, [
      #set text(fill: color2)
      $frac(sqrt(M), sqrt(m))$
    ])
  ],
  caption: [
    Winkel $phi$ berechnet aus Steigung von $I(x)$
  ]
)

Für $phi$ gilt daher Folgendes.

$
phi = arctan(frac(sqrt(m), sqrt(M)))
$

Alle Werte, die durch diese Methode für $K$, $d$ und dem daraus berechnenten Näherungswert $Pi$ für $pi$ berechnet werden können, sind identisch mit denen, die zuvor mittels Simulation berechnet wurden.

#figure(
  [
    #table(
      inset: 8pt,
      columns: (auto, auto, auto, auto),
      [$n$], [$K$], [$d$], [$Pi$],
      [
        $1$ \
        $2$ \
        $3$ \
        $4$ \
        $dots.v$ \
      ],
      align(left)[
        $3$        \
        $31$       \
        $314$      \
        $3141$     \
        $dots.v$    \
      ],
      align(left)[
        $10^0$    \
        $10^2$    \
        $10^4$    \
        $10^6$    \
        $dots.v$    \
      ],
      align(left)[
        $3$          \
        $3.1$        \
        $3.14$       \
        $3.141$      \
        $dots.v$     \
      ]
    )
  ],
  caption: [
    Werte für $K$, $d$ und $\Pi$ bis $n=4$
  ]
)

Es ist zu erkennen, warum $K$ equivalent zu den ersten $n$ Stellen von $pi$ ist, denn der $arctan(e)$ nähert sich immer mehr dem Argument $e$ an, je kleiner dieses wird (gerechnet im Bogenmaß). #cite(<ARTICLE:Throwing-Pi-at-a-wall:2019>) #cite(<VIDEO:Why-do-colliding-blocks-compute-pi:2019>) Es gilt:

$
lim_(e -> 0) arctan(e) - e = 0
$

$e$ ist in diesem Fall gleich der Quotient der beiden Wurzeln der Massen $M$ und $m$ ($e = frac(sqrt(m), sqrt(M))$). Tabellarisch numerisch dargestellt:

#figure(
  [
    #table(
      inset: 8pt,
      columns: (auto, auto, auto),
      [$frac(sqrt(m), sqrt(M))$], [$arctan(frac(sqrt(m), sqrt(M)))$], [$abs(arctan(frac(sqrt(m), sqrt(M))))$],
      align(left)[
        $1$      \
        $0.1$    \
        $0.01$   \
        $0.001$  \
        $0.0001$ \
        $dots.v$ \
      ],
      align(left)[
        $arctan(1)$      \
        $arctan(0.1)$    \
        $arctan(0.01)$   \
        $arctan(0.001)$  \
        $arctan(0.0001)$ \
        $dots.v$         \
      ],
      align(left)[
        $approx 0.7853981633974$ \
        $approx 0.0996686524912$ \
        $approx 0.0099996666867$ \
        $approx 0.0009999996667$ \
        $approx 0.0000999999997$ \
        $dots.v$                  \
      ]
    )
  ],
  caption: [
    Werte für $K$, $d$ und $\Pi$ bis $n=4$
  ]
)

Zusammenfassend lässt sich zu Galperins Methode $pi$ zu berechnen zeigen, dass die Anzahl der Kollisionen durch den Energieerhaltungssatz eine direkte Verbindung zum Kreis (ohne Skalierung, zu einer Ellipse) hat. #cite(<ARTICLE:Throwing-Pi-at-a-wall:2019>) #cite(<VIDEO:Why-do-colliding-blocks-compute-pi:2019>) Daraus folgt, auch Galperins Methode lässt sich der 1. Kategorie zuordnen, ihr Zusammenhang mit der Geometrie des Kreises wurde eindeutig belegt.

=== Basler Problem

Das Basler Problem, im Grunde die Frage nach der genauen Summe aller Kehrwerte der natürlichen Zahlen zum Quadrat, wurde erstmals von Pietro Mengoli formuliert und später von Leonhard Euler gelöst. Die folgende Gleichung ist Eulers Lösung des Basler Problems. #cite(<ARTICLE:Summing-inverse-squares-by-euclidean-geometry:2010>) #cite(<VIDEO:Why-is-pi-here-And-why-is-it-squared-A-geometric-answer-to-the-Basel-problem:2018>)

$
frac(pi^2, 6) = sum_(n = 1)^(infinity) frac(1, n^2)
$

Es kann auf verschiedenen Arten bewiesen werden, dass auch hier eine Verbindung zwischen $pi$ und Kreis besteht. #cite(<ARTICLE:Summing-inverse-squares-by-euclidean-geometry:2010>) #cite(<VIDEO:Why-is-pi-here-And-why-is-it-squared-A-geometric-answer-to-the-Basel-problem:2018>) Eulers Lösung beruht beispielweise auf der Taylorreihe der Kardinalsinusfunktion, die ihrerseits wiederum im Zusammenhang mit dem Kreis definiert ist. #cite(<WEB:SincFunction-Wolfram-Research:2021>) #cite(<BOOK:Exploring-Eulers-Constant:2003>) #cite(<ARTICLE:Summing-inverse-squares-by-euclidean-geometry:2010>) #cite(<VIDEO:Why-is-pi-here-And-why-is-it-squared-A-geometric-answer-to-the-Basel-problem:2018>) Auch andere Lösungen können die Verbindung bestätigen. #cite(<ARTICLE:Summing-inverse-squares-by-euclidean-geometry:2010>) #cite(<VIDEO:Why-is-pi-here-And-why-is-it-squared-A-geometric-answer-to-the-Basel-problem:2018>)

== Zusammenführung und Bewertung der Ergebnisse

Alle in der Fallanalyse untersuchen Sachverhalte enthalten bewiesenermaßen einen Zusammenhang zwischen $pi$ und Kreis (konnten alle der 1. Kategorie zugeordnet werden). Anhand der vorliegenden Ergebnisse, sofern keine Mängel im Vorgehen nachzuweisen sind, würde sich deduktiv schließen lassen, dass die Hypothese dieser Arbeit fundiert ist, Substanz hat. Dieser Schluss würde jedoch gravierende Mängel aufweisen. Es wurden zum einen längst nicht alle bekanten Sachverhalte untersucht, die nicht offensichtlich eine Verbindung zwischen Verwendung von $pi$ und der Geometrie des Kreises aufweisen. Zum anderen ist nicht klar, ob eventuell auch Sachverhalte existieren könnten, die in der Mathematik noch nicht bekannt sind, nie sein werden. Es ist daher in Frage zu stellen, ob es überhaupt möglich ist, die Hypothese dieser Arbeit zu beweisen, obwohl kein Gegenbeweis gefunden wurde. Für alle in der Arbeit untersuchten Sachverhalte konnte bewiesen werden, dass ein Zusammenhang zwischen $pi$ und Geometrie des Kreises besteht. Daraus kann allerdings nicht auf eine allgemein gültige Gesetzmäßigkeit geschlossen werden.

= Fazit

Das Ziel der vorliegenden Arbeit war, die Frage "Pi ohne Kreis? Wird Pi ohne den Zusammenhang mit der Geometrie eines Kreises verwendet? (Existieren Sachverhalte, in denen Pi ohne Zusammenhang mit der Geometrie eines Kreises Verwendung findet?)" zu beantworten, um das Verständnis der Kreiszahl $pi$ zu verbessern. Es wurde dazu anfänglich die Hypothese aufgestellt, dass $pi$ definiert ist als das Verhältnis des Durchmessers eines Kreises zu seinem Umfang und so ihre Verwendung immer einen Zusammenhang mit jenem Verhälnis und damit zur Geometrie des Kreises haben müsste. Um die Richtigkeit der anfänglichen Hypothese zu belegen (oder zu widerlegen) wurde an einzelnen Sachverhalten überprüft, ob sie zutrifft, ob sich in dem entsprechenden Sachverhalt eine Verbindung zwischen $pi$ und dem Kreis belegen oder widerlegen lässt. Bei allen hierbei behandelten Sachverhalten trifft die Hypothese zu. In jeder einzelnen ließ sich eindeutig nachweisen, dass ein Zusammenhang zwischen $pi$ und der Geometrie des Kreises besteht. Es kann jedoch nicht deduktiv geschlossen werden, dass die Hypothese dieser Arbeit gesichert ist, denn in dieser Arbeit konnten nicht alle bekannten Sachverhalte untersucht werden, die nicht offensichtlich eine Verbindung zwischen Verwendung von $pi$ und der Geometrie des Kreises aufweisen. Es ist ebenso nicht klar, ob eventuell auch Sachverhalte existieren könnten, die in der Mathematik noch nicht bekannt sind, nie sein werden. Es sei in Frage zu stellen, ob es überhaupt möglich ist, die Hypothese dieser Arbeit zu beweisen. Zur Beantwortung der zentralen Frage dieser Arbeit: für alle in dieser Arbeit untersuchten Sachverhalte konnte bewiesen werden, dass ein Zusammenhang zwischen $pi$ und Geometrie des Kreises besteht. Es kann daraus aber nicht auf eine allgemeine gültige Gesetzmäßigkeit geschlossen werden.

= Ausblick

Für Folgearbeiten würde sich anbieten, weitere Sachverhalte, die in dieser Arbeit keine Erwähnung finden, bezüglich des Zusammenhanges zwischen $pi$ und der Geometrie des Kreises zu untersuchen, um die Ergebnisse dieser Arbeit zu stärken oder anzuzweifeln. In diesem Zusammenhang ist auch wichtig, zu klären, auf welche Art und Weise sich $pi$ überhaupt in einem Sachverhalt nachweisen lässt (mag es sein, dass $pi$ nur durch die Geometrie des Kreises überhaupt nachweisbar ist).
