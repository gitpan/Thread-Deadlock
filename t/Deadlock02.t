BEGIN {				# Magic Perl CORE pragma
    if ($ENV{PERL_CORE}) {
        chdir 't' if -d 't';
        @INC = '../lib';
    }
}

use Test::More tests => 4;

my $filename = 'report';

undef( $/ );
ok( open( my $handle,'<',$filename ),	'check opening of report file' );
is( <$handle>,<<EOD,			'check report itself' );
*** Thread::Deadlock report ***
#0: cond_signal() at t/Deadlock01.t line 40

#2: cond_wait() at t/Deadlock01.t line 46
	main::__ANON__() called at t/Deadlock01.t line 47
	thread started at t/Deadlock01.t line 47

EOD
ok( close( $handle ),			'check closing of file' );
ok( unlink( $filename ),		'check removal of file' );
