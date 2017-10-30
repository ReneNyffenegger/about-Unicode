#!/usr/bin/perl
use warnings;
use strict;
use utf8;

open my $in , '<:encoding(utf-8)', 'selection.txt' or die;
open my $out, '>:encoding(utf-8)', 'Find-Unicode-Character-by-Appearance.html' or die;

print $out '<!doctype html>
<html>
<head><title>Find Unicode characters by visual appearance</title>
<meta name="description" content= "Find a Unicode Character if you know approximately how it looks like" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>


<h1>Find Unicode characters by visual appearance</h1>

  This page might be helpful to find Unicode Characters not by its code point but rather by its appearance. For example, if the desired character looks like an <b>R</b>, you might
  find it <a href="#c82">here</a>.
  <p>
  Complete list of <i>index characters</i>:
';

my %look_likes;

while (my $line = <$in>) {

  my $num       = int(substr($line, 0, 6));
  my $char      =     substr($line, 7, 1);
  my $look_like =     substr($line, 10, 3);

  for my $i (0 .. 2) {
    if (substr($look_like, $i, 1) ne ' ') {
      add_look_like(substr($look_like, $i, 1), $char, $num);
    }
  }



}

for my $look_like (sort keys %look_likes) {
  print $out "<a href='#c" . ord($look_like) . "'>$look_like</a> ";
}

for my $look_like (sort keys %look_likes) {

  print $out "<h2 id='c" . ord($look_like) . "'>$look_like</h2>\n";

  for my $item (@{$look_likes{$look_like}}) {

#   print $out keys %$item;
    print $out "$item->{char} ($item->{num})<br>";

  }

}

sub add_look_like {

  my $look_like = shift;
  my $char      = shift;
  my $num       = shift;


  push @{$look_likes{$look_like}}, {num => $num, char=>$char};

}

print $out "\n<hr>See also <a href='http://www.unicode.org/Public/security/latest/confusables.txt'>confusables.txt</a>,
  <a href='https://stackoverflow.com/questions/4846365/find-characters-that-are-similar-glyphically-in-unicode'>https://stackoverflow.com/questions/4846365/find-characters-that-are-similar-glyphically-in-unicode</a> (Especially <a href='https://stackoverflow.com/a/9506068/180275'>This answer</a>),
  <a href='https://stackoverflow.com/questions/9491890/is-there-a-list-of-characters-that-look-similar-to-english-letters'>https://stackoverflow.com/questions/9491890/is-there-a-list-of-characters-that-look-similar-to-english-letters</a>
  <a href='https://stackoverflow.com/questions/1008802/converting-symbols-accent-letters-to-english-alphabet'>https://stackoverflow.com/questions/1008802/converting-symbols-accent-letters-to-english-alphabet</a>
  <p><a href='http://www.fileformat.info/info/unicode/block/letterlike_symbols/images.htm'>Letter like symbols</a>
  <p><a href='subscript-superscript.html'>Superscript Unicode Characters</a>
  <p><a href='/development/web/html/escape-characters.html'>HTML Escape characters</a>
  ";
print $out "\n</html>";
