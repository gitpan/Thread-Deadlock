require 5.008;
use threads (); # just to force breakage if threads are not available
use ExtUtils::MakeMaker;

WriteMakefile (
 NAME		=> "Thread::Deadlock",
 ($[ >= 5.005) ?
 (AUTHOR	=> 'Elizabeth Mattijsen (liz@dijkmat.nl)',
  ABSTRACT	=> 'report deadlocks with stacktrace') : (),
 VERSION_FROM	=> 'lib/Thread/Deadlock.pm',
 PREREQ_PM	=> {
                   },
);
