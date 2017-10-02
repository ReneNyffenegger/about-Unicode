#!/usr/bin/perl
use warnings;
use strict;
use utf8;


my $subscript_letters = 'ᵃᵇᶜᵈᵉᶠᵍʰⁱʲᵏˡᵐⁿᵒᵖʳˢᵗᵘᵛʷˣʸᶻ'; # Note: superscript q apparantly does not exist

open my $html, '>:utf8', 'subscript-superscript.html';

print $html qq{<html><head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>Unicode: subscripts and superscripts</title>
</head>
<body>
<h1>Unicode: <strike>subscripts and </strike>superscripts</h1>
};

  print $html "Note: superscript q is apparently missing!";

  print $html "<table border=1><tr>";


  for my $c (split //, $subscript_letters) {
     print $html "<td><div style='font-size:60px'>$c</div>" . ord($c) . ' / ' . sprintf("%x", ord($c)) . "</td>";
  }
  
  print $html "</table></tr>";

print $html "See also <a href='Find-Unicode-Character-by-Appearance.html'>Find Unicode Character by visual Appearance</a>.";

print $html "</body></html>";

close $html;
