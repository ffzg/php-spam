#!/usr/bin/perl
use warnings;
use strict;
use autodie;
use Data::Dumper;

my $stat;

while(<>) {
	chomp;
	my $file = $_;

	if ( -s $file == 0 ) {
		print "EMPTY $file\n";
		next;
	}

	open(my $f, '<', $file);
	my $line = <$f>;
	if ( $line =~ m/^(<\?php.+?\?>)/ ) {
		my $php = $1;
		if ( length($php) > 80 ) {
#			warn "$file\t$line\n";
			print "$file\t", $stat->{$php}++, "\t$php\n";
		}
	}
	close($f);
}

print Dumper($stat);
