force -freeze sim:/ram/CS 0 0
force -freeze sim:/ram/RD 0 0
force -freeze sim:/ram/WR 1 0
force -freeze sim:/ram/adresse 000101 0
run
run
run
run
run
run
force -freeze sim:/ram/RD 1 0
run
force -freeze sim:/ram/RD 0 0
run
force -freeze sim:/ram/entree 11110000 0
run
force -freeze sim:/ram/WR 0 0
run
run
run
run
run