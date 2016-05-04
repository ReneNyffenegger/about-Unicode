#!/usr/bin/perl
use warnings;
use strict;
use utf8;
use Encode;

use constant filename => 'Bärlauch';

open (my $out, '>', filename) or die;
close $out;

opendir(my $dir, '.') or die;
while (my $filename_read = readdir($dir)) {
  $filename_read = decode('utf8', $filename_read);
  print "found\n" if $filename_read eq filename;
}
