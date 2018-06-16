/# @name dtf Datetime Formatter
/# @package lib

/# @see https://support.office.com/en-us/article/format-a-date-the-way-you-want-8e10019e-d5d8-47a1-ba95-db95123d273e

\d .dtf

months:string `January`February`March`April`May`June`July`August`September`October`November`December;
monthsMap:(1+til 12)!months;
days:`Monday`Tuesday`Wednesday`Thursday`Friday`Saturday`Sunday;
split:"/ -,";      /# @bullet Currently supports these 4 separators : "/" , " ", "," & "-"



