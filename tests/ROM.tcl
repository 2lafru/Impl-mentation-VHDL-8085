add wave -position insertpoint  \
sim:/rom/taille \
sim:/rom/CS \
sim:/rom/OE \
sim:/rom/adresse \
sim:/rom/sortie \
sim:/rom/memoire \
sim:/rom/sortieInterieure

force -freeze sim:/rom/CS 0 0
force -freeze sim:/rom/OE 0 0
force -freeze sim:/rom/adresse 0000101 0
run
run
run
run
run
run
run
force -freeze sim:/rom/OE 1 0
run
force -freeze sim:/rom/OE 0 0
run
force -freeze sim:/rom/CS 1 0
run
force -freeze sim:/rom/adresse 0100000 0
run
run
run
run
run
run
run
run