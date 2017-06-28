#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dumper;
use Test::Files;
use File::Temp;

BEGIN { unshift( @INC, './lib' ) }

BEGIN {
    use Test::Most;
    use_ok('Bio::ReferenceManager::Indexers::Bowtie2');
}

my $obj;

ok( $obj = Bio::ReferenceManager::Indexers::Bowtie2->new(), 'initialise with defaults');
is( $obj->_get_version_command, 'bowtie2-build --version 2>&1', 'get version command' );
ok(my $software_version = $obj->software_version(), 'get software version');
like($software_version, qr/^[]\d]+\.[\d]+/, 'got a version number out');

done_testing();
