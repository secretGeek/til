# Copy element to clipboard

Here's a general 'vanilla js' solution:

	<pre id="mypre">Hello world2!</pre>
	<button onclick="copytext('#mypre')">hello</button>
	
	<script>
	function copytext(selector) {
		const element = document.querySelectorAll(selector)[0];
		if (element === undefined) {
			console.log('no element found');
			return;
		}
		const copyText = element.textContent;
		const textArea = document.createElement('textarea');
		textArea.style.position = "absolute";
		textArea.style.left = "-100%";
		textArea.textContent = copyText;
		document.body.append(textArea);
		textArea.select();
		document.execCommand("copy");
		//TODO: visually indicate success...
		//alert(copyText);
	}
	</script>
