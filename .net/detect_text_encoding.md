# Detect the encoding of a file

Well this is a doozy, and bound to require constant upkeep.

I always start off reading files like this...


    using (var sr = new StreamReader(fileName))


Then, someone complains that their non-ascii files weren't read correctly, I ask for example files, perform some tests and end up with this:


    using (var sr = new StreamReader(fileName, System.Text.Encoding.UTF8))

It works for a while, then I receive more complaints and more test files. I see that it doesn't work for the new test files. Hmm.

I studiously avoid thinking about ["The Absolute Minimum Every Software Developer Absolutely, Positively Must Know About Unicode and Character Sets (No Excuses!)"](https://www.joelonsoftware.com/2003/10/08/the-absolute-minimum-every-software-developer-absolutely-positively-must-know-about-unicode-and-character-sets-no-excuses/).

I can open the file in NotePad++ and see under the conveniently named "Encoding" menu, exactly which encoding NotePad++ decides on for a given file.

Then I go to stack overflow and find an answer, with a lot of upvotes, which almost works for me.

Only change I had to make is highlighted below:


    /// <summary>
    /// Determines a text file's encoding by analyzing its byte order mark (BOM).
    /// Defaults to ASCII when detection of the text file's endianness fails.
    /// </summary>
    /// <param name="filename">The text file to analyze.</param>
    /// <returns>The detected encoding.</returns>
    private static Encoding GetEncoding(string filename)
    {
        // Read the BOM
        var bom = new byte[4];
        using (var file = new FileStream(filename, FileMode.Open, FileAccess.Read))
        {
            file.Read(bom, 0, 4);
        }

        // Analyze the BOM
        if (bom[0] == 0x2b && bom[1] == 0x2f && bom[2] == 0x76) return Encoding.UTF7;
        if (bom[0] == 0xef && bom[1] == 0xbb && bom[2] == 0xbf) return Encoding.UTF8;
        if (bom[0] == 0xff && bom[1] == 0xfe) return Encoding.Unicode; //UTF-16LE
        if (bom[0] == 0xfe && bom[1] == 0xff) return Encoding.BigEndianUnicode; //UTF-16BE
        if (bom[0] == 0 && bom[1] == 0 && bom[2] == 0xfe && bom[3] == 0xff) return Encoding.UTF32;
        return Encoding.Default; // **Changed this line**
    }


And use it thus:

    var encoding = GetEncoding(fileName);
    using (var sr = new StreamReader(fileName, encoding)) // System.Text.Encoding.UTF8))

I am certain this will require further changes in future.


## Source

 * [Stack Overflow: Effective way to find any file's Encoding](http://stackoverflow.com/questions/3825390/effective-way-to-find-any-files-encoding)
 * ["The Absolute Minimum Every Software Developer Absolutely, Positively Must Know About Unicode and Character Sets (No Excuses!)"](https://www.joelonsoftware.com/2003/10/08/the-absolute-minimum-every-software-developer-absolutely-positively-must-know-about-unicode-and-character-sets-no-excuses/)
 * [A Programmer's Introduction to Unicode](http://reedbeta.com/blog/programmers-intro-to-unicode/)
 * [A Practical Guide to Character Sets and Encodings](https://medium.com/@keithgabryelski/a-practical-guide-to-character-sets-and-encodings-b5362447456f#.dn0guodnz)