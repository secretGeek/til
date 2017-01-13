# backoff (i.e. slow down) hitting the API

Here's what the JSON looks like when the stackexchange api tells you to backoff (i.e. to make less requests)...

    {
      "items": [
        {
     ...
        }
      ],
      "backoff": 10
    }
    
Here's how I back off...


    if (jsonBody.IndexOf("backoff") >= 0)
    {
        if (data.backoff != null)
        {
            int delay = (int)data.backoff.Value;
            System.Threading.Thread.Sleep(delay * 1000);
        }
    }
