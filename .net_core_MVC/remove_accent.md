# Remove accent

When 'slugifying' a string (and when 'canonicalizing' a username) i like to remove accents, and this was sufficient in classic .net:


    //using System.Text

    public static string RemoveAccent(this string txt)
    {
        byte[] bytes = Encoding.GetEncoding("Cyrillic").GetBytes(txt);
        return Encoding.ASCII.GetString(bytes);
    }


But in .net core it crashed with:

   
> 'Cyrillic' is not a supported encoding name.

    
The magic incantation was to add:

    Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);

To wit:
    
    //using System.Text
    
    public static string RemoveAccent(this string txt)
    {
        Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);

        byte[] bytes = Encoding.GetEncoding("Cyrillic").GetBytes(txt);
        return Encoding.ASCII.GetString(bytes);
    }

And thus we end up with our slugify extension method working again:

    public static string ToSlug(this string self, int maxLength = 45)
    {
        string str = self.RemoveAccent().ToLower();
        // remove invalid chars
        str = Regex.Replace(str, @"[^a-z0-9\s-]", "");
        // multiple spaces into one space
        str = Regex.Replace(str, @"\s+", " ").Trim();
        // max length
        str = str.Substring(0, Math.Min(maxLength, str.Length));
        // space to hyphens
        str = str.Replace(" ", "-"); 
        return str;
    }

