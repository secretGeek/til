# Need to add selects/dropdowns to a basic asp.net MVC site?

The classic jquery plugin for this is [`Chosen`](https://harvesthq.github.io/chosen/) and its more up to date descendant, [`Select2`](https://select2.github.io/)  ([What are the differences?](http://stackoverflow.com/questions/13575531/what-are-the-differences-between-chosen-and-select2))

I'd forgotten all about these until I needed them today.

To use `Select2`:

Add the nuget package for `select2` (and `jquery` if you haven't already)

If it hasn't automatically added the `select2.css` and `select2.js` to your `_layout.cshtml` then do that manually. Like a primitive cave dweller.


For implementation patterns see: 

* [How to add dynamically populated selects/dropdowns to a basic asp.net MVC site?](select_dynamic_dropdowns.md)
* [How to add multi-select dropdowns to a basic asp.net MVC site?](select_multi_dropdowns.md)



Here's some rough CSS I added to `site.css`, to make these fit in with Twitter Bootstrap a little better:

    .select2-container {
        font-size: 1.2em;
    }
    .select2-container--default .select2-selection--single {
        border-radius: 0;
    }

	/* Select 2 styling hacks...*/
	.select2-container--default .select2-selection--multiple {
		border: 1px solid #CCC;
		box-shadow: inset 0px 1px 1px rgba(0,0,0,0.075);
		width: 280px;
	}
	.select2-container--default.select2-container--focus .select2-selection--multiple {
		border-color: #66afe9;
		outline: 0;
		-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
		box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
	}

	/* end select2 */
