# Reduce flickering on custom invalidate/paint 


Say we are doing custom painting on a panel, and we want to reduce flickering as much as possible.
There's a few ways to do it, but this is the greatest...

Let's say your panel is called `this.splitContainerMain.Panel2`, then do this in your form constructor...

        
        typeof(Panel).InvokeMember("DoubleBuffered",
        BindingFlags.SetProperty | BindingFlags.Instance | BindingFlags.NonPublic,
        null, this.splitContainerMain.Panel2, new object[] { true });

        
Background info on how this sort of thing is done...

In a method, such as RefreshPanel() (which is also called very early in form's life)

        var bitMap = new Bitmap(splitContainerMain.Panel2.Width, splitContainerMain.Panel2.Height);
            
        using (var g = Graphics.FromImage(bitMap)) {
            //Do your custom drawing... something more inspired than this hopefully
            g.DrawRectangle(System.Drawing.Pens.Black, 10, 10, 10, 10);
        }                
        
        //This causes the repaint!
        this.splitContainerMain.Panel2.Invalidate();
        
And then, in the paint method, just render the bitmap.

        private void splitContainer1_Panel2_Paint(object sender, PaintEventArgs e)
        {
            if (bitMap == null) return;
            e.Graphics.DrawImage(bitMap, new Point(0, 0));
        }


## Source

 * <http://stackoverflow.com/questions/8046560/how-to-stop-flickering-c-sharp-winforms>

