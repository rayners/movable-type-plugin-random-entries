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

    # Prevents MT5 from throwing an error if no limit is specified, but doesn't
    # actually enforce the limit?
    $args->{limit} = '1';

    1;
}

1;
