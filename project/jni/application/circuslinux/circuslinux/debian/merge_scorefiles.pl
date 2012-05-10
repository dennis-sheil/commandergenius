#!/usr/bin/perl -w

# Copyright (c) 2003 Christian T. Steigies
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

# merge multiple /home/<user>/.circuslinux files into one
# /var/games/circuslinux/scores files
#
# usage: 
# merge_scorefiles.pl /home/<user1>/.circuslinux ... /home/<usern>.circuslinux
# mv merged_score /var/games/circuslinux/scores
# each user should remove his ~/.circuslinux file _after_ running circuslinux
# his config will be saved in ~/.circuslinuxrc by circuslinux

my $i=0;
my @line = ("# Circus Linux! options file" , "", "# Highscores:", "");
my @highscore;
my @highscorer;

my $filename = "/var/games/circuslinux/scorefile";

if ($#ARGV < 0) {
 die "no scorefiles given, please pass at least one scorefile as argument.\n";
}

if (-e $filename) {
  die "scorefile exists already, please move it out of the way.\n";
}

open OUT, ">".$filename
  or die "can not open scorefile for output!\n";

for ($i = 0; $i < 8; $i++) {
  $highscore[$i] = -1;
  $score[$i] = -1;
}

while (@ARGV) {
   $this = shift(@ARGV);
#   print "$this\n";

   open INPUT, $this
     or die "can not open input file $this";
#   while (defined($_ = <INPUT>)) {
   for ($i = 0; $i < 4; $i++) {
     $_ = <INPUT>;
     chomp;
     if ($_ eq $line[$i]) {
#       print "line$i found\n";
     } else {
       die "not a valid score file!\n";
     }
   }

   for ($i = 0; $i < 8; $i++) {
     $_ = <INPUT>;
     chomp;
     if (substr($_, 0, 11) eq ("highscore".$i."=")) {
       $score[$i] = substr($_, 11);
#       print "score $score[$i]\n";
     }

     $_ = <INPUT>;
     chomp;
     if (substr($_, 0, 12) eq ("highscorer".$i."=")) {
       $scorer[$i] = substr($_, 12);
#       print "scorer $scorer[$i]\n";
     }

     $_ = <INPUT>;
#     chomp;
#     if ($_ eq "") {
#       print "newline\n";
#     }

     if ($score[$i] > $highscore[$i]) {
       $highscore[$i] = $score[$i];
       $highscorer[$i] = $scorer[$i];
     }
   }

#     print "|$_|\n"
# check first 4 lines if its a score file
# read highscore, highscorer 0..7, newline
# check for max and save
# write out new scorefile after reading all input files
 }

for ($i = 0; $i < 4; $i++) {
  printf (OUT "%s\n", $line[$i]);
}

for ($i = 0; $i < 8; $i++) {
  printf (OUT "highscore%i=%s\n", $i, $highscore[$i]);
  printf (OUT "highscorer%i=%s\n\n", $i, $highscorer[$i]);
}

printf (OUT "\n# (File automatically created.)\n");
