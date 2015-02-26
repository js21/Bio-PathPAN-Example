#!/usr/bin/env perl
use strict;
use warnings;

BEGIN { unshift( @INC, './lib' ) }
BEGIN { unshift( @INC, '../lib' ) }
BEGIN {
    use Test::Most;
    use_ok('Bio::Darkpan::CommandLine::SpecialScript');
}

my $script_name = 'Bio::Darkpan::CommandLine::SpecialScript';
my $script_parameters = '-s Light';
my @input_args = split(" ", $script_parameters);

my $cmd = "$script_name->new(args => \\\@input_args, $script_name => '$script_name')->run;";
eval($cmd);
warn $@ if $@ ;


done_testing();
