
package RandomEntries::Util;

use strict;
use warnings;

sub post_init {
    require MT::Entry;
    
    *MT::Entry::has_column = sub {
        return 1 if (ref $_[1] eq 'ARRAY' && ref ($_[1]->[0]) eq 'HASH' && ref ($_[1]->[0]->{column}) eq 'SCALAR');
        
        require MT::Object;
        MT::Object::has_column (@_);
    };
    
    no warnings 'redefine';
    
    require MT::ObjectDriver::Driver::DBD::Legacy;
    my $orig_db_column_name = \&MT::ObjectDriver::Driver::DBD::Legacy::db_column_name;
    *MT::ObjectDriver::Driver::DBD::Legacy::db_column_name = sub {
        return ${$_[2]} if (ref $_[2]);
        $orig_db_column_name->(@_);
    };
    
    1;
}

1;