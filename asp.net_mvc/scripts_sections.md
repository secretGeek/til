# Scripts and Sections

Sometimes you want your view to add a little bit to more than one part of the layout .

Look I'm not describing this well.

In your `_layout.cshtml` there's a part that says:

    @RenderBody()
    
...and that's where the current view is rendered. Fine.

But sometimes you want the view to control some other parts of the template. For example it controls the title, by the doing this:

    @{
        ViewBag.Title = "View sets the title";
    }

And `_layout.cshtml` says:

        <title>@ViewBag.Title</title>

...so we're golden.

But also, sometimes you want your script loading to happen at the end of the page, after rendering the view. And then, even after that, you want some view specific scripts to run. Here's how to do that. In the `_layout.cshtml` say:

    @RenderSection("Scripts", false)

    
(Where `Scripts` is a word of your choosing.)

Then in the view, specify what to put in the `Scripts` section, like so:

    @section Scripts {
        <!-- anything you want... e.g. -->
        <script type='text/javascript'>
        alert('View specific js');
        </script>
    }

...and it's entirely optional. Layout can define a section, Views don't have to populate it.