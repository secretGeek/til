# AppHarbor Keep alive

My sample app on AppHarbor is very slow to start up &mdash; but lickety split when it's running.

You can use "background workers" at appHarbor to run console apps that perform actions such as keeping the site warm, rebuilding indexes etc. See for example http://www.jefclaes.be/2013/01/keeping-your-appharbor-application-pool.html and https://support.appharbor.com/kb/getting-started/background-workers &mdash; but these are not available on the free plan, so you are looking at $49 a month minimum.

So instead I'm using [StatusCake](https://www.statuscake.com/) &mdash; free plan &mdash; to ping a particular URL (http://guessaguid.apphb.com/api/leaderboard) on the application every 5 minutes. This should keep the app pool alive and responsive.

My experience so far is that the application is kept alive and remains very responsive.

## Source

 * https://coderwall.com/p/qqqxbg/workaround-for-appharbor-s-20-minute-app-pool-recycling