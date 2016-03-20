# Clear Caches

It's not as simple as:

    MemoryCache.Default.Dispose();

Once you've done that, subsequently adding items to the cache will silently fail.

A method that *does* work &mdash; but is reportedly too drastic as it is:

 1. slow and
 2. blocks access to the cache during that slow operation is:

    public static void ClearCaches()
    {
        foreach (var element in MemoryCache.Default)
        {
            MemoryCache.Default.Remove(element.Key);
        }
    }

For the small-scale sites I'm used to, that is adequate.

An actually correct method, from http://stackoverflow.com/a/22388943/49


    // By Thomas F. Abraham (http://www.tfabraham.com)
    namespace CacheTest
    {
        using System;
        using System.Diagnostics;
        using System.Globalization;
        using System.Runtime.Caching;

        public class SignaledChangeEventArgs : EventArgs
        {
            public string Name { get; private set; }
            public SignaledChangeEventArgs(string name = null) { this.Name = name; }
        }

        /// <summary>
        /// Cache change monitor that allows an app to fire a change notification
        /// to all associated cache items.
        /// </summary>
        public class SignaledChangeMonitor : ChangeMonitor
        {
            // Shared across all SignaledChangeMonitors in the AppDomain
            private static event EventHandler<SignaledChangeEventArgs> Signaled;

            private string _name;
            private string _uniqueId = Guid.NewGuid().ToString("N", CultureInfo.InvariantCulture);

            public override string UniqueId
            {
                get { return _uniqueId; }
            }

            public SignaledChangeMonitor(string name = null)
            {
                _name = name;
                // Register instance with the shared event
                SignaledChangeMonitor.Signaled += OnSignalRaised;
                base.InitializationComplete();
            }

            public static void Signal(string name = null)
            {
                if (Signaled != null)
                {
                    // Raise shared event to notify all subscribers
                    Signaled(null, new SignaledChangeEventArgs(name));
                }
            }

            protected override void Dispose(bool disposing)
            {
                SignaledChangeMonitor.Signaled -= OnSignalRaised;
            }

            private void OnSignalRaised(object sender, SignaledChangeEventArgs e)
            {
                if (string.IsNullOrWhiteSpace(e.Name) || string.Compare(e.Name, _name, true) == 0)
                {
                    Debug.WriteLine(
                        _uniqueId + " notifying cache of change.", "SignaledChangeMonitor");
                    // Cache objects are obligated to remove entry upon change notification.
                    base.OnChanged(null);
                }
            }
        }

        public static class CacheTester
        {
            public static void TestCache()
            {
                MemoryCache cache = MemoryCache.Default;

                // Add data to cache
                for (int idx = 0; idx < 50; idx++)
                {
                    cache.Add("Key" + idx.ToString(), "Value" + idx.ToString(), GetPolicy(idx));
                }

                // Flush cached items associated with "NamedData" change monitors
                SignaledChangeMonitor.Signal("NamedData");

                // Flush all cached items
                SignaledChangeMonitor.Signal();
            }

            private static CacheItemPolicy GetPolicy(int idx)
            {
                string name = (idx % 2 == 0) ? null : "NamedData";

                CacheItemPolicy cip = new CacheItemPolicy();
                cip.AbsoluteExpiration = System.DateTimeOffset.UtcNow.AddHours(1);
                cip.ChangeMonitors.Add(new SignaledChangeMonitor(name));
                return cip;
            }
        }
    }


I hate this, but haven't found anything better.


## See Also

 * http://stackoverflow.com/questions/4183270/how-to-clear-the-net-4-memorycache
 * http://stackoverflow.com/questions/8043381/how-do-i-clear-a-system-runtime-caching-memorycache/8043556#8043556