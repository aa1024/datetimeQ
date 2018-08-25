# datetimeQ

Collection of q functions for :
datetime formatting (mostly excel) 
````
q).dtf.format["yy-mm-dd hh:uu:ss.000"; 2018.06.08T01:02:03.456]  
"18-06-08 21:02:03.456"

q).dtf.format["d mmmm, dddd ,yyyy"; 2018.06.18];
"18 June, Tuesday ,2018"

q).dtf.format["d/m/yyyy"; 2018.06.08]
"8/6/2018"
````

* ~~datetime helper functions~~

# Format Supported 

Currently it supports the excel way of formatting the dates (except the minutes, it is supported as kdb `minute` (`type u`) )

The following table taken has been taken from [excel support](https://support.office.com/en-us/article/create-or-delete-a-custom-number-format-78f2a361-936b-4c03-8772-09fab54be7f4#bm1)

Please check out the [wiki page](https://github.com/aa1024/datetimeQ/wiki/) for supported functions and examples.


**To display**                              | **Use this code**
---                                         | ---
Months as 1-12                              | m
Months as 01-12                             | mm
Months as Jan-Dec                           | mmm
Months as January-December                  | mmmm
Months as the first letter of the month     | mmmmm
Days as 1-31                                | d
Days as 01-31                               | dd
Days as Sun-Sat                             | ddd
Days as Sunday-Saturday                     | dddd
Years as 00-99                              | yy
Years as 1900-9999                          | yyyy
Hours as 0-23                               | h
Hours as 00-23                              | hh
Minutes as 0-59                             | u (**instead of excel m**)
Minutes as 00-59                            | uu (**instead of excel mm**)
Seconds as 0-59                             | s
Seconds as 00-59                            | ss  
Time as 4 AM                                | h AM/PM
Time as 4:36 PM                             | h:mm AM/PM
Time as 4:36:03 P                           | h:mm:ss A/P
Time as 4:36:03.75                          | h:mm:ss.00
