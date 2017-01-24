#!/usr/bin/perl
use warnings;
use strict;

open (my $o, '>:encoding(utf8)', 'o.txt') or die;

for my $r (-10 .. -1) {

  my $first = 120068 + 26 * $r;
# my $first = 120488 + 26 * $r;
# my $first = 120782 + 10 * $r;

  my $l = 'A';
  $l = 'a' if $r % 2;
  for my $i (0 .. 25) {
    printf $o ("%d %s  %s           \n", $first + $i, chr($first+$i), chr($i + ord($l)));
  }
}

close $o;
