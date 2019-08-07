# Copy element to clipboard

Here's a general 'vanilla js' solution:

	<pre id="mypre">Hello world2!</pre>
	<button onclick="copytext(document.querySelectorAll('#mypre')[0].textContent)">hello</button>

	<script>
	function copytext(copyText) {
		const textArea = document.createElement('textarea');
		textArea.style.position = "absolute";
		textArea.style.left = "-100%";
		textArea.textContent = copyText;
		document.body.appendChild(textArea);
		textArea.select();
		document.execCommand("copy");
		//Consider: visually indicate success...
		//alert(copyText);
	}
	</script>


When you want just a single word/term that is copyable....

	<code onclick="copytext('%name%');" class="copyable" title="click to copy">%name%</code>
	<code onclick="copytext('%email%');" class="copyable" title="click to copy">%email%</code>
	<code onclick="copytext('%unsub%');" class="copyable" title="click to copy">%unsub%</code>

And this styling works for me:

	code.copyable {

		background-color:white;
		border:1px solid #CCC;
		border-radius:5px;
		padding:2px 4px;
	}
		code.copyable:hover {
		cursor: pointer;
		}
