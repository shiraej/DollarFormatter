#!/usr/bin/perl

use strict;
use vars();

my $number = 10000.53;
my $formattednum = dollarformatter($number);
print "formattednum = $formattednum \n";
my $formattedrange = rangeformatter('10000-5000');
print "formatted range = $formattedrange";

sub dollarformatter {
	my $number = $_[0];
	my $numberlength = length ("$number");
	my $n=1;  
	my @formattednum = ();
	while($numberlength>($n-1)) {
		if ($n % 3 == 0) {
			unshift(@formattednum, substr ("$number", (-$n),1));
			if ($n != $numberlength) {
				unshift(@formattednum, ",");
			}
			$n+=1;
			}else {
			unshift(@formattednum, substr ("$number", (-$n),1));
			$n+=1;
		}
	}
	unshift(@formattednum, '$');
	my $formattednum = join ('', @formattednum);
	
	return $formattednum;
}
sub rangeformatter {
	my $numrange = $_[0];
	my $dashindex = index ($numrange, '-');
	if ($dashindex == -1) {
		return dollarformatter($numrange)
	}
	my $num1 = substr ($numrange, 0, $dashindex);
	my $num2 = substr ($numrange, $dashindex+1);
	my $formattednum1 = dollarformatter($num1);
	my $formattednum2 = dollarformatter($num2);
	my $formattedrange = "${formattednum1}-${formattednum2}";
	return $formattedrange;
}

