# Press Ctrl-A to select all in a textbox

**NOTE** textbox must be multiline.


    private void txtSQL_KeyDown(object sender, KeyEventArgs e)
    {
        KeyPressSelectAll(txtSQL, e);
    }

    private void txtResult_KeyDown(object sender, KeyEventArgs e)
    {
        KeyPressSelectAll(txtResult, e);
    }

    private void KeyPressSelectAll(TextBoxBase t, KeyEventArgs e)
    {
        if (e.Control && !e.Alt && e.Modifiers != Keys.RMenu)
        {
            if (e.KeyCode == Keys.A)
            {
                //Select all text
                t.SelectAll();
                //t.Focus(); <-- Optional. See note below.
                e.Handled = true;
            }
        }
    }
    


regarding 't.Focus()'
    
If the KeyPressSelectAll method can be triggerd by a different control, e.g. a button or menu, then you might also want to set focus to the textbox, so that the selection is made visible.

