#!/usr/bin/env perl6
my $data1 = slurp "data_1.txt";
my $data2 = slurp "data_2.txt";
my $i = 0;
my %listTotal = ();
my $data_re;

for $data1.lines -> $data_re {
    $data_re ~~ m/(\w*)(\s+)(\d*)/;
    %listTotal{$0}{"age"} = $2};

#print %list1;

for $data2.lines -> $data_re {
    $data_re ~~ m/(\w*)(\s+)(\d ** { 1 .. 3 }\-\d ** {1 .. 2 }\-\d ** {1 .. 2})/;
    %listTotal{$0}{"Phone"} = $2;
}

#print %list1;

my $Final_cut = ("Name  Age  Phone\n");
loop (my $l = 0; $l < %listTotal.elems; ++$l) {
    my $items = !%listTotal.keys[$l] ?? '-' !! %listTotal.keys[$l];
    my $age = !%listTotal.values[$l]{"age"} ?? '-' !! %listTotal.values[$l]{"age"};
    my $phone = !%listTotal.values[$l]{"Phone"} ?? '   -  ' !! %listTotal.values[$l]{"Phone"};
    $Final_cut ~= ("$items  $age  $phone\n");
}

print $Final_cut;
spurt "Final_Cut.txt", $Final_cut; #Запись в файл
