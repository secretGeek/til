# Case Sensitive String Comparison


Make a comparison behave in a case-sensitive manner by applying a case-sensitive collation

	Select 'Hello'
	where 'A' = 'a' COLLATE Latin1_General_CS_AS 
