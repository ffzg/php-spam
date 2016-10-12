#!/usr/bin/perl
use warnings;
use strict;
use autodie;

while(<>) {
	chomp;
	my $file = $_;

	open(my $f, '<', $file);
	my $line = <$f>;
	if ( $line =~ s/^<\?php \$mralieaqhv.+?\?>// ) {
		warn "# $file\n";
		open(my $n, '>', $file . '.new');
		print $n $line;
		local $/ = undef;
		my $php = <$f>;
		print $n $php;
		close($n);
		unlink $file;
		rename $file . '.new', $file;
	} else {
		warn "E $file NOT INFECTED [$line]\n";
	}
	close($f);
}
