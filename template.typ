#let project(
  title: "",
  authors: (),
  date: none,
  bib: none,
  bib-title: none,
  numbering-skip-outline: true,
  body,
) = {
  set document(author: authors, title: title)
  set page(numbering: if numbering-skip-outline { none } else { "1" })
  set text(font: "Linux Libertine", lang: "de")
  set heading(numbering: "1.1")

  text(1.1em, date)
  v(1.2em, weak: true)
  text(2em, weight: 700, title)

  // Author information.
  pad(
    top: 0.7em,
    right: 20%,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(start, strong(author))),
    ),
  )
  pagebreak()

  // Table of contents.
  outline(depth: 5, indent: true)
  pagebreak()

  // Page numbering.
  set page(numbering: "1")
  if numbering-skip-outline {
    counter(page).update(1)
  }

  // Main body.
  set par(justify: true)

  body

  // Display the bibliography, if any is given.
  if bib != none {
    pagebreak()
    show bibliography: set text(8.5pt)
    show bibliography: pad.with(x: 0.5pt)
    show bibliography: set heading(numbering: "1.1")
    bibliography(bib, title: bib-title)
  }
}

#let regular_polygon(
  radius: 10pt,
  sides: 4,
  inner: false,
  fill: none,
  stroke: black + 1pt,
) = {
  let halfstep = calc.pi / sides
  let step = 2 * halfstep

  if inner {
    radius = radius / calc.cos(halfstep)
  }

  let side = calc.tan(halfstep) * radius

  let calc-x(n) = (calc.cos((step * n) - halfstep + (calc.pi/2)) * radius)
  let calc-y(n) = (calc.sin((step * n) - halfstep + (calc.pi/2)) * radius)

  let offset-x = 0 * radius
  let offset-y = 0 * radius

  for n in range(sides) {
    let x = calc-x(n)
    let y = calc-y(n)

    if x > offset-x {
      offset-x = x
    }

    if y > offset-y {
      offset-y = y
    }
  }

  let calc-vert(n) = {
    let x = (calc-x(n) + offset-x)
    let y = (calc-y(n) + offset-y)
    ((x, y),)
  }

  let vertices = for n in range(sides) {
    calc-vert(n)
  }

  polygon(
    fill: fill,
    stroke: stroke,
    ..vertices
  )
}

#let help_lines(
  width: 220pt,
  height: 220pt,
  x-start: 10pt,
  y-start: 10pt,
  x-spacing: 20pt,
  y-spacing: 20pt,
  stroke: (paint: gray.lighten(20%), dash: "densely-dashed", thickness: 0.5pt)
) = {
  let x-lines = calc.ceil((width - x-start) / x-spacing)
  let y-lines = calc.ceil((height - y-start) / y-spacing)

  rect(width: width, height: height, inset: 0pt, stroke: none)[
      #for n in range(x-lines) {
        place(top + left, line(start: ((n * x-spacing) + x-start, 0%), length: height, angle: 90deg, stroke: stroke))
      }

      #for n in range(y-lines) {
        place(top + left, line(start: (0%, (n * y-spacing) + y-start), length: height, stroke: stroke))
      }
  ]
}

#let axis(
  length: 100%,
  size: 2pt,
  fill: black,
  strocke: black,
  angle: 0deg
) = rotate(angle + 90deg, rect(width: size, height: length, inset: 0pt, stroke: none)[
  #line(length: length, start: (50%, 0%), angle: 90deg)
  #place(top + center, regular_polygon(sides: 3, radius: size, fill: fill))
])

#let axes(
  width: 100%,
  height: 100%,
  size: 2pt,
  fill: black,
  strocke: black
) = rect(width: width, height: height, inset: 0pt, stroke: none)[
  #place(center + horizon, axis(length: width, size: size, fill: fill, strocke: strocke))
  #place(center + horizon, axis(length: height, size: size, fill: fill, strocke: strocke, angle: -90deg))
]

#let arc(start: 0deg, end: 90deg, radius: 100%/2, segments: 10) = {

  let bezier_arc(start: (x: 100, y: 0), end: (x: 200, y: 100), center: (x: 100, y: 100)) = {
    let point_minus(a, b) = {
      (x: a.x - b.x, y: a.y - b.y)
    }

    let point_mirror(a) = {
      (x: -a.x, y: -a.y)
    }

    let a = point_minus(start, center)
    let b = point_minus(end, center)

    let q1 = a.x * a.x + a.y * a.y
    let q2 = q1 + a.x * b.x + a.y * b.y
    let k2 = (4.0 / 3.0) * (calc.sqrt(2.0 * q1 * q2) - q2) / ((a.x * b.y) - (a.y * b.x))

    let control_1 = (x: center.x + a.x - k2 * a.y, y: center.y + a.y + k2 * a.x)
    let control_2 = (x: center.x + b.x + k2 * b.y, y: center.y + b.y - k2 * b.x)

    control_1 = point_minus(control_1, start)
    control_2 = point_minus(control_2, end)

    control_1 = point_mirror(control_1)

    (
      ((start.x, start.y), (control_1.x, control_1.y)),
      ((end.x, end.y), (control_2.x, control_2.y))
    )
  }


  let start = start - 180deg
  let end = end - 180deg

  let segment = (end - start) / segments

  let segs = for n in range(segments) {
    let a = (x: - (calc.sin(start + (n * segment))), y: calc.cos(start + (n * segment)))
    let b = (x: - (calc.sin(start + ((n + 1) * segment))), y: calc.cos(start + ((n + 1) * segment)))

    bezier_arc(start: a, end: b, center: (x: 0, y: 0))
  }

  let ret = ()

  for (i, e) in segs.enumerate() {
    if calc.mod(i, 2) == 0 {
      ret.push(e)
    }
  }
  ret.push(segs.last())

  ret.map(
    ((a, b)) => {
      let (ax, ay) = a
      let (cx, cy) = b
      ((ax * radius, ay * radius), (cx * radius, cy * radius))
    }
  )
}
