#!/bin/env nu
def main --wrapped [...args] {
    let args = $args | str join " "
    echo $"typst-live -A 0.0.0.0 -P 8476 -T -R src/main.pdf\ntypst watch src/main.typ ($args)" | rust-parallel
}
