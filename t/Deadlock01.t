BEGIN {				# Magic Perl CORE pragma
    if ($ENV{PERL_CORE}) {
        chdir 't' if -d 't';
        @INC = '../lib';
    }
}

use Test::More tests => 3;

BEGIN { use_ok( 'Thread::Deadlock' ) }
BEGIN { use_ok( 'threads::shared' ) } # export cond_family

can_ok( 'Thread::Deadlock',qw(
 report
) );
Thread::Deadlock->report( 'report' );

my $lock : shared;

my $thread = threads->new( sub {
 lock( $lock );
 $lock = 1;
 cond_wait( $lock );
} );
threads->yield until $lock;

{
 lock( $lock );
 cond_signal( $lock );
}
$thread->join;
