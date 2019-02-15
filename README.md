# Simple-GD-Captcha-in-Perl
A simple 6-digit captcha test that can be validated in your code

This Perl script generates a seemingly random 6-digit code. However, the code itself follows very specific 
logic that when factored down using a combination of modulus and addition can be verified in a 3rd party app
to perform basic captcha functions to thwart a bot on say a contact form submission page. The postive is the
code is very human readable, unlike some other captcha's.

How to use it:

Say you have a basic web contact form. Load the random 6-digit code as follows:

<img src="/cgi-bin/gd.pl">

Then have your user re-enter the code as they see it. Then in your form submission CGI validate the code with
the below logic, this example uses Perl where $ARGV is the data input from the web user re-entering the code:

# Verify security code                                         
my $digit = $ARGV;
my @digit_array = split(//,$digit);

my $ad_test = ($digit_array[0] + $digit_array[5]);
my $b_test = "$digit_array[1]" . "$digit_array[2]";
   $b_test = ($b_test % 5);
my $c_test = "$digit_array[3]" . "$digit_array[4]";
   $c_test = ($c_test % 4);

if(!(($ad_test < 7) && ($ad_test > 1) && ($b_test == 0) && ($c_test == 0)))
{
  # Code validation failed
  exit;
}
