
package RandomEntries::Tags;

use strict;
use warnings;

my %rnd_function = (
    mysql => 'rand()',
    sqlite => 'random()',
    postgres => 'random()'
);

sub _filter_entries_random {
    my ($ctx, $args, $cond) = @_;

    require MT;
    my $od = MT->config->ObjectDriver;
    $od =~ s/^.*:://;
    my $rf = $rnd_function{$od};
    
    return unless $rf;
    
    $args->{sort_by} = [ { column => \$rf } ];
    $ctx->{args}->{direction} = 'descend';
    
    1;
}


1;
