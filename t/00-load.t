#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More tests => 1;

use_ok( 'Template::Plugin::Calendar::Simple' ) or BAIL_OUT( "can't use module" );
