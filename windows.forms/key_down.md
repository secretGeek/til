# Form Wide Hotkeys...

For the form, make sure to set `this.KeyPreview = true;`

Then you can define form-wide hotkeys like so...

    private void frmMain_KeyDown(object sender, KeyEventArgs e)
    {
        e.Handled = false;
        e.SuppressKeyPress = false;
        //F5,  Ctrl+E, Alt+X  .... all Execute! (just like query analyzer)
        if ((e.KeyCode == Keys.F5 && !e.Shift)
            || (e.KeyCode == Keys.E && e.Control)
            || (e.KeyCode == Keys.X && e.Alt))
        {
            e.Handled = true;
            e.SuppressKeyPress = true;
            Execute();
            return;
        }

        if (e.KeyCode == Keys.F5 && e.Shift)
        {
            e.Handled = true;
            e.SuppressKeyPress = true;
            Cancel();
            return;
        }
    }

