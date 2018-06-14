#!/usr/bin/perl
use warnings;
use strict;
use autodie;
use Data::Dumper;

# sudo find /srv/www/ -size +7k -name '*.php' | ./this-script

my $stat;
my $count = 0;

while(<>) {
	chomp;
	my $file = $_;

	print STDERR "." if $count++ % 1000 == 0;

	if ( -s $file == 0 ) {
		print STDERR "\nEMPTY $file\n";
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
