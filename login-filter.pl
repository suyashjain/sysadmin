#!/usr/bin/perl

use strict;
#use Tie::STDERR 'admin@tech.activeresponsegroup.com','SSH WATCH';
use POSIX;

my $log = "/var/log/secure";
my $ip="";
my $last_ip="";
my $count=0;
my $gotit = 0;
my $limit = 4;
my $date = strftime('%Y-%m-%d',localtime());
my $status=0;


open(LOGFILE, $log);


foreach my $line (<LOGFILE>) {
        if (($line =~ m/(Illegal user)/i) || ($line =~ m/(Failed password)/i) || ($line =~ m/(POSSIBLE BREAKIN ATTEMPT)/i)  ) {
        if ($status == 2 ){     print  "FAILED : ".$line."\n"; }
                my ($ip_addy) = $line =~ m/([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})/;
                $ip = $ip_addy;

if (($ip == $last_ip) and ($ip != '') ){
        $count = $count +1;
if($count==$limit){
        open (FILE, "/etc/hosts.deny");
                foreach my $ip_test (<FILE>) { if($ip_test =~ m/($ip)/) { $gotit = 1; } }
        close(FILE);
        if ($status == 1 ){
                print "\n\n#################\nTRIED $limit  TIMES : ".$ip."   \n#################\n ";
        }

        if($gotit != 1){
        $gotit = 0;
        my $test =$ip=~ m/(192.168.0.[0-9]{1,3})/;
#63.227.23.159
        if($test != 1 ){
                        $test =$ip=~ m/(64.78.239.[0-9]{1,3})/;
                }
   if($test != 1 ){
                        $test =$ip=~ m/(63.227.23.[0-9]{1,3})/;
                }
        if($test != 1 ){
                        $test =$ip=~ m/(216.241.173.[0-9]{1,3})/;
                }
        if($test != 1 ){
                        $test =$ip=~ m/(67.176.95.[0-9]{1,3})/;
                }

        if($test != 1 ){
                        $test =$ip=~ m/(10.96.3.[0-9]{1,3})/;
                }

   if($test != 1 ){
                        $test =$ip=~ m/(10.96.16.[0-9]{1,3})/;
                }
   if($test != 1 ){
                        $test =$ip=~ m/(4.26.23.[0-9]{1,3})/;
                }
   if($test != 1 ){
                        $test =$ip=~ m/(66.9.60.[0-9]{1,3})/;
                }
   if($test != 1 ){
                        $test =$ip=~ m/(69.38.225.[0-9]{1,3})/;
                }
   if($test != 1 ){
                        $test =$ip=~ m/(160.79.155.[0-9]{1,3})/;
                }
                if($test != 1 ){
                if ($status == 1 ){ print "#####################\n";  print "FAILED sshd: ".$ip." #".$date."\n"; } else {

                open (FILE, ">>/etc/hosts.deny");
                        print FILE ("sshd: ".$ip." #".$date." \n");
                close(FILE);
                }

                }

        }
        $gotit = 0;
}

}else{
        $last_ip = $ip;
        $count=0;
}
} # end of ill user loop
}
close (LOGFILE);

