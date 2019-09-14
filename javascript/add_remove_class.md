# add or remove a class

We're going to look at all the elements with a class of cat, and then test for a class, remove a class, and add a class.

Everything you need to do with a class. Pretty much.

	for(const cat of $(".cat")) {
		if (cat.classList.contains('fleas')) {
			// The cat has the fleas class... remove it
			this.classList.remove('fleas');
			this.classList.add('clean');
		}
	}

