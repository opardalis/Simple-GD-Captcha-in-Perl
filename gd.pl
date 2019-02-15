#!/usr/bin/perl

   use GD::SecurityImage;

$a = rand(20);
$a =~ s/\..*$//;
$a = ($a % 3);
$a++;
$b = rand(300);
$b =~ s/\..*$//;
$b = ($b + 100);
$b = ($b * 5);
$b =~ m/(..)$/;
$b = $1;
$c = rand(300);
$c =~ s/\..*$//;
$c = ($c + 100);
$c = ($c * 4);
$c =~ m/(..)$/;
$c = $1;
$d = rand(30);
$d =~ s/\..*$//;
$d = ($d % 3);
$d++;
$digit = "$a"."$b"."$c"."$d";


   # Create a normal image
   my $image = GD::SecurityImage->new(width   => 90,
                                      height  => 25,
                                      lines   => 1,
                                      gd_font => 'large');

      $image->random("$digit");
      $image->create(normal => 'rect');

   my($image_data, $mime_type, $random_number) = $image->out;

print "Content-type: image/$mime_type\n\n";
binmode STDOUT;
print STDOUT $image_data;

exit;
