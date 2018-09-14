# Find headings in markdown...

To list the headings from a markdown document

	cat .\20_Find_Your_Product.md | select-string -pattern "^( )*#.*"

(Assuming it's pure markdown, no mixed in html)

	And the common alias for `select-string` is `sls`, so for brevity:

	cat .\20_Find_Your_Product.md | sls "^( )*#.*"


