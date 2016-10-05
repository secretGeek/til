# How to convert between kilobytes megabytes gigabytes etc?

It's easy!

    (763392)/ 1KB
    745.5

    (763392)/ 1MB
    0.72802734375

How bout gigabytes, terrabytes or petabytes?

    (763392)/ 1GB
    0.000710964202880859

    (763392)/ 1TB
    6.94300979375839E-07
    
    (763392)/ 1PB
    6.78028300171718E-10


|unit|size|
|----|----|
|1KB|1024|
|1MB|1048576|
|1GB|1073741824|
|1TB|1099511627776|
|1PB|1125899906842624|

And you can round them, as follows:

    (763392/1MB).ToString("0.00")
    0.73
