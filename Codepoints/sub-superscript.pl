#!/usr/bin/perl
use warnings;
use strict;
use utf8;


  my $superscript_letters   = 'ᵃᵇᶜᵈᵉᶠᵍʰⁱʲᵏˡᵐⁿᵒᵖ#ʳˢᵗᵘᵛʷˣʸᶻ'; # Note: superscript q apparantly does not exist
  my $superscript_LETTERS   = 'ᴬᴮ#ᴰᴱ#ᴳᴴᴵᴶᴷᴸᴹᴺᴼᴾ#ᴿ#ᵀᵁⱽᵂ###';
  my $superscript_SmallCaps = '########ᶦᶫ##ᶰ#######ᶸ#####';
  my $subscript_letters     = 'ₐ###ₑ##ₕᵢⱼₖₗₘₙₒₚ#ᵣₛₜᵤᵥ#ₓ##';
# my $overscript_letters    = '######◌ᷛ####◌ᷞ◌ᷟ◌ᷡ###◌ᷢ########';
# my $underscript_letters   = '######◌ᷛ####◌ᷞ◌ᷟ◌ᷡ###◌ᷢ########';

open my $html, '>:utf8', 'subscript-superscript.html';

print $html qq{<html><head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>Unicode: subscript and superscript letters</title>
</head>
<body>
<h1>Unicode: subscripts and superscripts letters</h1>
};

  print $html "Note: superscript q is apparently missing!";

  print $html "<table border=1>";

  printLetterRow($superscript_letters  );
  printLetterRow($superscript_LETTERS  );
  printLetterRow($superscript_SmallCaps);
  printLetterRow($subscript_letters    );
# printLetterRow($overscript_letters   );

  
  print $html "</table>";

print $html "<p>See also <a href='Find-Unicode-Character-by-Appearance.html'>Find Unicode Character by visual Appearance</a>, <a href='https://en.wikipedia.org/wiki/Unicode_subscripts_and_superscripts'>Wikipedia</a> etc.";

print $html "</body></html>";

close $html;

sub printLetterRow {

  my $letters = shift;

  print $html "<tr>";

  for my $c (split //, $letters) {
     print $html "<td>";
     
     if ($c ne '#') {
       print $html "<div style='font-size:60px'>$c</div>" . ord($c) . ' / ' . sprintf("%x", ord($c));
     }
     else {
       print $html "n/a";
     }
     print $html "</td>";
  }

  print $html "</tr>";

}
