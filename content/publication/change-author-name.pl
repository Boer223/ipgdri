use strict;
# perl change-author-name.pl index.md 
open(AUTHOR,"../author-list.txt");
open(INDEX,$ARGV[0]); # publication index.md file
open(O,">index.2.md");

my %hash;

while(<AUTHOR>){
    chomp;
    my @ar = split(/\t/);
    $hash{$ar[0]} = $ar[1];
}
while(<INDEX>){
    chomp;
    my @ar = split(/-/);
    $ar[1] =~s/^\s+//g;
    #print "$ar[1]\n";
    if(exists $hash{$ar[1]}){
        print O "- $hash{$ar[1]}\n";
    }
    else{
        print O "$_\n";
    }
}
`mv index.2.md index.md`;