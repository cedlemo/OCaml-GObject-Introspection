 .PHONY : coverage
 coverage :
	BISECT_ENABLE=YES jbuilder runtest
	bisect-ppx-report -html _coverage/ `find . -name 'bisect*.out'`
