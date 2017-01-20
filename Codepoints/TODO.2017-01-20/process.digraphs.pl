#!/usr/bin/perl
use warnings;
use strict;

use Sort::Merge::Flat;

open (my $dig      , '<', 'digraphs.txt'    ) or die;
open (my $sel_in   , '<', 'selection.txt.in') or die;
open (my $sel_out  , '>', 'sel.txt'         ) or die;

Sort::Merge::Flat::go(   
  
  [
    sub { read_key_value(0) },
    sub { read_key_value(1) },
  ],
  sub { $_[0] < $_[1] },
  sub { join ';', @_ },
  sub { my ($k, $vals) = @_; print $fh_out "$k: $vals\n" }

);



my $cur_dig;
my $cur_sel;

my ($dig_sign, $dig_2);
my ($sel_sign, $sel_2, $sel_entity, $sel_looks_like);

read_digraph();

while (1) {




}

sub read_selection {

  my $sel_line = <$sel>;

  $cur_sel        = substr($sel_line, 0, 5);
  $sel_looks_like = substr($sel_line, 9, 3);
  $sel_entity     = substr($sel_line,13, 7);

}

sub read_digraph {

  my $dig_line = <$dig>;

  my $dummy;

  ($dig_sign, $dig_2, $dummy, $cur_dig) = split ' ', $dig_line;

  $cur_dig = sprintf("%5d", $cur_dig);


}
