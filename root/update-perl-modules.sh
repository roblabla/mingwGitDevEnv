#!/bin/sh

# Patch the default to be automatic configuration.
patch -p 0 -N << "EOF"
--- lib/perl5/5.8/CPAN/FirstTime.pm.orig	Wed Apr 24 14:09:49 2013
+++ lib/perl5/5.8/CPAN/FirstTime.pm	Thu Apr 25 11:41:06 2013
@@ -70,7 +70,7 @@
 
     my $manual_conf =
 	ExtUtils::MakeMaker::prompt("Are you ready for manual configuration?",
-				    "yes");
+				    "no");
     my $fastread;
     {
       local $^W;
EOF

# Force an update of Prove to a version that has "--jobs".
PERL_MM_USE_DEFAULT=1 perl -MCPAN -e "CPAN::Shell->force(qw(install App::Prove));"