# How to call native commands from .net core.


SOOOO easy!

using System;

    namespace ConsoleApplication
    {
        public class Program
        {
            public static void Main(string[] args)
            {
                Console.WriteLine("Hello World!");
                System.Diagnostics.Process.Start("ls"); // This works!

            }
        }
    }
    
No need for any extra references or anything.    