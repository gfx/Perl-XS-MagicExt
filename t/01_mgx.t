#!perl -w

use strict;
use Test::More;

use ExtUtils::ParseXS;
use ExtUtils::CBuilder;
use DynaLoader;

chdir 't';

my $xs = 'MGX.xs';
my $c  = 'MGX.c';

ExtUtils::ParseXS::process_file(
    filename => $xs,
    output   => $c,
);

my $cbuilder = ExtUtils::CBuilder->new();

my $obj = $cbuilder->compile(source => $c, include_dirs => ['..']);
my $lib = $cbuilder->link(objects => $obj, module_name => 'MGX');

ok eval{
    package MGX;
    DynaLoader::bootstrap_inherit(__PACKAGE__);
}, 'bootstrap';

is MGX::do_test(), 22;

done_testing;
