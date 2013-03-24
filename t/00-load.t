#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Template::Plugin::Calendar::Simple' ) || print "Bail out!\n";
}

diag( "Testing Template::Plugin::Calendar::Simple $Template::Plugin::Calendar::Simple::VERSION, Perl $], $^X" );
