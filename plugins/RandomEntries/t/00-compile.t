
use lib qw( t/lib lib extlib );

use strict;
use warnings;

use MT::Test;
use Test::More tests => 3;

require MT;
ok( MT->component('randomentries'), "RandomEntries loaded okay" );
require_ok('RandomEntries::Tags');
require_ok('RandomEntries::Util');

1;
