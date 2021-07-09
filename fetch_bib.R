requireNamespace("zoterro")

r <- zoterro::zotero_api(
  user = zoterro::zotero_group_id(2389504),
  path = "items",
  query = list(format = "bibtex")
)

cat(rawToChar(r), file = "nfa.bib")
