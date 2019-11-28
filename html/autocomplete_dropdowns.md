# HTML supports autocomplete-style dropdowns


> HTML has native support for autocomplete-style dropdowns attached to inputs via the `<datalist>` element. 
>
> This input behaves like a `<select>` but you can type text in it and choose a specific value.


Source: [@tejaskumar_](https://twitter.com/tejaskumar_/status/1194689434656088065?s=21)

	<input list="beatles" placeholder="Start typing...">
	<datalist id="beatles">
		<option value="John">
		<option value="Yoko">
		<option value="Paul">
		<option value="George">
		<option value="Ringo">
		<option value="Pete">
	</datalist>


See `list` points to id of `datalist`.