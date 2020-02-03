# Find Whitespace in Object Names

Table names with embedded zero width spaces, or trailing spaces, or CR's, Linefeeds etc -- they can ruin your whole day.

Here's a quick query to find any in a database....


	Select
		'[' + SCHEMA_NAME(uid) + '].[' + name + ']' as [Object],
		Crdate as [Created],
		Case
			when name like '%' + char(13) + '%' then 'carriage return '
			when name like '%' + char(10) + '%' then 'line feed '
			when name like '%' + NCHAR(0x00A0) + '%' then 'non breaking space '
			when name like '%' + NCHAR(9) + '%' then 'tab '
			when name like '% ' then 'trailing space '
			when name like ' %' then 'leading space '
			else 'No problem'
		end as Reason
	from
		sysobjects
	where
		   name like '%' + char(13) + '%' --carriage return
		or name like '%' + char(10) + '%' --line feed
		or name like '%' + NCHAR(0x00A0) + '%' --non breaking space
		or name like '%' + NCHAR(9) + '%' --tab
		or name like '% ' --trailing space
		or name like ' %' --leading space
	order by 1


I should improve this to cover all of these:

	0x0085, -- NEL (control character next line)
	0x00A0, -- NBSP (NO-BREAK SPACE)
	0x1680, -- OGHAM SPACE MARK
	0x180E, -- MONGOLIAN VOWEL SEPARATOR
	0x2000, -- EN QUAD
	0x2001, -- EM QUAD
	0x2002, -- EN SPACE
	0x2003, -- EM SPACE
	0x2004, -- THREE-PER-EM SPACE
	0x2005, -- FOUR-PER-EM SPACE
	0x2006, -- SIX-PER-EM SPACE
	0x2007, -- FIGURE SPACE
	0x2008, -- PUNCTUATION SPACE
	0x2009, -- THIN SPACE
	0x200A, -- HAIR SPACE
	0x200B, -- ZERO WIDTH SPACE
	0x2028, -- LS (LINE SEPARATOR)
	0x2029, -- PS (PARAGRAPH SEPARATOR)
	0x202F, -- NNBSP (NARROW NO-BREAK SPACE)
	0x205F, -- MMSP (MEDIUM MATHEMATICAL SPACE)
	0x3000, -- IDEOGRAPHIC SPACE
	0xFEFF  -- ZERO WIDTH NO-BREAK SPACE

...which found at: <https://www.rmjcs.com/SQL-Server/T-SQL-Functions/Trim-Whitespace>
